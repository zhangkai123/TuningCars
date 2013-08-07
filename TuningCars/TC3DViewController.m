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
    CCScene *blankScene;
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
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
	// Run the intro Scene
	CCScene *scene = [CCScene node];
	[scene addChild: [MainLayer node]];
    if ([CCDirector sharedDirector].runningScene == nil) {
        [[CCDirector sharedDirector] runWithScene: scene];
    }else{
        [[CCDirector sharedDirector] replaceScene: scene];
    }
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 60, 30)];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"BACK" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIView* glView = [CCDirector sharedDirector].openGLView;
    // add the text field view to the cocos2d CCGLView
    [glView addSubview:button];
    [button release];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.    
}
-(void)goBack
{
    [self dismissViewControllerAnimated:YES completion:^{
        [[CCDirector sharedDirector].runningScene removeAllChildrenWithCleanup:YES];
        blankScene = [CCScene node];
        [[CCDirector sharedDirector] replaceScene:blankScene];
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
