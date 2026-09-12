# Inherit the official LineageOS violet config
$(call inherit-product, device/xiaomi/violet/lineage_violet.mk)

DUOPLES_DEVICE := violet

# Inherit DuoplesOS specific configurations and branding
$(call inherit-product, vendor/duoples/config/duoples_common.mk)

# Override product name for DuoplesOS Android 17
PRODUCT_NAME := duoples_violet
PRODUCT_DEVICE := violet

PRODUCT_SOONG_NAMESPACES += \
    hardware/qcom/wlan/legacy \
    hardware/qcom-caf/wlan \
    hardware/qcom-caf/wlan/qcwcn
