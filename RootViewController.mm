#import "RootViewController.h"

@implementation RootViewController{
	UILabel *_label;
	UIView *_newView;
	UIView *_newView2;
}
- (void)loadView {
	
	CGRect bounds=[[UIScreen mainScreen] applicationFrame];
	self.view = [[[UIView alloc] initWithFrame:bounds] autorelease];
	self.view.backgroundColor = [UIColor clearColor];
	
	_label=[[UILabel alloc] initWithFrame:CGRectMake(0,25,bounds.size.width,50)];
	_label.textColor=[UIColor whiteColor];
	_label.font=[UIFont boldSystemFontOfSize:18];
	_label.textAlignment=NSTextAlignmentCenter;
	_label.text=@"Tap here!";

	_newView=[(UIView *)[[objc_getClass("_UIBackdropView") alloc] initWithFrame:CGRectMake(0,0,bounds.size.width,80) style:2] autorelease];
	_newView.userInteractionEnabled=YES;
	[_newView addSubview:_label];
	UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
	tap.numberOfTapsRequired=1;
	tap.numberOfTouchesRequired=1;
	[_newView addGestureRecognizer:tap];
	[tap release];
	
}
-(void)tapped:(UITapGestureRecognizer*)recog{
	
	CGPoint touchPoint=[recog locationInView:_newView];
	_label.text=[NSString stringWithFormat:@"Tapped! %@",NSStringFromCGPoint(touchPoint)];

}
-(void)viewDidAppear:(BOOL)animated{

	// called here, just for _UIBackdropView to get the correct layout
	[super viewDidAppear:animated];
	[[self.view window] addSubview:_newView];
}
@end
