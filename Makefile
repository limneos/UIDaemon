export ARCHS= arm64 armv7
GO_EASY_ON_ME=1
include theos/makefiles/common.mk

APPLICATION_NAME = MagicApp
MagicApp_CODESIGN_FLAGS = -Sentitlements.plist
MagicApp_FILES = magicappmain.m MagicAppApplication.mm RootViewController.mm
MagicApp_FRAMEWORKS = UIKit CoreGraphics
MagicApp_PRIVATE_FRAMEWORKS = GraphicsServices BackBoardServices
MagicApp_LDFLAGS = -lsubstrate
MagicApp_INSTALL_PATH = /System/Library/CoreServices/
include $(THEOS_MAKE_PATH)/application.mk
