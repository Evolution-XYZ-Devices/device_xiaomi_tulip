LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RemovePkgs
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := AmbientSensePrebuilt AppDirectedSMSService BetterBug Camera2 CarrierMetrics CarrierSetup CarrierWifi ConnMO DCMO
LOCAL_OVERRIDES_PACKAGES += DMService DeviceIntelligenceNetworkPrebuilt DevicePolicyPrebuilt DiagnosticsToolPrebuilt Drive FilesPrebuilt GCS
LOCAL_OVERRIDES_PACKAGES += HelpRtcPrebuilt LocationHistoryPrebuilt MaestroPrebuilt Maps MarkupGoogle MicropaperPrebuilt MyVerizonServices
LOCAL_OVERRIDES_PACKAGES += NgaResources OdadPrebuilt OemDmTrigger Photos PixelLiveWallpaperPrebuilt PrebuiltGmail RecorderPrebuilt
LOCAL_OVERRIDES_PACKAGES += SCONE SafetyHubPrebuilt ScribePrebuilt SecurityHubPrebuilt Showcase Snap SoundAmplifierPrebuilt SprintDM
LOCAL_OVERRIDES_PACKAGES += SprintHM TurboAdapter TurboPrebuilt Tycho USCCDM VZWAPNLib VzwOmaTrigger WellbeingPrebuilt WfcActivation
LOCAL_OVERRIDES_PACKAGES += arcore obdm_stub
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
