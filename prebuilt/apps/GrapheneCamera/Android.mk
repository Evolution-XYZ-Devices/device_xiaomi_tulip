LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := GrapheneCamera
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := Camera.apk
LOCAL_OPTIONAL_USES_LIBRARIES := androidx.camera.extensions.impl
LOCAL_OVERRIDES_PACKAGES := Aperture Camera Camera2 Flash

include $(BUILD_PREBUILT)
