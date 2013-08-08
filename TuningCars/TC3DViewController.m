//
//  TC3DViewController.m
//  TuningCars
//
//  Created by zhangkai on 8/7/13.
//  Copyright (c) 2013 zhangkai. All rights reserved.
//

#import "TC3DViewController.h"
#import "MainLayer.h"

@interface TC3DViewController ()
{
    CCScene *scene;
    MainLayer *layer;
}
@end

@implementation TC3DViewController

-(void)dealloc
{
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
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
-(void)viewWillDisappear:(BOOL)animated {
    
    [layer unscheduleUpdate];
    [layer removeAllChildrenWithCleanup:YES];
    [[CCDirector sharedDirector].runningScene removeAllChildrenWithCleanup:YES];
    [[CCDirector sharedDirector]stopAnimation];
    [[CCDirector sharedDirector]popScene];
    layer = nil;
    scene = nil;
    
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if( ! [CCDirector setDirectorType:kCCDirectorTypeDisplayLink] )
        [CCDirector setDirectorType:kCCDirectorTypeDefault];
    
    CCDirector *director = [CCDirector sharedDirector];
    
    [director setDeviceOrientation:kCCDeviceOrientationPortrait];
    
    [director setAnimationInterval:1.0/60];
    [director setDisplayFPS:YES];
    [director enableRetinaDisplay:YES];
    
    EAGLView* eagl = [EAGLView viewWithFrame: CGRectMake(0, 0, 320, 460)
                                 pixelFormat: kEAGLColorFormatRGBA8
                                 depthFormat: GL_DEPTH_COMPONENT16_OES
                          preserveBackbuffer: NO
                                  sharegroup: nil
                               multiSampling: NO
                             numberOfSamples: 4];
    
    [director setOpenGLView:eagl];
    [self.view addSubview:eagl];
    
    // Run the intro Scene
	scene = [CCScene node];
    layer = [MainLayer node];
	[scene addChild: layer];
    if([director runningScene])
        [director replaceScene:scene];
    else
        [director runWithScene:scene];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 60, 30)];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"BACK" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIView* glView = [CCDirector sharedDirector].openGLView;
    // add the text field view to the cocos2d CCGLView
    [glView addSubview:button];
    [button release];
}
-(void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
