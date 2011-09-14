# Inherit AOSP device configuration.
$(call inherit-product, device/motorola/begonia/begonia.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_begonia
PRODUCT_BRAND := MOTO
PRODUCT_DEVICE := begonia
PRODUCT_MODEL := MB611
PRODUCT_MANUFACTURER := motorola
PRODUCT_SBF := 2.2.2-BGN_1.1.30
PRODUCT_SFX := tmo_us

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%y%m%d-%H%M)-NIGHTLY-begonia
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC1-begonia
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC1-begonia
    endif
endif

UTC_DATE := $(shell date +%s)
DATE     := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES := \
BUILD_ID=BGN_2.3.5 \
BUILD_DISPLAY_ID="Gingerbread BGN_2.3.5" \
PRODUCT_NAME=${PRODUCT_MODEL}_${PRODUCT_SFX} \
TARGET_DEVICE=umts_begonia \
BUILD_FINGERPRINT=MOTO/${PRODUCT_DEVICE}_${PRODUCT_SFX}/umts_begonia/begonia:2.3.5/${PRODUCT_SBF}/${UTC_DATE}:user/release-keys \
PRODUCT_BRAND=MOTO \
PRIVATE_BUILD_DESC="umts_begonia-user 2.3.5 ${PRODUCT_SFX}_${PRODUCT_SBF} ${UTC_DATE} release-keys" \
BUILD_NUMBER=${DATE} \
BUILD_VERSION_TAGS=release-keys \
TARGET_BUILD_TYPE=user \
USER=CyanogenCliq2

PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/cyanogen/overlay/begonia

# Add the Torch app
PRODUCT_PACKAGES += \
    Torch

# for custom apns-conf.xml
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# TI FM radio
$(call inherit-product, vendor/cyanogen/products/ti_fm_radio.mk)

