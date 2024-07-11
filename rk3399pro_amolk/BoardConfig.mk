include device/rockchip/rk3399/BoardConfig.mk

TARGET_BOARD_PLATFORM := rk3399pro
BOARD_SENSOR_ST := true
BOARD_SENSOR_COMPASS_AK8963-64 := false
BOARD_SENSOR_MPU_PAD := false
BOARD_COMPASS_SENSOR_SUPPORT := false
BOARD_GYROSCOPE_SENSOR_SUPPORT := false
CAMERA_SUPPORT_AUTOFOCUS := false

BOARD_CAMERA_SUPPORT := false
BOARD_CAMERA_SUPPORT_EXT := false
PRODUCT_KERNEL_DTS := rk3399pro-amolk-android
PRODUCT_UBOOT_CONFIG := rk3399pro
BOARD_HS_ETHERNET := false

# AB image definition
BOARD_USES_AB_IMAGE := false
BOARD_ROCKCHIP_VIRTUAL_AB_ENABLE := false

# Dongle
BOARD_HAVE_DONGLE := true
BOARD_HAS_RK_4G_MODEM := true

ifeq ($(strip $(BOARD_USES_AB_IMAGE)), true)
    include device/rockchip/common/BoardConfig_AB.mk
    TARGET_RECOVERY_FSTAB := device/rockchip/rk3399/rk3399pro_amolk/recovery.fstab_AB
endif

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/rockchip/rk3399/rk3399pro_amolk/bluetooth
