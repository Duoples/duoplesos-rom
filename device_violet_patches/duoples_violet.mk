# Inherit the official LineageOS violet config
$(call inherit-product, device/xiaomi/violet/lineage_violet.mk)

DUOPLES_DEVICE := violet

# Inherit DuoplesOS specific configurations and branding
$(call inherit-product, vendor/duoples/config/duoples_common.mk)

# Override the product name for DuoplesOS
PRODUCT_NAME := duoples_violet
PRODUCT_DEVICE := violet
