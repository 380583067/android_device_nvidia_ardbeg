# Copyright (C) 2014 The CyanogenMod Project
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

LOCAL_PATH := device/nvidia/ardbeg

# AAPT Screen & Density
PRODUCT_AAPT_CONFIG += xlarge large
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/asound.conf:system/etc/asound.conf \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    $(LOCAL_PATH)/audio/nvaudio_fx.xml:system/etc/nvaudio_fx.xml \
    $(LOCAL_PATH)/audio/audio.ardbeg.xml:system/etc/audio.ardbeg.xml

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.tegra \
    libaudiohalcm \
    libaudio-resampler \
    libaudiospdif \
    libstagefrighthw \
    libtinycompress \
    tinycap_ardbeg \
    tinymix_ardbeg \
    tinyplay_ardbeg \
    libtinyalsa_ardbeg \
    libtinyalsa \
    xaplay \
    record \
    recordvideo


# ATV Build Switch
ifeq ($(ALTERNATE_BUILD),true)
$(call inherit-product, device/nvidia/ardbeg/device_atv.mk)
else
$(call inherit-product, device/nvidia/ardbeg/device_tablet.mk)
endif

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

PRODUCT_PACKAGES += \
    libbt-vendor

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/model_frontal.xml:system/etc/model_frontal.xml \
    $(LOCAL_PATH)/camera/nvcamera.conf:system/etc/nvcamera.conf

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Calibration
PRODUCT_PACKAGES += CalibNotifier
PRODUCT_COPY_FILES += \
    device/nvidia/ardbeg/calibration/calib_cfg.xml:system/etc/calib_cfg.xml

# Dalvik Heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/comms/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    $(LOCAL_PATH)/comms/gps.conf:system/etc/gps.conf

# Light HAL
PRODUCT_PACKAGES += \
    lights.tegra

# Media Codec & Profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Modules (Prebuilt Kernel)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/modules/mbt8897.ko:system/lib/modules/mbt8897.ko \
	$(LOCAL_PATH)/prebuilt/modules/sd8897.ko:system/lib/modules/sd8897.ko \
	$(LOCAL_PATH)/prebuilt/modules/sd8897mlan.ko:system/lib/modules/sd8897mlan.ko \
	$(LOCAL_PATH)/prebuilt/modules/modules.alias:system/lib/modules/modules.alias \
	$(LOCAL_PATH)/prebuilt/modules/modules.dep:system/lib/modules/modules.dep \
	$(LOCAL_PATH)/prebuilt/modules/modules.softdep:system/lib/modules/modules.softdep

# NVIDIA Feature Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.feature.xml:system/etc/permissions/com.nvidia.feature.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.feature.opengl4.xml:system/etc/permissions/com.nvidia.feature.opengl4.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.shieldtech.xml:system/etc/permissions/com.nvidia.shieldtech.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.miracast.xml:system/etc/permissions/com.nvidia.miracast.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.graphics.xml:system/etc/permissions/com.nvidia.graphics.xml\
    $(LOCAL_PATH)/permissions/platform.xml:system/etc/permissions/platform.xml

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    device/nvidia/ardbeg/overlay

# Platform Base Info
PRODUCT_NAME := ardbeg
PRODUCT_DEVICE := ardbeg
PRODUCT_MODEL := ardbeg
PRODUCT_MANUFACTURER := NVIDIA
PRODUCT_BRAND := nvidia
TARGET_TEGRA_VERSION := t124
PRODUCT_CHARACTERISTICS := tablet

# Power HAL
PRODUCT_PACKAGES += \
    power.tegra \
    libhealthd.tegra

# Paragon Filesystem Tools
PRODUCT_PACKAGES += \
    mount.ufsd \
    chkufsd \
    mkexfat \
    chkexfat \
    mkhfs \
    chkhfs \
    mkntfs \
    chkntfs

# Radio RIL
PRODUCT_PACKAGES += rild

# Ramdisk Init Scripts
PRODUCT_PACKAGES += \
    fstab.ardbeg \
    init.recovery.rc \
    init.ardbeg.rc \
    init.comms.rc \
    init.ray_touch.rc \
    init.hdcp.rc \
    init.tegra.rc \
    init.tegra_emmc.rc \
    init.nv_dev_board.usb.rc \
    init.usb.rc \
    init.ussrd.rc \
    init.t124.rc \
    init.tlk.rc \
    init.cal.rc \
    init.tlk.rc \
	power.ardbe.rc \
    ueventd.ardbeg.rc \
    ueventd.ardbeg_sata.rc

# Standard Hardware Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/thermal/thermalhal.ardbeg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermalhal.ardbeg.xml

# Use legacy ADB USB support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.nonblocking_ffs=false \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

# Widevine DRM
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true

# Wifi
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/comms/brcm_wpa.conf:/system/etc/firmware/brcm_wpa.conf \
    $(LOCAL_PATH)/comms/brcm_p2p.conf:/system/etc/firmware/brcm_p2p.conf

PRODUCT_PACKAGES += \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    libnetcmdiface \
	libdashplayer

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.commchip_vendor 0x02d0 \
    persist.sys.commchip_device 0x4354

# Misc System Binaries & Apps
PRODUCT_PACKAGES += \
    setup_fs \
    drmserver \
    Gallery2 \
    libdrmframework_jni \
    overlaymon \
    e2fsck

# Vendor Proprietary Tree
$(call inherit-product, vendor/nvidia/ardbeg/ardbeg-vendor.mk)

