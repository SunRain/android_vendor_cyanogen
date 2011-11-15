# Inherit AOSP device configuration.
$(call inherit-product, device/motorola/begonia/begonia.mk)

# Inherit common GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# TI FM radio
# $(call inherit-product, vendor/cyanogen/products/ti_fm_radio.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Extra begonia overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/begonia

# Add the Torch app
PRODUCT_PACKAGES += Torch

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_begonia
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := begonia
PRODUCT_MODEL := MB611
PRODUCT_MANUFACTURER := Motorola

# Release name and versioning
PRODUCT_RELEASE_NAME := Cliq2
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

DATE     := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES += \
	TARGET_DEVICE=umts_begonia \
	TARGET_BUILD_TYPE=user \
	USER=CyanogenCliq2 \
	PRODUCT_BRAND=MOTO \
	PRODUCT_NAME=begonia_tmo_us \
	BUILD_ID=BGN_2.0.84 \
	BUILD_DISPLAY_ID="Gingerbread BGN_2.0.84" \
	BUILD_PRODUCT=begonia_tmo_us \
	BUILD_FINGERPRINT=MOTO/begonia_tmo_us/umts_begonia:2.3.4/BGN_2.0.84/149:user/release-keys \
	BUILD_NUMBER=${DATE} \
	PRIVATE_BUILD_DESC="umts_begonia-user 2.3.4 BGN_2.0.84 149 release-keys" 

#
# Copy begonia specific prebuilt files
#
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip


