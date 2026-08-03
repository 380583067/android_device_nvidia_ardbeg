#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# inherit from the proprietary version
-include vendor/nvidia/ardbeg/BoardConfigVendor.mk

# Board sepolicy fuse support
BOARD_SUPPORT_PARAGON_FUSE_UFSD := true

# Device Path Global Var
DEVICE_PATH := device/nvidia/ardbeg
TARGET_SPECIFIC_HEADER_PATH := device/nvidia/ardbeg/include

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINYHAL_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/nvidia/ardbeg/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/nvidia/ardbeg/bluetooth/vnd_ardbeg.txt

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ardbeg
TARGET_NO_BOOTLOADER := true
BOARD_BUILD_BOOTLOADER := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS := \
    device/nvidia/ardbeg/cmhw

# Dalvik option
DALVIK_ENABLE_DYNAMIC_GC := true

# Display static images for charging
BOARD_CHARGER_STATIC_IMAGE := true

# Default HDMI mirror mode
# Crop (default) picks closest mode, crops to screen resolution
# Scale picks closest mode, scales to screen resolution (aspect preserved)
# Center picks a mode greater than or equal to the panel size and centers;
#     if no suitable mode is available, reverts to scale
BOARD_HDMI_MIRROR_MODE := Scale

# NVDPS can be enabled when display is set to continuous mode.
BOARD_HAS_NVDPS := true

# This should be set to true for boards that support 3DVision.
BOARD_HAS_3DV_SUPPORT := true

# Double buffered display surfaces reduce memory usage, but will decrease performance.
# The default is to triple buffer the display surfaces.
# BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true

# GPS
BOARD_GPS_LIBRARIES := true

# Graphics
USE_OPENGL_RENDERER := true
# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Per-application sizes for shader cache
MAX_EGL_CACHE_SIZE := 4194304
MAX_EGL_CACHE_ENTRY_SIZE := 262144

# Use Nvidia optimized renderscript driver
OVERRIDE_RS_DRIVER := libnvRSDriver.so

# Kernel
BOARD_KERNEL_CMDLINE := vpr_resize androidboot.selinux=permissive androidboot.hardware=ardbeg
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# use kernel
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := device/nvidia/ardbeg/prebuilt/kernel
endif

BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := tegra_vcm30t124_android_defconfig
TARGET_KERNEL_SOURCE := kernel/nvidia/ardbegold

# VCM Kernel
# FIXME: This shouldn't be set here. Should be set in product Makefile for VCM.
TARGET_KERNEL_VCM_BUILD ?= true

# LBH related defines
# use LBH partition and resources in it
BOARD_HAVE_LBH_SUPPORT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 24432320
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 24432320
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_USERDATAIMAGE_PARTITION_SIZE  := 12799754240
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_CACHEIMAGE_PARTITION_SIZE := 387973120

# Tegra PowerHAL
TARGET_POWERHAL_VARIANT := tegra

# Quickboot
TARGET_QUICKBOOT ?= true
TARGET_QUICKBOOT_PRODUCTION := false
TARGET_BOOT_MEDIUM := nor
QUICKBOOT_TARGET_OS := android
# Quickboot flash tools
TARGET_QB_FLASH_TOOL := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/backlight/pwm-backlight/brightness\"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/nvidia/ardbeg/recovery/recovery_keys.c
TARGET_RECOVERY_FSTAB := device/nvidia/ardbeg/initfiles/fstab.ardbeg
BOARD_NO_SECURE_DISCARD := true

# RenderScript
OVERRIDE_RS_DRIVER := libnvRSDriver.so
BOARD_OVERRIDE_RS_CPU_VARIANT_32 := cortex-a15

# Board
REFERENCE_DEVICE := ardbeg
TARGET_BOARD_PLATFORM := tegra
TARGET_NO_RADIOIMAGE := true
TARGET_TEGRA_VERSION := t124

# SELinux
SELINUX_IGNORE_NEVERALLOWS := true

ifeq ($(PLATFORM_IS_AFTER_KITKAT),)
BOARD_SEPOLICY_DIRS += device/nvidia/ardbeg/sepolicy/
BOARD_SEPOLICY_UNION := \
	te_macros
BOARD_SEPOLICY_UNION += \
	app.te \
	comms.te \
	domain.te \
	file_contexts \
	file.te \
	genfs_contexts \
	healthd.te \
	netd.te \
	untrusted_app.te \
	usb.te \
	ussr_setup.te \
	ussrd.te \
	vold.te \
	wifi_loader.te \
	wpa.te \
	phs.te \
	system_server.te

else
# AOSP master based board specific sepolicy
BOARD_SEPOLICY_DIRS += device/nvidia/ardbeg/sepolicy_aosp
BOARD_SEPOLICY_UNION := \
	te_macros
BOARD_SEPOLICY_UNION += \
	app.te \
	bluetooth.te \
	bootanim.te \
	cvc.te \
	device.te \
	domain.te \
	drmserver.te \
	file_contexts \
	file.te \
	genfs_contexts \
	gpload.te \
	gpsd.te \
	hostapd.te \
	installd.te \
	mediaserver.te \
	netd.te \
	platform_app.te \
	property_contexts \
	property.te \
	recovery.te \
	service_contexts \
	set_hwui.te \
	shell.te \
	surfaceflinger.te \
	system_server.te \
	tee.te \
	ueventd.te \
	untrusted_app.te \
	usb.te \
	ussrd.te \
	ussr_setup.te \
	vold.te \
	wifi_loader.te \
	wpa.te \
	phs.te \
	zygote.te \
	healthd.te

endif

# Using the NCT partition
TARGET_USE_NCT := true

# Allow this variable to be overridden to n for non-secure OS build
SECURE_OS_BUILD ?= y
ifeq ($(SECURE_OS_BUILD),y)
    SECURE_OS_BUILD := tlk
endif

# ThermalHAL
TARGET_THERMALHAL_VARIANT := tegra

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_STA     := "/data/misc/wifi/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/data/misc/wifi/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/data/misc/wifi/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_PARAM   := "/data/misc/wifi/firmware/firmware_path"
WIFI_DRIVER_MODULE_ARG      := "iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"

# Widevine
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1

# Zygote whitelist extra path
ZYGOTE_WHITELIST_PATH_EXTRA := "/dev/nvhost-ctrl","/dev/mem"
