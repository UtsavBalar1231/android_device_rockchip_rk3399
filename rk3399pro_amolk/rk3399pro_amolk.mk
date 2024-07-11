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
PRODUCT_BOOT_DEVICE := fe330000.sdhci

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

PRODUCT_PACKAGE_OVERLAYS += device/rockchip/rk3399/rk3399pro_amolk/overlay

# Get the long list of APNs
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.version=1.0.0 \
    ro.product.ota.host=192.168.1.1:8888 \
    ro.sf.lcd_density=240

PRODUCT_COPY_FILES += \
    external/wan_binaries/init.gprs-pppd:$(TARGET_COPY_OUT_VENDOR)/etc/init.gprs-pppd \
    external/wan_binaries/ip-down-ppp0:$(TARGET_COPY_OUT_VENDOR)/etc/ppp/ip-down-ppp0 \
    external/wan_binaries/ip-up-ppp0:$(TARGET_COPY_OUT_VENDOR)/etc/ppp/ip-up-ppp0 \
    external/wan_binaries/libreference-ril-gosuncn.so:$(TARGET_COPY_OUT_VENDOR)/lib/libreference-ril-gosuncn.so \
    external/wan_binaries/libreference-ril-gosuncn.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libreference-ril-gosuncn.so \
    external/wan_binaries/netcfg:$(TARGET_COPY_OUT_VENDOR)/bin/netcfg

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.rild.libpath=/vendor/lib64/libreference-ril-gosuncn.so

PRODUCT_PACKAGES_DEBUG += \
    zw_programmer

PRODUCT_COPY_FILES += \
    vendor/rockchip/common/zwave_programmer/serialapi_controller_bridge_ZM5304_USBVCP_US.hex:$(TARGET_COPY_OUT_VENDOR)/etc/serialapi_controller_bridge_ZM5304_USBVCP_US.hex

PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.device.primary=HDMI-A-1
PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.device.extend=DSI,DP

# WFX firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wfx/wf200.pds:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/wfx/wf200.pds \
    $(LOCAL_PATH)/wfx/wfm_wf200.sec:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/wfx/wfm_wf200.sec \
    $(LOCAL_PATH)/wfx/wfm_wf200_C0.sec:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/wfx/wfm_wf200_C0.sec

PRODUCT_PACKAGES += vim
