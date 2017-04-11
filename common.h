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
+(id)representationWithHIDEvent:(IOHIDEventRef)event hidStreamIdentifier:(id)identifier;
@end
@interface UITouchesEvent : UIEvent
@end
	
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