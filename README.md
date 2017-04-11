# UIDaemon

A daemon sample running on iOS that can show UI contents over SpringBoard, 
supporting window transparency and touches. 

Inspired after studying how assistivetouchd works, the daemon that runs on iOS when AssistiveTouch accessibility feature
is enabled, and shows UI tools for accessibility /over/ SpringBoard.

<strong>Note:</strong> Touches work out of the box on iOS 9-10, for earlier versions you need to pass the touches to your views. (You still get all the touch info, dispatching is the only thing lacking).

The daemon registers a mach service port and you can launch it on demand by sending a message to that port.

e.g. upon springboard launch:

    %hook SpringBoard
    -(void)applicationDidFinishLaunching:(id)appl{
      %orig;
      CFMessagePortRef port=CFMessagePortCreateRemote(NULL,@"net.limneos.magicapp.springboardDidFinishLaunching");
      CFMessagePortSendRequest(port, 1,(CFDataRef)[NSData data], 10,10, NULL,NULL);
    }
    %end

To manually launch the application:

		/System/Library/CoreServices/MagicApp.app/MagicApp
		

This sample demonstrates the ability to use touches out of the box, 
the ability to choose hitTest transparency , 
and the ability to set view's transparency over SpringBoard, still showing SpringBoard's contents.
e.g. Getting a screen shot from within the daemon, will also grab SpringBoard's contents.

You will be surprised to see that even after killing SpringBoard process, the application
still runs, showing its UI and accepting touches. 
The only thing that stops the app's UI is backboardd termination.
Therefore I have a listener that stops the application when backboardd exits.