## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := hy801_intex_16

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/intex/hy801_intex_16/device_hy801_intex_16.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := hy801_intex_16
PRODUCT_NAME := cm_hy801_intex_16
PRODUCT_BRAND := intex
PRODUCT_MODEL := hy801_intex_16
PRODUCT_MANUFACTURER := intex
