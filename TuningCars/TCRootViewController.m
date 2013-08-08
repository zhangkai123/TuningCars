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
@end

@implementation TCRootViewController

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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
        
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
    [self presentViewController:viewController animated:YES completion:nil];
    [viewController release];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
