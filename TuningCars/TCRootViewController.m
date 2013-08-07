//
//  TCRootViewController.m
//  TuningCars
//
//  Created by zhangkai on 8/7/13.
//  Copyright (c) 2013 zhangkai. All rights reserved.
//

#import "TCRootViewController.h"
#import "cocos2d.h"
#import "CC3EAGLView.h"
#import "TC3DViewController.h"

@interface TCRootViewController ()
{
    EAGLView *glView;
}
@end

@implementation TCRootViewController

-(void)dealloc
{
    [glView release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    if( ! [CCDirector setDirectorType: kCCDirectorTypeDisplayLink] )
		[CCDirector setDirectorType: kCCDirectorTypeDefault];
	
	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images.
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565. You can change anytime.
	CCTexture2D.defaultAlphaPixelFormat = kCCTexture2DPixelFormat_RGBA8888;
        
    // Create the CCDirector, set the frame rate, and attach the view.
	CCDirector *director = CCDirector.sharedDirector;
    //	director.runLoopCommon = YES;		// Improves display link integration with UIKit
	director.animationInterval = (1.0f / 60.0);
	director.displayFPS = YES;
    
    glView = [CC3EAGLView viewWithFrame: CGRectMake(0, 0, 320, 460)
									  pixelFormat: kEAGLColorFormatRGBA8
									  depthFormat: GL_DEPTH_COMPONENT16_OES
							   preserveBackbuffer: NO
									   sharegroup: nil
									multiSampling: NO
								  numberOfSamples: 4];
	
	// attach the openglView to the director
	[director setOpenGLView:glView];

	
	// Enables High Res mode on Retina Displays and maintains low res on all other devices
	// This must be done after the GL view is assigned to the director!
	[director enableRetinaDisplay: YES];

    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(130, 400, 60, 30)];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"3D" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goTo3D) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button release];
}
-(void)goTo3D
{
    TC3DViewController *viewController = [TC3DViewController new];
    [viewController setView:glView];
    [self presentViewController:viewController animated:YES completion:nil];
    [viewController release];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
