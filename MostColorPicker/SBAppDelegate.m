//
//  SBAppDelegate.m
//  MostColorPicker
//
//  Created by Travis on 13-5-30.
//  Copyright (c) 2013年 Plumn LLC. All rights reserved.
//

#import "SBAppDelegate.h"

#import "UIImage+MostColor.h"


@implementation SBAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor=[UIColor whiteColor];
    
    self.imageView=[[[UIImageView alloc] initWithFrame:CGRectMake(110, 200, 100, 100)] autorelease];
    [self.window addSubview:self.imageView];
    
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    btn.frame=CGRectMake(20, 20, 60, 60);
    [btn addTarget:self action:@selector(onBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"1" forState:UIControlStateNormal];
    btn.tag=1;
    [self.window addSubview:btn];
    
    btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn addTarget:self action:@selector(onBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame=CGRectMake(100, 20, 60, 60);
    [btn setTitle:@"2" forState:UIControlStateNormal];
    btn.tag=2;
    [self.window addSubview:btn];
    
    btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn addTarget:self action:@selector(onBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame=CGRectMake(180, 20, 60, 60);
    [btn setTitle:@"3" forState:UIControlStateNormal];
    btn.tag=3;
    [self.window addSubview:btn];
    
    return YES;
}

-(void)onBtn:(UIButton*)btn{
    UIImage *img=[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",btn.tag]];
    self.imageView.image=img;
    
    UIColor *most=[img mostColor];
    self.window.backgroundColor=most;
    
}


@end
