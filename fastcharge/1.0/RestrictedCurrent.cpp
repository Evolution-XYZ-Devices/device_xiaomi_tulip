/*
 * Copyright (C) 2023 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "fastcharge@1.0-service"

#define RESTRICTED_CURRENT_PATH "/sys/class/qcom-battery/restrict_cur"

#define MAX_SUPPORTED_CURRENT 3000 /*mA*/

#include "RestrictedCurrent.h"
#include <android-base/logging.h>
#include <fstream>
#include <iostream>
#include <stdint.h>

namespace vendor {
namespace lineage {
namespace fastcharge {
namespace V1_0 {
namespace implementation {

/*
 * Write value to path and close file.
 */
template <typename T> static void set(const std::string &path, const T &value) {
  std::ofstream file(path);

  if (!file) {
    PLOG(ERROR) << "Failed to open: " << path;
    return;
  }

  LOG(DEBUG) << "write: " << path << " value: " << value;

  file << value << std::endl;

  if (!file) {
    PLOG(ERROR) << "Failed to write: " << path << " value: " << value;
  }
}

template <typename T> static T get(const std::string &path, const T &def) {
  std::ifstream file(path);

  if (!file) {
    PLOG(ERROR) << "Failed to open: " << path;
    return def;
  }

  T result;

  file >> result;

  if (file.fail()) {
    PLOG(ERROR) << "Failed to read: " << path;
    return def;
  } else {
    LOG(DEBUG) << "read: " << path << " value: " << result;
    return result;
  }
}

RestrictedCurrent::RestrictedCurrent() {}

/*
 * Get the restricted current value from the corresponding sysnode
 */
Return<int32_t> RestrictedCurrent::getRestrictedCurrent() {
  int current_uA = get(RESTRICTED_CURRENT_PATH, 0); /* current is stored in microampere */
  int current_mA = current_uA / 1000; /* convert to miliampere */
  return current_mA; /* always return mA */
}

/*
 * Set the maximum allowed current (restricted current), when fast charging is disabled
 */
Return<bool> RestrictedCurrent::setRestrictedCurrent(int32_t current_mA) {
  bool success = false;
  if (current_mA > 0 && current_mA <= MAX_SUPPORTED_CURRENT) { /* validate */
    int current_uA = current_mA * 1000; /* convert to microampere */
    set(RESTRICTED_CURRENT_PATH, current_uA); /* store */
    if (current_mA == getRestrictedCurrent()) { /* check */
      success = true;
    }
  }
  return success;
}

/*
 * Get the maximum supported current
 */
Return<int32_t> RestrictedCurrent::getMaxSupportedCurrent() {
  return MAX_SUPPORTED_CURRENT; /* always return mA */
}

} // namespace implementation
} // namespace V1_0
} // namespace fastcharge
} // namespace lineage
} // namespace vendor
