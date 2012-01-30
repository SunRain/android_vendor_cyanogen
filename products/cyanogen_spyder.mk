# Inherit AOSP device configuration.
$(call inherit-product, device/motorola/spyder/device_spyder.mk)

# Inherit common GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# TI FM radio
# $(call inherit-product, vendor/cyanogen/products/ti_fm_radio.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Extra  spyder overlay
#PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/spyder

# Add the Torch app
PRODUCT_PACKAGES += Torch

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_spyder
PRODUCT_BRAND := MOTO
PRODUCT_DEVICE := spyder
PRODUCT_MODEL := XT910
PRODUCT_MANUFACTURER := motorola

# Release name and versioning
PRODUCT_RELEASE_NAME := razr
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

DATE     := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES += \
	TARGET_DEVICE=umts_spyder \
	TARGET_BUILD_TYPE=user \
	USER=CyanogenRazr \
	PRODUCT_BRAND=MOTO \
	PRODUCT_NAME=XT910_RTGB \
	BUILD_ID=6.5.1-73_SPU-11 \
	BUILD_DISPLAY_ID="6.5.1-73_SPU-11" \
	BUILD_PRODUCT=spyder_umts \
	BUILD_FINGERPRINT=MOTO/XT910_RTGB/umts_spyder:2.3.5/6.5.1-73_SPU-11/1321616798:user/release-keys \
	BUILD_NUMBER=${DATE} \
	PRIVATE_BUILD_DESC="umts_spyder-user 2.3.5 6.5.1-73_SPU-11 1321616798 release-keys" 

#
# Copy begonia specific prebuilt files
#
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip


