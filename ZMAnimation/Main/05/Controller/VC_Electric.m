//
//  VC_Electric.m
//  ZMAnimation
//
//  Created by Mac2 on 2017/7/10.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "VC_Electric.h"
#import "ZMHead.h"
@interface VC_Electric ()
@property(nonatomic,strong)UIView * v_progress;
@end

@implementation VC_Electric

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
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
    
    UIView * v_progress = [[UIView alloc]initWithFrame:self.view.bounds];
    v_progress.backgroundColor = [[UIColor blueColor]colorWithAlphaComponent:0.4];
    [self.view addSubview:v_progress];
    self.v_progress = v_progress;
    
    CAShapeLayer * layerBottom = [CAShapeLayer layer];
    layerBottom.fillColor = [UIColor clearColor].CGColor;
    layerBottom.strokeColor = [UIColor whiteColor].CGColor;
    layerBottom.lineWidth = 10;
    layerBottom.lineDashPattern = @[@3];
    UIBezierPath * pathBottom = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(25, 64, MainScreen_Width-50, MainScreen_Width-50)];
    layerBottom.path = pathBottom.CGPath;
    [self.v_progress.layer addSublayer:layerBottom];
    
    CAShapeLayer * layerTop = [CAShapeLayer layer];
    layerTop.fillColor = [UIColor clearColor].CGColor;
    layerTop.strokeColor = [UIColor yellowColor].CGColor;
    layerTop.lineWidth = 10;
    layerTop.lineDashPattern = @[@3];
    layerTop.strokeEnd = 0.5;
    UIBezierPath * pathTop = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(25, 64, MainScreen_Width-50, MainScreen_Width-50)];
    layerTop.path = pathTop.CGPath;
    [self.v_progress.layer addSublayer:layerTop];
    
}
@end
