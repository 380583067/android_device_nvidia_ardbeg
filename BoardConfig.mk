#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# inherit from the proprietary version
-include vendor/nvidia/ardbeg/BoardConfigVendor.mk

DEVICE_PATH := device/nvidia/ardbeg

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
BOARD_SUPPORT_NVOICE := true
BOARD_SUPPORT_NVAUDIOFX := true

# Adaptive backlight
BOARD_HARDWARE_CLASS := device/nvidia/ardbeg/cmhw/

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/nvidia/ardbeg/bluetooth
# At least when debugging is enabled, we have the same crash as manta
BCM_BLUETOOTH_MANTA_BUG := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/nvidia/ardbeg/bluetooth
#BOARD_BLUEDROID_VENDOR_CONF := device/xiaomi/mocha/bluetooth/vnd_ardbeg.txt

# Skip kernel headers install to fix missing netfilter uapi headers
TARGET_KERNEL_NO_HEADERS_INSTALL := true

# Camera stub (if no camera HAL)
#USE_CAMERA_STUB := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ardbeg
TARGET_NO_BOOTLOADER := true

# Graphics
USE_OPENGL_RENDERER := true
# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Per-application sizes for shader cache
MAX_EGL_CACHE_SIZE := 4194304
MAX_EGL_CACHE_ENTRY_SIZE := 262144

# Kernel
BOARD_KERNEL_CMDLINE := vpr_resize androidboot.selinux=permissive androidboot.hardware=ardbeg
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
# 传入单独dtb文件
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dt $(DEVICE_PATH)/prebuilt/tegra124-tn8-p1761-1470-a00.dtb

# 使用预编译内核
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# 源码内核配置（预编译时无效，保留不影响）
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := tegra12_android_defconfig
TARGET_KERNEL_SOURCE := kernel/nvidia/ardbegold

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 24432320
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 24432320
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 671088640 # 640 Mb stock partition table
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1337564160 # 1.2 Gb
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3001024512 # 2.8 Gb
BOARD_USERDATAIMAGE_PARTITION_SIZE := 21196694528
BOARD_CACHEIMAGE_PARTITION_SIZE := 387973120

# Platform
TARGET_BOARD_PLATFORM := tegra

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Tegra PowerHAL
TARGET_POWERHAL_VARIANT := tegra

# Recovery
TARGET_RECOVERY_FSTAB := device/nvidia/ardbeg/initfiles/fstab.ardbeg
BOARD_NO_SECURE_DISCARD := true

# RenderScript
OVERRIDE_RS_DRIVER := libnvRSDriver.so

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/bcm4350/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/bcm4350/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/vendor/firmware/bcm4350/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_ARG           := "iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"

# Zygote whitelist extra paths
ZYGOTE_WHITELIST_PATH_EXTRA := \"/dev/nvhost-ctrl\",\"/dev/mem\",

# Build with TWRP support
WITH_TWRP := true

# powerhal
BOARD_USES_POWERHAL := true

# Using the NCT partition
TARGET_USE_NCT := true
# LBH related defines
# use LBH partition and resources in it
BOARD_HAVE_LBH_SUPPORT := true
