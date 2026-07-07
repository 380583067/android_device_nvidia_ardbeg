# TWRP 完整配置
# 界面主题
TW_THEME := landscape_hdpi

# 精简无用组件，缩小镜像体积
TW_EXCLUDE_PYTHON := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_SUPERSU := true

# 多语言支持
TW_EXTRA_LANGUAGES := true

# USB 鼠标/OTG 输入支持（无触屏设备必需）
TW_USB_INPUT_SUPPORT := true
TW_HAS_USB_MOUSE := true
TARGET_RECOVERY_KERNEL_MODULES := true

# 显示/帧缓存渲染修复（适配老4.4/Tegra设备）
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# 背光亮度控制
TW_BRIGHTNESS_PATH := /sys/class/backlight/pwm-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162

# 外置TF卡挂载配置
TW_EXTERNAL_STORAGE_PATH := "/sdcard1"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard1"
RECOVERY_SDCARD_ON_DATA := true

# 文件系统/外设传输驱动
TW_INCLUDE_MTP := true
TW_MTP_DEVICE := "/dev/mtp_usb"
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_NTFS_3G := true

# 数据加密解密支持
TW_INCLUDE_CRYPTO := true

# 调试日志工具
TWRP_INCLUDE_LOGCAT := true

# 使用精简工具箱适配旧安卓
TW_USE_TOOLBOX := true

# 设备自定义版本标识
TW_DEVICE_VERSION := t124
