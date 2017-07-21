//
//  VC_LottiesAnimation.m
//  ZMAnimation
//
//  Created by Mac2 on 2017/7/21.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "VC_LottiesAnimation.h"
#import <Lottie/Lottie.h>
@interface VC_LottiesAnimation ()

@end

@implementation VC_LottiesAnimation

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadDefaultsSetting];
    [self initSubViews];
}
#pragma mark >_<! --> 加载默认设置
-(void)loadDefaultsSetting{
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationController.navigationBar.translucent = NO;
}
#pragma mark >_<! --> 初始化子视图
-(void)initSubViews{
    
    LOTAnimationView * v_animation = [LOTAnimationView animationNamed:@"trail_loading"];
    v_animation.frame = CGRectMake(0, 0, MainScreen_Width, MainScreen_Width);
    v_animation.animationSpeed = 0.5;
    v_animation.loopAnimation = YES;
    [self.view addSubview:v_animation];
    [v_animation play];
    
}
@end
