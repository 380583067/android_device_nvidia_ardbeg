#
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
#

LOCAL_PATH := device/nvidia/ardbeg

# ADB
PRODUCT_PROPERTY_OVERRIDES += \
  persist.service.adb.enable=1 \
  persist.service.debuggable=1 \
  persist.sys.usb.config=mtp,adb \
  persist.sys.root_access=2 \
  ro.secure=0 \
  ro.adb.secure=0 \
  ro.debuggable=1

PRODUCT_AAPT_CONFIG += xlarge large
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200

## Thse are default settings, it gets changed as per sku manifest properties
PRODUCT_NAME := ardbeg
PRODUCT_DEVICE := ardbeg
PRODUCT_MODEL := ardbeg
PRODUCT_MANUFACTURER := NVIDIA
PRODUCT_BRAND := nvidia

TARGET_TEGRA_VERSION := t124
TARGET_TEGRA_MODEM := icera
include $(LOCAL_PATH)/touchscreen/maxim/maxim.mk

# ATV Support
ifeq ($(ALTERNATE_BUILD),true)
$(call inherit-product, device/nvidia/ardbeg/device_atv.mk)
else
$(call inherit-product, device/nvidia/ardbeg/device_tablet.mk)
endif

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

PRODUCT_SYSTEM_PROPERTY_BLACKLIST := ro.product.name

$(call inherit-product, vendor/nvidia/ardbeg/ardbeg-vendor.mk)

## enable Wifi Access Point monitor (needed for two-step SAR backoff)
PRODUCT_PACKAGES += icera-wifiAPNotifier

## SKU specific overrides
include frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    device/nvidia/ardbeg/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.ardbeg \
    init.recovery.rc \
    init.ardbeg.rc \
    init.ardbeg_sata.rc \
    init.comms.rc \
    init.ray_touch.rc \
    init.hdcp.rc \
    init.mmap_topdown.rc \
    init.tegra.rc \
    init.tegra_emmc.rc \
    init.qvs.rc \
    init.laguna.rc \
    init.nv_dev_board.usb.rc \
    init.usb.rc \
    init.ussrd.rc \
    init.tn8.rc \
    init.t124.rc \
    init.cal.rc \
    init.tlk.rc \
    power.tn8.rc \
    power.ardbeg.rc \
    ueventd.ardbeg.rc \
    ueventd.ardbeg_sata.rc \
    ueventd.tn8.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
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
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \

# NVIDIA
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.nvidia.feature.xml:system/etc/permissions/com.nvidia.feature.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.feature.opengl4.xml:system/etc/permissions/com.nvidia.feature.opengl4.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/media_codecs_noenhance.xml:system/etc/media_codecs_noenhance.xml \
    $(LOCAL_PATH)/media/media_profiles_kk.xml:system/etc/media_profiles_kk.xml \
    $(LOCAL_PATH)/media/media_profiles_noenhance.xml:system/etc/media_profiles_noenhance.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audioConfig_qvoice_icera_pc400.xml:system/etc/audioConfig_qvoice_icera_pc400.xml \
    $(LOCAL_PATH)/audio/asound.conf:system/etc/asound.conf \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio_policy_kk.conf:system/etc/audio_policy_kk.conf \
    $(LOCAL_PATH)/audio/audio_policy_noenhance.conf:system/etc/audio_policy_noenhance.conf \
    $(LOCAL_PATH)/audio/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    $(LOCAL_PATH)/audio/nvaudio_fx.xml:system/etc/nvaudio_fx.xml

PRODUCT_PACKAGES += \
    audio.primary.tegra \
    audio.a2dp.default \
    audio.usb.default \
    libaudiopolicymanager \
    audio.nvwc.tegra \
    setup_fs \
    drmserver \
    Gallery2 \
    libdrmframework_jni \
    overlaymon \
    e2fsck \
    tinycap \
    tinymix \
    tinyplay \
    xaplay

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    Galaxy4 \
    VisualizationWallpapers \
    PhaseBeam \
    librs_jni

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/comms/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    $(LOCAL_PATH)/comms/gps.conf:system/etc/gps.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

PRODUCT_PACKAGES += \
    libbt-vendor

# Camera
#PRODUCT_PACKAGES += Snap
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/model_frontal.xml:system/etc/model_frontal.xml \
    $(LOCAL_PATH)/camera/nvcamera.conf:system/etc/nvcamera.conf

# Light
PRODUCT_PACKAGES += \
    lights.tegra

# Modules
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/modules/mbt8897.ko:system/lib/modules/mbt8897.ko \
	$(LOCAL_PATH)/prebuilt/modules/sd8897.ko:system/lib/modules/sd8897.ko \
	$(LOCAL_PATH)/prebuilt/modules/sd8897mlan.ko:system/lib/modules/sd8897mlan.ko \
	$(LOCAL_PATH)/prebuilt/modules/modules.alias:system/lib/modules/modules.alias \
	$(LOCAL_PATH)/prebuilt/modules/modules.dep:system/lib/modules/modules.dep \
	$(LOCAL_PATH)/prebuilt/modules/modules.softdep:system/lib/modules/modules.softdep

# Wifi
# All Shield devices xurrently use broadcom wifi / bluetooth modules
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_PACKAGES += \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    libnetcmdiface \
	libdashplayer

PRODUCT_COPY_FILES += \
  device/nvidia/ardbeg/common/wifi_loader.sh:system/bin/wifi_loader.sh \
  device/nvidia/ardbeg/common/wpa_supplicant.sh:system/bin/wpa_supplicant.sh \
  device/nvidia/ardbeg/common/gps_select.sh:system/bin/gps_select.sh \
  device/nvidia/ardbeg/comms/brcm_wpa.conf:/system/etc/firmware/brcm_wpa.conf \
  device/nvidia/ardbeg/comms/brcm_p2p.conf:/system/etc/firmware/brcm_p2p.conf

# POWERHAL
PRODUCT_PACKAGES += \
    power.tegra \
    libhealthd.tegra

# Paragon filesystem solution binaries
PRODUCT_PACKAGES += \
    mount.ufsd \
    chkufsd \
    mkexfat \
    chkexfat \
    mkhfs \
    chkhfs \
    mkntfs \
    chkntfs

## Calibration notifier
PRODUCT_PACKAGES += CalibNotifier
PRODUCT_COPY_FILES += \
    device/nvidia/ardbeg/calibration/calib_cfg.xml:system/etc/calib_cfg.xml

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/thermal/thermalhal.ardbeg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermalhal.ardbeg.xml

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Radio Interface
PRODUCT_PACKAGES += rild

# Enable adb USB debugging in all builds

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# Set WiFi ID
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.commchip_vendor 0x02d0 \
    persist.sys.commchip_device 0x4354

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

#enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_PACKAGES += \
    com.google.widevine.software.drm.xml \
    com.google.widevine.software.drm \
    libdrmwvmplugin \
    libwvm \
    libWVStreamControlAPI_L1 \
    libwvdrm_L1 \
    libdrmdecrypt
