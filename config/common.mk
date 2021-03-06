PRODUCT_BRAND ?= illusion

# general properties
PRODUCT_PROPERTIES_OVERRIDE += \
	keyguard.no_require_sim=true \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.com.google.clientidbase=android-google \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.android.dateformat=MM-dd-yyyy \
	ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Embed SuperUser
SUPERUSER_EMBEDDED := true

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/illusion/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/illusion/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/illusion/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/illusion/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
	vendor/illusion/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
	vendor/illusion/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/illusion/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with illusion extras
PRODUCT_COPY_FILES += \
    vendor/illusion/prebuilt/etc/init.local.rc:root/init.illusion.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# GPS Security Config
PRODUCT_COPY_FILES += \
    vendor/illusion/prebuilt/etc/sec_config:system/etc/sec_config

# Additional packages
-include vendor/illusion/config/packages.mk
-include vendor/illusion/config/themes.mk
-include vendor/illusion/config/nfc_enhanced.mk

# Versioning
-include vendor/illusion/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/illusion/overlay/common

# Illusion IME
PRODUCT_COPY_FILES += \
vendor/illusion/prebuilt/app/IllusionKB.apk:system/app/IllusionKB.apk
