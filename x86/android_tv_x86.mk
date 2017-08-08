#
# Copyright (C) 2014 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# includes the base of Android-x86 platform
$(call inherit-product, device/generic/common/x86.mk)
$(call inherit-product, device/google/atv/products/atv_base.mk)
$(call inherit-product-if-exists, vendor/google/build/opengapps-packages.mk)

# Overrides
PRODUCT_NAME := android_tv_x86
PRODUCT_BRAND := NVIDIA
PRODUCT_DEVICE := x86
PRODUCT_MODEL := SHIELD Android TV
PRODUCT_MANUFACTURER := NVIDIA
PRODUCT_CHARACTERISTICS := tv
GAPPS_VARIANT := tvstock

# The feature com.google.android.tv.installed is used to tell whether a device
# has the pre-installed Live Channels app. This is necessary for the Play Store
# to identify the compatible devices that can install later updates of the app.
# Other permissions are needed to stop ATV apps crashing
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/privapp-permissions-google.xml:system/etc/permissions/privapp-permissions-google.xml \
    $(LOCAL_PATH)/permissions/privapp-permissions-platform.xml:system/etc/permissions/privapp-permissions-platform.xml \
    $(LOCAL_PATH)/permissions/privapp-permissions-atv.xml:system/etc/permissions/privapp-permissions-atv.xml

# DRM Protected Video
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1
USE_INTEL_SECURE_AVC := true

# Widevine blob(s)
$(call inherit-product-if-exists, vendor/widevine/fugu/device-partial.mk)

# Need AppWidget permission to prevent from Launcher's crash.
# TODO(pattjin): Remove this when the TV Launcher is used, which does not support AppWidget.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    CMFileManager

# Hdmi CEC: Fugu works as a playback device (4).
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4

# Hdmi CEC: Disable 'Set Menu Language' feature.
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.set_menu_language=false

# Keep secure decoders in mediaserver process
PRODUCT_PROPERTY_OVERRIDES += media.stagefright.less-secure=true

# Boot Animation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bootanimation-580-256col.zip:system/media/bootanimation.zip

#Video
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_tv.xml:system/etc/media_codecs_google_tv.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/mfx_omxil_core.conf:system/etc/mfx_omxil_core.conf \
    $(LOCAL_PATH)/video_isv_profile.xml:system/etc/video_isv_profile.xml \
    $(LOCAL_PATH)/codec_resources_limitation.xml:system/etc/codec_resources_limitation.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

#GFX Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/powervr.ini:system/etc/powervr.ini \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version-1_0_3.xml

# specific management of sep_policy.conf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sep_policy.conf:system/etc/security/sep_policy.conf

# Get rid of dex preoptimization to save space within system.img at the one
# time cost of dexing on first boot.
WITH_DEXPREOPT_BOOT_IMG_ONLY := false
WITH_DEXPREOPT := true

# Some CTS tests will be skipped based on what the initial API level that
# shipped on device was.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=21

