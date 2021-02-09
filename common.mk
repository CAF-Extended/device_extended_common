# Copyright 2021 CAF-EXTENDED
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

DEVICE_PATH := device/extended/common


# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= true
ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlockService
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face_unlock_service.enabled=$(TARGET_FACE_UNLOCK_SUPPORTED)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif



# GMS
ifeq ($(WITH_GAPPS), true)

# Inherit GMS, Pixel Features, and Modules.
$(call inherit-product, vendor/google/gms/config.mk)
# Pixel Features
$(call inherit-product, vendor/google/pixel/config.mk)
# Don't preoptimize prebuilts when building GMS.
DONT_DEXPREOPT_PREBUILTS := true

endif

# Cutout control overlays
PRODUCT_PACKAGES += \
    HideCutout \
    StatusBarStock

# StichImage
PRODUCT_PACKAGES += \
    StitchImage \
    StitchImageService

#SimpleDeviceConfig
PRODUCT_PACKAGES += \
    SimpleDeviceConfig

# Extra tools
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    7z \
    bash \
    bzip2 \
    curl \
    lib7z \
    powertop \
    pigz \
    tinymix \
    unrar \
    unzip \
    vim \
    rsync \
    zip

# AOSP Packages
PRODUCT_PACKAGES += \
    ThemePicker


#Caf-Aditions
PRODUCT_PACKAGES := \
    AccountAndSyncSettings \
    DeskClock \
    DU-Themes \
    AlarmProvider \
    Calculator \
    Calendar \
    CellBroadcastReceiver \
    CertInstaller \
    Email \
    Gallery2 \
    LatinIME \
    Music \
    netutils-wrapper-1.0 \
    CalendarProvider \
    SyncProvider \
    SoundRecorder \
    DuckDuckGo \
    MusicPlayerGO \
    WallpaperPickerGoogle


