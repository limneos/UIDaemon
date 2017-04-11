#import <UIKit/UIKit.h>
#import "substrate.h"
#import <xpc/xpc.h>
#include <hid/IOHIDEventSystem.h>
#include <mach/message.h>
#include "GSEvent.h"
#include <mach/mach.h>
#include <mach/mig.h>


@interface UIApplication ()
-(void)_installEventRunLoopSource;
-(void)_accessibilityInit;
-(void)_enqueueHIDEvent:(IOHIDEventRef)event;
-(void)terminateWithSuccess;
-(void)__completeAndRunAsPlugin;
-(void)_runWithMainScene:(id)scene transitionContext:(id)context completion:(id)completionBlock;
@end

id (*m__UIKitUserDefaults)();
id (*m__UIKitPreferencesOnce)();

void *BKSHIDEventRegisterEventCallback(void *);
void UIApplicationInstantiateSingleton(id aclass);
void UIApplicationInitialize();
void BKSDisplayServicesStart();
void GSInitialize();


@interface UIWindow ()
-(id)_initWithFrame:(CGRect)frame debugName:(id)name attached:(BOOL)attached;
-(void)orderFront:(id)arg1;
@end

@interface FBSDisplay : NSObject
-(id)initWithCADisplay:(id)display isMainDisplay:(BOOL)isMain;
@end
@interface UIMutableApplicationSceneClientSettings : NSObject
-(void)setStatusBarHidden:(BOOL)hidden;
-(void)setStatusBarStyle:(int)style;
@end
@interface FBSSceneImpl : NSObject
-(id)initWithQueue:(dispatch_queue_t)queue identifier:(id)identifier display:(id)display settings:(id)settings clientSettings:(id)clientSettings;
@end
@interface _UIRootWindow : UIWindow
@end


@interface UIApplicationSceneTransitionContext : NSObject
+(id)transitionContext;
@end

@interface UIMutableApplicationSceneSettings : NSObject
+(id)settings;
-(void)setFrame:(CGRect)frame;
-(void)setInterfaceOrientation:(int)orient;
-(void)setBackgrounded:(BOOL)backgrounded;
@end


@interface CADisplay : NSObject
+(id)mainDisplay;
-(CGRect)bounds;
@end

@interface UIScreen ()
-(CADisplay *)_display;
@end

@interface UIEventDispatcher : NSObject
-(void)_installEventRunLoopSources:(CFRunLoopRef)sources;
@end

@interface UIEventFetcher : NSObject
-(void)setEventFetcherSink:(id)sink;
@end

@interface UIInternalEvent : NSObject
-(void)_setHIDEvent:(IOHIDEventRef)event;
@end

@interface AXEventRepresentation : NSObject
+(id)representationWithHIDEvent:(id)event hidStreamIdentifier:(id)identifier;
@end
@interface UITouchesEvent : UIEvent
@end

typedef struct  {
		unsigned deactivatingReasonFlags : 8;
		unsigned isSuspended : 1;
		unsigned isSuspendedEventsOnly : 1;
		unsigned isLaunchedSuspended : 1;
		unsigned calledNonSuspendedLaunchDelegate : 1;
		unsigned isHandlingURL : 1;
		unsigned isHandlingRemoteNotification : 1;
		unsigned isHandlingLocalNotification : 1;
		unsigned isHandlingBackgroundContentFetch : 1;
		unsigned statusBarShowsProgress : 1;
		unsigned statusBarHidden : 1;
		unsigned blockInteractionEvents : 4;
		unsigned receivesMemoryWarnings : 1;
		unsigned showingProgress : 1;
		unsigned receivesPowerMessages : 1;
		unsigned launchEventReceived : 1;
		unsigned systemIsAnimatingApplicationLifecycleEvent : 1;
		unsigned isResuming : 1;
		unsigned isSuspendedUnderLock : 1;
		unsigned shouldExitAfterSendSuspend : 1;
		unsigned terminating : 1;
		unsigned isHandlingShortCutURL : 1;
		unsigned idleTimerDisabled : 1;
		unsigned deviceOrientation : 3;
		unsigned delegateShouldBeReleasedUponSet : 1;
		unsigned delegateHandleOpenURL : 1;
		unsigned delegateOpenURL : 1;
		unsigned delegateDidReceiveMemoryWarning : 1;
		unsigned delegateWillTerminate : 1;
		unsigned delegateSignificantTimeChange : 1;
		unsigned delegateWillChangeInterfaceOrientation : 1;
		unsigned delegateDidChangeInterfaceOrientation : 1;
		unsigned delegateWillChangeStatusBarFrame : 1;
		unsigned delegateDidChangeStatusBarFrame : 1;
		unsigned delegateDeviceAccelerated : 1;
		unsigned delegateDeviceChangedOrientation : 1;
		unsigned delegateDidBecomeActive : 1;
		unsigned delegateWillResignActive : 1;
		unsigned delegateDidEnterBackground : 1;
		unsigned delegateDidEnterBackgroundWasSent : 1;
		unsigned delegateWillEnterForeground : 1;
		unsigned delegateWillSuspend : 1;
		unsigned delegateDidResume : 1;
		unsigned delegateSupportsStateRestoration : 1;
		unsigned delegateSupportedInterfaceOrientations : 1;
		unsigned userDefaultsSyncDisabled : 1;
		unsigned headsetButtonClickCount : 4;
		unsigned isHeadsetButtonDown : 1;
		unsigned isFastForwardActive : 1;
		unsigned isRewindActive : 1;
		unsigned shakeToEdit : 1;
		unsigned isClassic : 1;
		unsigned zoomInClassicMode : 1;
		unsigned ignoreHeadsetClicks : 1;
		unsigned touchRotationDisabled : 1;
		unsigned taskSuspendingUnsupported : 1;
		unsigned taskSuspendingOnLockUnsupported : 1;
		unsigned isUnitTests : 1;
		unsigned requiresHighResolution : 1;
		unsigned disableViewContentScaling : 1;
		unsigned singleUseLaunchOrientation : 3;
		unsigned defaultInterfaceOrientation : 3;
		unsigned supportedInterfaceOrientationsMask : 5;
		unsigned delegateWantsNextResponder : 1;
		unsigned isRunningInApplicationSwitcher : 1;
		unsigned isSendingEventForProgrammaticTouchCancellation : 1;
		unsigned delegateWantsStatusBarTouchesEnded : 1;
		unsigned interfaceLayoutDirectionIsValid : 1;
		unsigned interfaceLayoutDirection : 3;
		unsigned restorationExtended : 1;
		unsigned normalRestorationInProgress : 1;
		unsigned normalRestorationCompleted : 1;
		unsigned isDelayingTintViewChange : 1;
		unsigned isUpdatingTintViewColor : 1;
		unsigned isHandlingMemoryWarning : 1;
		unsigned forceStatusBarTintColorChanges : 1;
		unsigned disableLegacyAutorotation : 1;
		unsigned isFakingForegroundTransitionForBackgroundFetch : 1;
		unsigned couldNotRestoreStateWhenLocked : 1;
		unsigned disableStyleOverrides : 1;
		unsigned legibilityAccessibilitySettingEnabled : 1;
		unsigned viewControllerBasedStatusBarAppearance : 1;
		unsigned fakingRequiresHighResolution : 1;
		unsigned isStatusBarFading : 1;
	}  applicationFlags;
	
@interface UITouch (synthesize){
	/*int _tapCount;
	CGPoint _locationInWindow;
	CGPoint _previousLocationInWindow;
	UIView *_view;
	UITouchPhase _phase;
	UIWindow *_window;
	NSTimeInterval _timestamp;*/
}
@end