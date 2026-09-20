#
# Copyright (C) 2026 DuoplesOS
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from official lavender device config
$(call inherit-product, device/xiaomi/lavender/lineage_lavender.mk)

DUOPLES_DEVICE := lavender

# Inherit DuoplesOS specific configurations and branding
$(call inherit-product, vendor/duoples/config/duoples_common.mk)

# Override product name for DuoplesOS Android 17
PRODUCT_NAME := duoples_lavender
PRODUCT_DEVICE := lavender
PRODUCT_MODEL := Redmi Note 7

PRODUCT_SOONG_NAMESPACES +=     hardware/qcom/wlan/legacy     hardware/qcom-caf/wlan     hardware/qcom-caf/wlan/qcwcn
