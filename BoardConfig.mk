#
# Copyright (C) 2018 The LineageOS Project
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

BOARD_FLASH_BLOCK_SIZE             := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE    := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12799754240
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1342177280
TARGET_USERIMAGES_USE_EXT4         := true
TARGET_USES_MKE2FS := true

# Assert
TARGET_OTA_ASSERT_DEVICE := shieldtablet,loki,ardbeg,jetson-tk1,yellowstone

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
ifeq ($(TARGET_TEGRA_BT),bcm)
BOARD_CUSTOM_BT_CONFIG  := device/nvidia/shieldtablet/comms/vnd_shieldtablet.txt
BCM_BLUETOOTH_MANTA_BUG := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/nvidia/shieldtablet/comms
endif

# Bionic
MALLOC_SVELTE := true

# Bootloader versions
TARGET_BOARD_INFO_FILE := device/nvidia/shieldtablet/board-info.txt

# Manifest
DEVICE_MANIFEST_FILE := device/nvidia/shieldtablet/manifest.xml

# Fingerprint override
BUILD_FINGERPRINT := nvidia/wx_un_do/shieldtablet:7.0/NRD90M/1928188_1038.3875:user/release-keys

# Forced shims
TARGET_LD_SHIM_LIBS := /system/vendor/bin/glgps_nvidiaTegra2android|libsensor.so

# Kernel
TARGET_KERNEL_SOURCE    := kernel/nvidia/shield
TARGET_KERNEL_CONFIG    := lineageos_shieldtablet_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_CMDLINE    := vmalloc=300M zcache.enabled=1 zcache.compressor=lz4

# Light
include hardware/nvidia/light/BoardLight.mk

# Recovery
TARGET_RECOVERY_FSTAB := device/nvidia/shieldtablet/initfiles/fstab.tn8

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/nvidia/shieldtablet/releasetools

# TWRP Support
ifeq ($(WITH_TWRP),true)
include device/nvidia/shieldtablet/twrp/twrp.mk
endif

# Vendor Init
TARGET_INIT_VENDOR_LIB := libinit_tn8

include device/nvidia/t124-common/BoardConfigCommon.mk
include device/nvidia/icera/BoardConfigIcera.mk
include device/nvidia/touch/BoardConfigTouch.mk
include vendor/nvidia/shieldtablet/BoardConfigVendor.mk
