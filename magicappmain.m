#include "common.h"
  
void hidEventCallback (void* target, void* refcon, IOHIDServiceRef service, IOHIDEventRef event) {

	if ([UIApplication instancesRespondToSelector:@selector(_enqueueHIDEvent:)]){
		[[UIApplication sharedApplication] _enqueueHIDEvent:event];
	}
	else{
		[[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AccessibilityUtilities.framework/"] load];
		AXEventRepresentation *rep=[objc_getClass("AXEventRepresentation") representationWithHIDEvent:event hidStreamIdentifier:@"UIApplicationEvents"];
		// IOS 8 and earlier here: handle representation to manually send touches to your view.
		NSLog(@"Touch representation: %@",rep);
	}

}


int main(int argc, const char **argv ,char *envp[]) {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	// the following is required instead of simply calling UIApplicationMain(), which expects a UIApplication to launch from within SpringBoard. We are initialising stuff manually
	// in order for the application to launch outside a SpringBoard call. Note that we never call UIApplicationMain().
	
	[UIScreen initialize]; // to fix screen scale, otherwise its half screen on retina devices
	GSInitialize(); // init Graphics Services
	BKSDisplayServicesStart(); // Grant access to Display Services
	UIApplicationInitialize(); // Init UIApplication 
	
	UIApplicationInstantiateSingleton(objc_getClass("MagicAppApplication")); // Force-initialize UIApplication class singleton
	[NSRunLoop currentRunLoop]; // false-get a currentRunLoop instance, needed later
	BKSHIDEventRegisterEventCallback(&hidEventCallback); // register hidevents callback
	if ([UIApplication instancesRespondToSelector:@selector(_installEventRunLoopSource)]){
		[[UIApplication sharedApplication] _installEventRunLoopSource]; // window hits event parser
	}
	else{
		[[UIApplication sharedApplication] _accessibilityInit]; // window hits event parser
	}
	
	GSEventInitialize(NO); // initialize GS Events
	GSEventPushRunLoopMode(kCFRunLoopDefaultMode);
 
	CFRunLoopRun(); // run application loop

	[pool drain];
	
	return 0;
}
 