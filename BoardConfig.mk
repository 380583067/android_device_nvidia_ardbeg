#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# inherit from the proprietary version
-include vendor/nvidia/ardbeg/BoardConfigVendor.mk

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

BOARD_BUILD_BOOTLOADER := true

TARGET_KERNEL_DT_NAME ?= tegra124-ardbeg

REFERENCE_DEVICE := ardbeg

# Board
TARGET_BOARD_PLATFORM := tegra
TARGET_NO_RADIOIMAGE := true
TARGET_TEGRA_VERSION := t124

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ardbeg
TARGET_NO_BOOTLOADER := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORT_NVAUDIOFX := true

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS := \
    device/nvidia/ardbeg/cmhw

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/nvidia/ardbeg/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/nvidia/ardbeg/bluetooth/vnd_ardbeg.txt

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

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
#BOARD_MKBOOTIMG_ARGS += --dt $(DEVICE_PATH)/prebuilt/tegra124-tn8-p1761-1470-a00.dtb

# 使用预编译内核
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := tegra_vcm30t124_android_defconfig
TARGET_KERNEL_SOURCE := kernel/nvidia/ardbegold

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

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Tegra PowerHAL
TARGET_POWERHAL_VARIANT := tegra

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/backlight/pwm-backlight/brightness\"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/nvidia/ardbeg/recovery/recovery_keys.c
TARGET_RECOVERY_FSTAB := device/nvidia/ardbeg/initfiles/fstab.ardbeg
BOARD_NO_SECURE_DISCARD := true

# RenderScript
OVERRIDE_RS_DRIVER := libnvRSDriver.so

# SELinux
SELINUX_IGNORE_NEVERALLOWS := true
# try to detect AOSP master-based policy vs small KitKat policy
ifeq ($(wildcard external/sepolicy/lmkd.te),)
# KitKat based board specific sepolicy
BOARD_SEPOLICY_DIRS += device/nvidia/platform/ardbeg/sepolicy
else
# AOSP master based board specific sepolicy
BOARD_SEPOLICY_DIRS += device/nvidia/platform/ardbeg/sepolicy_aosp
endif

BOARD_SUPPORT_PARAGON_FUSE_UFSD := true

# VCM Kernel
# FIXME: This shouldn't be set here. Should be set in product Makefile for VCM.
TARGET_KERNEL_VCM_BUILD ?= true

# Quickboot
TARGET_QUICKBOOT ?= true
TARGET_QUICKBOOT_PRODUCTION := false
TARGET_BOOT_MEDIUM := nor
QUICKBOOT_TARGET_OS := android
# Quickboot flash tools
TARGET_QB_FLASH_TOOL := true

# powerhal
BOARD_USES_POWERHAL := true

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

# GPS
BOARD_GPS_LIBRARIES := true

# Zygote whitelist extra paths
ZYGOTE_WHITELIST_PATH_EXTRA := "/dev/nvhost-ctrl","/dev/mem"

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

# Allow this variable to be overridden to n for non-secure OS build
SECURE_OS_BUILD ?= y
ifeq ($(SECURE_OS_BUILD),y)
    SECURE_OS_BUILD := tlk
endif

# Double buffered display surfaces reduce memory usage, but will decrease performance.
# The default is to triple buffer the display surfaces.
# BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true

# Use CMU-style config with Nvcms
NVCMS_CMU_USE_CONFIG := false

# BOARD_WIDEVINE_OEMCRYPTO_LEVEL
# The security level of the content protection provided by the Widevine DRM plugin depends
# on the security capabilities of the underlying hardware platform.
# There are Level 1/2/3. To run HD contents, should be Widevine level 1 security.
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1

# Dalvik option
DALVIK_ENABLE_DYNAMIC_GC := true

# Using the NCT partition
TARGET_USE_NCT := true
# LBH related defines
# use LBH partition and resources in it
BOARD_HAVE_LBH_SUPPORT := true

# Display static images for charging
BOARD_CHARGER_STATIC_IMAGE := true
