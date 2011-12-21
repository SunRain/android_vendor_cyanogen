# Inherit AOSP device configuration for sidekick4g
$(call inherit-product, device/samsung/sidekick4g/device_sidekick4g.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# Add the Torch app
PRODUCT_PACKAGES += Torch
# Add the FM app
PRODUCT_PACKAGES += FM

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_sidekick4g
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := sidekick4g
PRODUCT_MODEL := SGH-T839
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=SGH-T839 \
	BUILD_ID=GINGERBREAD \
	BUILD_FINGERPRINT=samsung/SGH-T839/SGH-T839/SGH-T839:2.2.1/FROYO/UVKG2:user/release-keys \
	PRIVATE_BUILD_DESC="SGH-T839-user 2.2.1 FROYO UVKG2 release-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-samsung
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=cyanogen_galaxys_defconfig

# Extra galaxys overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/sidekick4g



# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

# Add additional mounts
PRODUCT_PROPERTY_OVERRIDES += \
    ro.additionalmounts=/mnt/emmc \
    ro.vold.switchablepair=/mnt/sdcard,/mnt/emmc

# Release name and versioning
PRODUCT_RELEASE_NAME := SideKick4g
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

#
# Copy galaxys specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip

