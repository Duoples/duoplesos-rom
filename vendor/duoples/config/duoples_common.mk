# Duoplesos Common Configuration

# Inherit from common LineageOS configuration
# Note: In a real build tree, this path would be valid.
# $(call inherit-product, vendor/lineage/config/common.mk)

PRODUCT_BRAND := Duoplesos
PRODUCT_NAME := duoples
PRODUCT_MANUFACTURER := Duoplesos

# Duoplesos-specific versioning
include vendor/duoples/config/version.mk

# Custom UI branding
PRODUCT_PRODUCT_PROPERTIES += \
    ro.duoples.version=$(DUOPLES_VERSION) \
    ro.duoples.releasetype=$(DUOPLES_BUILDTYPE) \
    ro.duoples.device=$(DUOPLES_DEVICE) \
    ro.duoples.build.version=$(DUOPLES_BUILD_VERSION)

# Override LineageOS properties if needed
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.lineage.build.version=$(DUOPLES_BUILD_VERSION) \
    ro.lineage.releasetype=$(DUOPLES_BUILDTYPE) \
    ro.lineage.device=$(DUOPLES_DEVICE)

# Add custom packages here (like Infinity Suite if you port it)
PRODUCT_PACKAGES += \
    DuoplesAppstore
