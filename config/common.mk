# Generic product
PRODUCT_NAME := stag
PRODUCT_BRAND := stag
PRODUCT_DEVICE := generic
EXCLUDE_SYSTEMUI_TESTS := true

# version
include vendor/stag/config/version.mk

# Props
include vendor/stag/config/props.mk

# Packages
include vendor/stag/config/packages.mk

# Bootanimation
ifeq ($(TARGET_SCREEN_RES), 720)
	PRODUCT_COPY_FILES += vendor/stag/prebuilt/common/bootanimation/720p.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_SCREEN_RES), 1080)
	PRODUCT_COPY_FILES += vendor/stag/prebuilt/common/bootanimation/1080p.zip:system/media/bootanimation.zip
else
	PRODUCT_COPY_FILES += vendor/stag/prebuilt/common/bootanimation/1080p.zip:system/media/bootanimation.zip
endif

# Extra packages
PRODUCT_PACKAGES += \
    libjni_latinimegoogle

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    vendor/stag/overlay/common \
    vendor/stag/overlay

# Changelog
#PRODUCT_COPY_FILES += \
#    out/../Changelog.mkdn:system/etc/Changelog.txt

#IgnoreNeverallows
ifeq ($(TARGET_BUILD_VARIANT),user)
	SELINUX_IGNORE_NEVERALLOWS := false
else
        SELINUX_IGNORE_NEVERALLOWS := true
endif

# Permissions
    vendor/stag/prebuilt/common/etc/permissions/privapp-permissions-stag-system.xml:system/etc/permissions/privapp-permissions-stag.xml \
    vendor/stag/prebuilt/common/etc/permissions/privapp-permissions-stag-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-stag.xml \

# Enable Android Beam on all targets
PRODUCT_COPY_FILES += \
    vendor/stag/prebuilt/common/etc/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.nfc.beam.xml

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/stag/prebuilt/common/etc/permissions/stag-power-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/stag-power-whitelist.xml

# Weather client
PRODUCT_COPY_FILES += \
    vendor/stag/prebuilt/common/etc/permissions/org.pixelexperience.weather.client.xml:system/etc/permissions/org.pixelexperience.weather.client.xml \
    vendor/stag/prebuilt/common/etc/default-permissions/org.pixelexperience.weather.client.xml:system/etc/default-permissions/org.pixelexperience.weather.client.xml

# Google permissions
PRODUCT_COPY_FILES += \
    vendor/stag/prebuilt/common/etc/permissions/privapp-permissions-elgoog.xml:system/etc/permissions/privapp-permissions-elgoog.xml

# Camera Permissions
PRODUCT_COPY_FILES += \
   vendor/stag/prebuilt/common/etc/permissions/privapp-permissions-snap.xml:system/etc/permissions/privapp-permissions-snap.xml \
   vendor/stag/prebuilt/common/etc/permissions/privapp-permissions-camera2.xml:system/etc/permissions/privapp-permissions-camera2.xml

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# APN
PRODUCT_PACKAGES += \
    apns-conf.xml
