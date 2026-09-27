# DuoplesOS Common Configuration - Android 17

PRODUCT_BRAND := DuoplesOS
PRODUCT_NAME := duoples
PRODUCT_MANUFACTURER := Duoples

# Versioning
include vendor/duoples/config/version.mk

# Custom UI branding properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.duoples.version=$(DUOPLES_VERSION) \
    ro.duoples.releasetype=$(DUOPLES_BUILDTYPE) \
    ro.duoples.device=$(DUOPLES_DEVICE) \
    ro.duoples.build.version=$(DUOPLES_BUILD_VERSION) \
    ro.duoples.android.version=$(DUOPLES_ANDROID_VERSION)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.lineage.build.version=$(DUOPLES_BUILD_VERSION) \
    ro.lineage.releasetype=$(DUOPLES_BUILDTYPE) \
    ro.lineage.device=$(DUOPLES_DEVICE)

# Prebuilt Duoples Appstore v0.7.1
PRODUCT_PACKAGES += \
    DuoplesAppstore
