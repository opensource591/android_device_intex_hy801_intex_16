$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/intex/hy801_intex_16/hy801_intex_16-vendor.mk)

# Use the Dalvik VM specific for devices with 512 MB of RAM
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS += device/intex/hy801_intex_16/overlay
LOCAL_PATH := device/intex/hy801_intex_16

# Softlink sh
$(shell mkdir -p $(LOCAL_PATH)/../../../out/target/product/hy801_intex_16/recovery/root/system/bin)
$(shell ln -sf -t $(LOCAL_PATH)/../../../out/target/product/hy801_intex_16/recovery/root/system/bin ../../sbin/sh)

PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Files to be copied
# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.sc8830:root/fstab.sc8830 \
    $(LOCAL_PATH)/rootdir/init.sc8830.rc:root/init.sc8830.rc \
    $(LOCAL_PATH)/rootdir/init.sc8830.usb.rc:root/init.sc8830.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.sc8830.rc:root/ueventd.sc8830.rc \
    $(LOCAL_PATH)/rootdir/init.storage.rc:root/init.storage.rc \
    $(LOCAL_PATH)/rootdir/init.board.rc:root/init.board.rc \

# Device props
PRODUCT_PROPERTY_OVERRIDES := \
	keyguard.no_require_sim=true \
	ro.kernel.android.checkjni=0 \
	ro.zygote.disable_gl_preload=true \
	dalvik.vm.checkjni=false \
	dalvik.vm.heapstartsize=5m \
	dalvik.vm.heapgrowthlimit=48m \
	dalvik.vm.heapsize=128m \

# Properties
# Default properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Usb accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Filesystem
PRODUCT_PACKAGES += \
    setup_fs \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/dt.img:dt.img

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_hy801_intex_16
PRODUCT_DEVICE := hy801_intex_16
