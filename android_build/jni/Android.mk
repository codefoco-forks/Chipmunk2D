LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_C_INCLUDES += ../include 
LOCAL_MODULE    := chipmunk
LOCAL_CFLAGS    := -I../include -DNDEBUG
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
	LOCAL_CFLAGS += -DDISABLE_NEON
endif

ifeq ($(TARGET_ARCH_ABI), arm64-v8a)
	LOCAL_ARM_NEON  := true
	LOCAL_CFLAGS += -D__ARM_HAVE_NEON
endif

LOCAL_SRC_FILES :=  \
../../src/chipmunk.c ../../src/cpArbiter.c ../../src/cpArray.c ../../src/cpBBTree.c \
 ../../src/cpBody.c ../../src/cpCollision.c ../../src/cpConstraint.c ../../src/cpDampedRotarySpring.c \
 ../../src/cpDampedSpring.c ../../src/cpGearJoint.c ../../src/cpGrooveJoint.c ../../src/cpHashSet.c \
 ../../src/cpHastySpace.c ../../src/cpMarch.c ../../src/cpPinJoint.c ../../src/cpPivotJoint.c \
 ../../src/cpPolyline.c ../../src/cpPolyShape.c ../../src/cpRatchetJoint.c ../../src/cpRobust.c \
 ../../src/cpRotaryLimitJoint.c ../../src/cpShape.c ../../src/cpSimpleMotor.c ../../src/cpSlideJoint.c \
 ../../src/cpSpace.c ../../src/cpSpaceComponent.c ../../src/cpSpaceDebug.c ../../src/cpSpaceHash.c \
 ../../src/cpSpaceQuery.c ../../src/cpSpaceStep.c ../../src/cpSpatialIndex.c ../../src/cpSweep1D.c

include $(BUILD_SHARED_LIBRARY)
