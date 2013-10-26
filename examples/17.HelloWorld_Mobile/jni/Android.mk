LOCAL_PATH := $(call my-dir)/..
IRRLICHT_PROJECT_PATH := $(LOCAL_PATH)

include $(CLEAR_VARS)

LOCAL_MODULE := HelloWorldMobile

LOCAL_CFLAGS := -D_IRR_ANDROID_PLATFORM_ -pipe -fno-exceptions -fno-rtti -fstrict-aliasing

ifndef NDEBUG
LOCAL_CFLAGS += -g -D_DEBUG
else
LOCAL_CFLAGS += -fexpensive-optimizations -O3
endif

ifeq ($(TARGET_ARCH_ABI),x86)
LOCAL_CFLAGS += -fno-stack-protector
endif

LOCAL_C_INCLUDES := ../../include

LOCAL_SRC_FILES := main.cpp

LOCAL_LDLIBS := -L$(LOCAL_PATH)/../../lib/Android -lEGL -llog -lGLESv1_CM -lGLESv2 -lz -landroid -lIrrlicht

LOCAL_STATIC_LIBRARIES := android_native_app_glue

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

# copy Irrlicht data to assets

$(shell mkdir -p $(IRRLICHT_PROJECT_PATH)/assets)
$(shell mkdir -p $(IRRLICHT_PROJECT_PATH)/assets/media)
$(shell mkdir -p $(IRRLICHT_PROJECT_PATH)/assets/media/Shaders)
$(shell mkdir -p $(IRRLICHT_PROJECT_PATH)/src)
$(shell cp $(IRRLICHT_PROJECT_PATH)/../../media/Shaders/*.* $(IRRLICHT_PROJECT_PATH)/assets/media/Shaders/)
$(shell cp $(IRRLICHT_PROJECT_PATH)/../../media/irrlichtlogo3.png $(IRRLICHT_PROJECT_PATH)/assets/media/)
$(shell cp $(IRRLICHT_PROJECT_PATH)/../../media/sydney.md2 $(IRRLICHT_PROJECT_PATH)/assets/media/)
$(shell cp $(IRRLICHT_PROJECT_PATH)/../../media/sydney.bmp $(IRRLICHT_PROJECT_PATH)/assets/media/)
