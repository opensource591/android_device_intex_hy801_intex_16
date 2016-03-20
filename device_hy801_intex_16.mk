$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/intex/hy801_intex_16/hy801_intex_16-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/intex/hy801_intex_16/overlay
LOCAL_PATH := device/intex/hy801_intex_16

# Softlink sh
$(shell mkdir -p $(LOCAL_PATH)/../../../out/target/product/hy801_intex_16/recovery/root/system/bin)
$(shell ln -sf -t $(LOCAL_PATH)/../../../out/target/product/hy801_intex_16/recovery/root/system/bin ../../sbin/sh)

# Files to be copied
# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.sc8830:root/fstab.sc8830 \
    $(LOCAL_PATH)/rootdir/init.sc8830.rc:root/init.sc8830.rc \
    $(LOCAL_PATH)/rootdir/init.sc8830.usb.rc:root/init.sc8830.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.sc8830.rc:root/ueventd.sc8830.rc \
    $(LOCAL_PATH)/rootdir/init.storage.rc:root/init.storage.rc \
    $(LOCAL_PATH)/rootdir/init.board.rc:root/init.board.rc \
    $(LOCAL_PATH)/rootdir/init.recovery.board.rc:root/init.recovery.board.rc \

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_hy801_intex_16
PRODUCT_DEVICE := hy801_intex_16
