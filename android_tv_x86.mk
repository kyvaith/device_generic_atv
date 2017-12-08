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
$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)

# TODO: remove when Android-x86 project will provide them
# include prebuild houdini libs
$(call inherit-product-if-exists, vendor/intel/houdini/houdini.mk)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.native.bridge=libhoudini.so

# Target
PRODUCT_NAME := android_tv_x86
PRODUCT_DEVICE := x86
PRODUCT_BRAND := Android
TARGET_KERNEL_ARCH := x86_64

# Need to fake fugu, to get everything work properly
PRODUCT_MODEL := fugu
PRODUCT_MANUFACTURER := ASUS

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.manufacturer=Asus \
    ro.product.model=Nexus \Player \
    sys.display-size=3840x2160 \
    ro.nrdp.modelgroup=NEXUSPLAYERFUGU

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

# Vendor Interface Manifest
DEVICE_MATRIX_FILE := $(LOCAL_PATH)/compatibility_matrix.xml

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

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.less-secure=true \
    drm.service.enabled=true \
    ro.com.widevine.cachesize=16777216 \
    media.amplayer.widevineenable=true
   
# Widevine libs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/mediadrm/libwvdrmengine.so:system/vendor/lib/mediadrm/libwvdrmengine.so \
    $(LOCAL_PATH)/mediadrm/libplayreadydrmplugin.so:system/vendor/lib/mediadrm/libplayreadydrmplugin.so

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/tv_core_hardware.xml:system/etc/permissions/tv_core_hardware.xml

# To enable access to /dev/dvb*
BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# specific management of sep_policy.conf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sep_policy.conf:system/etc/security/sep_policy.conf

# Video
$(shell rm -f $(TARGET_OUT_ETC)/media_codecs.xml)
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_tv.xml:system/etc/media_codecs_google_tv.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml

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

PRODUCT_PROPERTY_OVERRIDES += \
    ro.platform.support.dts=true \
    ro.platform.support.dolby=true

# IMG graphics
PRODUCT_PACKAGES += \
    IMG_graphics \

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Default OMX service to non-Treble
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# libva
PRODUCT_PACKAGES += \
    libva \
    libva-android \
    libva-tpi \
    vainfo

#libstagefrighthw
PRODUCT_PACKAGES += \
    libstagefrighthw

# libmix
PRODUCT_PACKAGES += \
    libmixvbp_mpeg4 \
    libmixvbp_h264 \
    libmixvbp_h264secure \
    libmixvbp_vc1 \
    libmixvbp_vp8 \
    libmixvbp_mpeg2 \
    libmixvbp \
    libva_videodecoder \
    libva_videoencoder

PRODUCT_PACKAGES += \
    libwrs_omxil_common \
    libwrs_omxil_core_pvwrapped \
    libOMXVideoDecoderAVC \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoDecoderWMV \
    libOMXVideoDecoderVP8 \
    libOMXVideoDecoderMPEG2 \
    libOMXVideoDecoderVP9HWR \
    libOMXVideoDecoderVP9Hybrid \
    libOMXVideoEncoderAVC \
    libOMXVideoEncoderH263 \
    libOMXVideoEncoderMPEG4 \
    libOMXVideoEncoderVP8

#libISV
PRODUCT_PACKAGES += libisv_omx_core

# pvr
PRODUCT_PACKAGES += \
    libpvr2d

# libdrm
PRODUCT_PACKAGES += \
    libdrm \
    dristat \
    drmstat

#GFX Config
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version-1_0_3.xml

# Thermal itux
ENABLE_ITUXD := true
PRODUCT_PACKAGES += \
    ituxd

# Memtrack HAL
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl

# Power HAL
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \

PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \

# Some CTS tests will be skipped based on what the initial API level that
# shipped on device was.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=21

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609 \
    ro.hwui.drop_shadow_cache_size=4.0 \
    ro.hwui.gradient_cache_size=0.8 \
    ro.hwui.layer_cache_size=32.0 \
    ro.hwui.path_cache_size=24.0 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=512 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.texture_cache_size=48.0 \

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.intel.isv.vpp=1 \
    persist.intel.isv.frc=1

