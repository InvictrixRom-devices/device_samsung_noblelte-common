# Copyright 2006 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_VENDOR_MODULE := true

LOCAL_SRC_FILES:= \
    ril.cpp \
    ril_event.cpp\
    RilSapSocket.cpp \
    ril_service.cpp \
    sap_service.cpp

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libcutils \
    libhardware_legacy \
    librilutils \
    android.hardware.radio@1.0 \
    android.hardware.radio.deprecated@1.0 \
    libhidlbase  \
    libhidltransport \
    libhwbinder

LOCAL_STATIC_LIBRARIES := \
    libprotobuf-c-nano-enable_malloc \

LOCAL_CFLAGS += -Wno-unused-parameter

ifeq ($(SIM_COUNT), 2)
    LOCAL_CFLAGS += -DANDROID_MULTI_SIM -DDSDA_RILD1
    LOCAL_CFLAGS += -DANDROID_SIM_COUNT_2
endif

LOCAL_C_INCLUDES += external/nanopb-c
LOCAL_C_INCLUDES += hardware/ril/include
LOCAL_EXPORT_C_INCLUDE_DIRS := hardware/ril/include

LOCAL_MODULE:= libril
LOCAL_CLANG := true
LOCAL_SANITIZE := integer

include $(BUILD_SHARED_LIBRARY)

