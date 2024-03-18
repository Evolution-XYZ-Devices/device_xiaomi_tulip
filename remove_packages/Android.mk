LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RemovePkgs
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := \
    AppDirectedSMSService \
    BetterBugStub \
    ConnMO \
    DCMO \
    DevicePolicyPrebuilt \
    DMService \
    Drive \
    MaestroPrebuilt \
    Maps \
    PlayAutoInstallConfig \
    PrebuiltGmail \
    SCONE \
    ScribePrebuilt \
    Showcase \
    SoundAmplifierPrebuilt \
    talkback \
    Tycho \
    VZWAPNLib \
    VzwOmaTrigger \
    WfcActivation
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
