#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_TEGRA_BT       ?= bcm
TARGET_TEGRA_GPS      ?= brcm
TARGET_TEGRA_WIFI     ?= bcm

$(call inherit-product, device/nvidia/t124-common/t124.mk)
$(call inherit-product, device/nvidia/icera/icera.mk)
$(call inherit-product, device/nvidia/touch/raydium.mk)
$(call inherit-product, device/nvidia/shield-common/shield.mk)

PRODUCT_CHARACTERISTICS  := tablet
PRODUCT_AAPT_CONFIG      := xlarge large
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT     := 1920
TARGET_SCREEN_WIDTH      := 1200

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

PRODUCT_VENDOR_PROPERTY_BLACKLIST := \
    ro.product.vendor.device \
    ro.product.vendor.model \
    ro.product.vendor.name \
    ro.vendor.build.fingerprint

# Init related
PRODUCT_PACKAGES += \
    init_tegra \
    fstab.ardbeg \
    fstab.jetson-tk1 \
    fstab.loki \
    fstab.tn8 \
    fstab.yellowstone \
    init.recovery.ardbeg.rc \
    init.recovery.jetson-tk1.rc \
    init.recovery.loki.rc \
    init.recovery.tn8.rc \
    init.recovery.yellowstone.rc \
    init.ardbeg.rc \
    init.jetson-tk1.rc \
    init.loki.rc \
    init.tn8.rc \
    init.tn8_common.rc \
    init.yellowstone.rc \
    power.ardbeg.rc \
    power.jetson-tk1.rc \
    power.loki.rc \
    power.tn8.rc \
    power.yellowstone.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# GPS
PRODUCT_PACKAGES += \
    init.gps.rc \
    gps.conf \
    gpsconfig.xml
