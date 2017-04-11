#import "RootViewController.h"

#include "common.h"

@interface MyWindow : UIWindow
@end


@interface MagicAppApplication: UIApplication <UIApplicationDelegate> {
	MyWindow *_awindow;
	RootViewController *_viewController;
}
@property (nonatomic, retain) UIWindow *appWindow;
@end


@implementation MyWindow
-(id)_initWithFrame:(CGRect)frame debugName:(id)name attached:(BOOL)attached{
	return objc_getClass("_UIRootWindow") ? [[objc_getClass("_UIRootWindow") alloc] _initWithFrame:frame debugName:name attached:attached] : [super _initWithFrame:frame debugName:name attached:attached]; //IOS8 Compatibility
}
-(BOOL)_isSecure{
	return YES;
}
-(BOOL)_shouldCreateContextAsSecure{
	return YES;
}
-(BOOL)_isWindowServerHostingManaged{
	return NO;
}
-(BOOL)_usesWindowServerHitTesting{
	return NO;
}
-(BOOL)_ignoresHitTest{
	return NO;
}
 
@end



@implementation MagicAppApplication{
	FBSSceneImpl *_myMainScene;
	UIView *_view;
	id _lastEvent;
}

@synthesize appWindow = _appWindow;

- (void)applicationDidFinishLaunching:(UIApplication *)application {

	if (!_appWindow){ // create our window
		if ([UIWindow instancesRespondToSelector:@selector(_initWithFrame:debugName:attached:)]){
			_appWindow = [[MyWindow alloc] _initWithFrame:[[UIScreen mainScreen] bounds] debugName:@"MyWindow" attached:YES];
		}
		else{
			_appWindow = [[MyWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]; // ios 7 compatibility	
		}
		
		_viewController = [[RootViewController alloc] init];
		[_appWindow setRootViewController:_viewController];
		_appWindow.windowLevel=10000009; //insane level for being above any window on SpringBoard, since windowLevel is relative to SpringBoard windows
		[_appWindow orderFront:nil];
		
	}
	
	 
}
 
-(id)init{

	if (self=[super init]){
		
		[[objc_getClass("NSNotificationCenter") defaultCenter] addObserverForName: nil object: nil queue: [NSOperationQueue mainQueue] usingBlock: ^(NSNotification *notification) {
			if ([[notification name] rangeOfString:@"kBKSDisplayServerDiedNotification"].location!=NSNotFound || [[notification name] rangeOfString:@"kBKSHIDServerDiedNotification"].location!=NSNotFound){
				 
				[[UIApplication sharedApplication] terminateWithSuccess]; //terminate if backboardd dies, so that the app can restart using new graphics server.
			 
			}
		}];

		if ([self respondsToSelector:@selector(_runWithMainScene:transitionContext:completion:)]){
			[self _runWithMainScene:[self mainScene] transitionContext:[objc_getClass("UIApplicationSceneTransitionContext") transitionContext] completion:NULL]; //run with our custom mainScene
		}
		 
		if (![UIApplication instancesRespondToSelector:@selector(_installEventRunLoopSource)]){ //iOS 10 only

			[self __completeAndRunAsPlugin]; // to post/receive the required kGsEventApplicationStart startup events

			UIEventDispatcher * dispatcher=(UIEventDispatcher *)[[UIApplication sharedApplication] valueForKey:@"eventDispatcher"]; // to post HID events so our app can receive UITouch events.
			[dispatcher _installEventRunLoopSources:CFRunLoopGetCurrent()];
			UIEventFetcher* fetcher=[[objc_getClass("UIEventFetcher") alloc] init];
			[dispatcher setValue:fetcher forKey:@"eventFetcher"];
			[fetcher setEventFetcherSink:dispatcher];
			[[UIApplication sharedApplication] setValue:fetcher forKey:@"eventFetcher"];
	
		}
		if (![self respondsToSelector:@selector(_runWithMainScene:transitionContext:completion:)]){
			// force completion, ios 7 only
			
			[self applicationDidFinishLaunching:self];
		}
		
	}
	return self;

}
 
-(id)_mainSceneForDisplay:(id)display{
	return [self mainScene];
}

-(id)mainScene{

	if (!_myMainScene){ // we need a custom scene since we didn't call UIApplicationMain, but UIApplicationInstantiateSingleton which doesn't do all the work automatically

		FBSDisplay *display=[[objc_getClass("FBSDisplay") alloc] initWithCADisplay:[objc_getClass("CADisplay") mainDisplay] isMainDisplay:YES];
		UIMutableApplicationSceneSettings *settings=[objc_getClass("UIMutableApplicationSceneSettings") settings];
		[settings setFrame:CGRectMake(0,0,0,0)];
		[settings setInterfaceOrientation:5];
		[settings setBackgrounded:NO];
		UIMutableApplicationSceneClientSettings *clientSettings=[objc_getClass("UIMutableApplicationSceneClientSettings") settings];
		[clientSettings setStatusBarHidden:NO];
		[clientSettings setStatusBarStyle:0];
		_myMainScene=[[objc_getClass("FBSSceneImpl") alloc] initWithQueue:dispatch_get_main_queue() identifier:@"megatron-transform" display:display settings:settings clientSettings:clientSettings];

	}
	
	return _myMainScene;
	
}

- (void)dealloc {
	[_viewController release];
	[_appWindow release];
	[super dealloc];
}
@end