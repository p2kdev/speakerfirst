export THEOS_PACKAGE_SCHEME=rootless
export TARGET = iphone:clang:13.7:13.0

PACKAGE_VERSION=$(THEOS_PACKAGE_BASE_VERSION)

export ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = InCallService

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpeakerFirst

$(TWEAK_NAME)_FILES = $(wildcard *.x)
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload"
