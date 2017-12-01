#
# Copyright (C) 2017 The Android-x86 Open Source Project
#
# by Tomasz Witke <kyvaith@gmail.com>
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

# include atv default stuff
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioTv.mk)
$(call inherit-product-if-exists, external/svox/pico/lang/all_pico_languages.mk)
$(call inherit-product-if-exists, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/dancing-script/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/carrois-gothic-sc/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/coming-soon/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/cutive-mono/fonts.mk)
$(call inherit-product-if-exists, external/noto-fonts/fonts.mk)
$(call inherit-product-if-exists, external/roboto-fonts/fonts.mk)
$(call inherit-product-if-exists, external/hyphenation-patterns/patterns.mk)
$(call inherit-product-if-exists, frameworks/base/data/keyboards/keyboards.mk)
$(call inherit-product-if-exists, frameworks/webview/chromium/chromium.mk)
$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)
$(call inherit-product-if-exists, vendor/intel/houdini/houdini.mk)

# Overrides
PRODUCT_NAME := android_x86_tv
PRODUCT_DEVICE := atv
PRODUCT_BRAND := Android
PRODUCT_MODEL := fugu
PRODUCT_MANUFACTURER := ASUS

PRODUCT_IS_ATV := true
PRODUCT_CHARACTERISTICS := tv
GAPPS_VARIANT := tvstock

PRODUCT_PACKAGES += \
    TvProvider \
    TvSettings \
    tv_input.default

# Boot Animation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bootanimation-580-256col.zip:system/media/bootanimation.zip

# This property defines the tutorial content for this device
PRODUCT_PROPERTY_OVERRIDES += \
    ro.tutorials_content.android=android8

# Content for ATV Tutorials / Post-Setup Tour
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/tutorial-library-google.zip.etag:system/media/tutorial-library-google.zip.etag \
    $(LOCAL_PATH)/tutorial-library-google.zip:system/media/tutorial-library-google.zip

# Key layout files
PRODUCT_COPY_FILES += \
    $(foreach f,$(wildcard $(LOCAL_PATH)/idc/*.idc $(LOCAL_PATH)/keylayout/*.kl),$(f):$(subst $(LOCAL_PATH),system/usr,$(f)))

# DRM Protected Video
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1
USE_INTEL_SECURE_AVC := true

# Widevine libs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/mediadrm/libwvdrmengine.so:system/vendor/lib/mediadrm/libwvdrmengine.so \
    $(LOCAL_PATH)/mediadrm/libplayreadydrmplugin.so:system/vendor/lib/mediadrm/libplayreadydrmplugin.so 

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/tv_core_hardware.xml:system/etc/permissions/tv_core_hardware.xml \
    $(LOCAL_PATH)/permissions/com.google.android.tv.installed.xml:system/etc/permissions/com.google.android.tv.installed.xml

# To enable access to /dev/dvb*
BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Video Post Processing
TARGET_HAS_ISV := true

# Enable frame-exact AV sync
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.avsync=true

# psb video
PRODUCT_PACKAGES += \
    pvr_drv_video

# pvr
PRODUCT_PACKAGES += \
    libpvr2d

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Hdmi CEC: Fugu works as a playback device (4).
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4

# Hdmi CEC: Disable 'Set Menu Language' feature.
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.set_menu_language=false

#GFX Config
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version-1_0_3.xml

# TV Input HAL
PRODUCT_PACKAGES += \
    android.hardware.tv.input@1.0-impl

# HDMI CEC HAL
PRODUCT_PACKAGES += \
    android.hardware.tv.cec@1.0-impl

