# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)
# Inherit from ardbeg device
$(call inherit-product, device/nvidia/ardbeg/device.mk)
## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ardbeg
PRODUCT_NAME := cm_ardbeg
PRODUCT_BRAND := nvidia
PRODUCT_MODEL := ardbeg
PRODUCT_MANUFACTURER := nvidia

PRODUCT_GMS_CLIENTID_BASE := android-nvidia

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="ardbeg-eng 4.4.4 KTU84P bx test-keys"

BUILD_FINGERPRINT := nvidia/ardbeg/ardbeg:4.4.4/KTU84P/bx:eng/test-keys
