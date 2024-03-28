#
# Copyright 2014 The Android Open-Source Project
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

# First lunching is S, api_level is 31
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_DTBO_TEMPLATE := $(LOCAL_PATH)/dt-overlay.in
PRODUCT_BOOT_DEVICE := fe330000.sdhci,fe320000.dwmmc
include device/rockchip/common/build/rockchip/DynamicPartitions.mk
include device/rockchip/rk3399/rk3399pro_amolk/BoardConfig.mk
include device/rockchip/common/BoardConfig.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
# Inherit from those products. Most specific first.
$(call inherit-product, device/rockchip/rk3399/device.mk)
$(call inherit-product, device/rockchip/common/device.mk)

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_NAME := rk3399pro_amolk
PRODUCT_DEVICE := rk3399pro_amolk
PRODUCT_BRAND := rockchip
PRODUCT_MODEL := rk3399pro_amolk
PRODUCT_MANUFACTURER := rockchip
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES += \
    SoundRecorder

BOARD_SEPOLICY_DIRS += vendor/rockchip/hardware/interfaces/neuralnetworks/1.0/default/sepolicy

PRODUCT_PACKAGES += \
    public.libraries-rockchip \
    librknn_api_android \
    librknnhal_bridge.rockchip \
    rockchip.hardware.neuralnetworks@1.0-impl \
    rockchip.hardware.neuralnetworks@1.0-service \
    rknn_server

PRODUCT_COPY_FILES += \
	external/wan_binaries/init.gprs-pppd:$(TARGET_COPY_OUT_VENDOR)/etc/init.gprs-pppd \
	external/wan_binaries/ip-down-ppp0:$(TARGET_COPY_OUT_VENDOR)/etc/ppp/ip-down-ppp0 \
	external/wan_binaries/ip-up-ppp0:$(TARGET_COPY_OUT_VENDOR)/etc/ppp/ip-up-ppp0 \
	external/wan_binaries/libreference-ril-gosuncn.so:$(TARGET_COPY_OUT_VENDOR)/lib/libreference-ril-gosuncn.so \
	external/wan_binaries/netcfg:$(TARGET_COPY_OUT_VENDOR)/bin/netcfg

PRODUCT_PACKAGE_OVERLAYS += device/rockchip/rk3399/rk3399pro_amolk/overlay
# Get the long list of APNs
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.version = 1.0.0 \
    ro.product.ota.host = 192.168.1.1:8888 \
    ro.sf.lcd_density = 240

PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.device.primary=HDMI-A
PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.device.extend=DSI
