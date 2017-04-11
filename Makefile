export ARCHS= arm64 armv7
include theos/makefiles/common.mk

APPLICATION_NAME = MagicApp
MagicApp_CODESIGN_FLAGS = -Sentitlements.plist
MagicApp_FILES = magicappmain.m MagicAppApplication.mm RootViewController.mm
MagicApp_FRAMEWORKS = UIKit CoreGraphics
MagicApp_PRIVATE_FRAMEWORKS = GraphicsServices BackBoardServices
MagicApp_LDFLAGS = -lsubstrate
MagicApp_INSTALL_PATH = /System/Library/CoreServices/
include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "chown root:wheel /Library/LaunchDaemons/net.limneos.magicapp.plist"
	install.exec "launchctl unload /Library/LaunchDaemons/net.limneos.magicapp.plist"
	install.exec "launchctl load /Library/LaunchDaemons/net.limneos.magicapp.plist"
