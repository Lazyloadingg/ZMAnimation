//
//  ZMLaunchController.m
//  ZMAnimation
//
//  Created by Mac2 on 2017/7/21.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "ZMLaunchController.h"
#import <lottie-ios/Lottie/Lottie.h>
#import "ZMHead.h"
@interface ZMLaunchController ()

@end

@implementation ZMLaunchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultsSetting];
    [self initSubViews];
}
#pragma mark >_<! 👉🏻 🐷Life cycle🐷
#pragma mark >_<! 👉🏻 🐷System Delegate🐷
#pragma mark >_<! 👉🏻 🐷Custom Delegate🐷
#pragma mark >_<! 👉🏻 🐷Event  Response🐷
#pragma mark >_<! 👉🏻 🐷Private Methods🐷
#pragma mark >_<! 👉🏻 🐷Lazy loading🐷
#pragma mark >_<! 👉🏻 🐷Init SubViews🐷
-(void)initSubViews{
//    LOTAnimationView * v_animation = [LOTAnimationView animationNamed:@"servishero_loading"];
//    v_animation.bounds = CGRectMake(0, 0, MainScreen_Width, MainScreen_Width);
//    v_animation.center = self.view.center;
//    v_animation.animationSpeed = 0.5;
//    v_animation.loopAnimation = YES;
//    [self.view addSubview:v_animation];
//    [v_animation play];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [ (AppDelegate *)[UIApplication sharedApplication].delegate changeRootController];
    });
}
-(void)loadDefaultsSetting{
    self.view.backgroundColor = [UIColor whiteColor];
}
@end
