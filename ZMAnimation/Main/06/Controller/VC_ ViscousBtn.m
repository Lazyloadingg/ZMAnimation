//
//  VC_ ViscousBtn.m
//  ZMAnimation
//
//  Created by Mac2 on 2017/7/11.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "VC_ ViscousBtn.h"
#import "V_ViscousBtn.h"
#import "ZMHead.h"
@interface VC__ViscousBtn ()
@property(nonatomic,strong)V_ViscousBtn * btn;
@end

@implementation VC__ViscousBtn

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
    
    V_ViscousBtn * btn = [[V_ViscousBtn alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    btn.backgroundColor = [[UIColor blueColor]colorWithAlphaComponent:0.3];
    [self.view addSubview:btn];
    self.btn = btn;
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [btn addGestureRecognizer:pan];
    
}
-(void)panAction:(UIPanGestureRecognizer *)pan{
    
    CGPoint translation = [pan translationInView:self.view];
    CGPoint newCenter = CGPointMake(pan.view.center.x+ translation.x,
                                    pan.view.center.y + translation.y);
    //    限制屏幕范围：
    newCenter.y = MAX(pan.view.frame.size.height/2, newCenter.y);
    newCenter.y = MIN(self.view.frame.size.height - pan.view.frame.size.height/2,  newCenter.y);
    newCenter.x = MAX(pan.view.frame.size.width/2, newCenter.x);
    newCenter.x = MIN(self.view.frame.size.width - pan.view.frame.size.width/2,newCenter.x);
    pan.view.center = newCenter;
    
    [pan setTranslation:CGPointZero inView:self.view];

    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
        case UIGestureRecognizerStateChanged:
            
            break;
        case UIGestureRecognizerStateEnded:
            if (pan.view.center.x >= MainScreen_Width/2) {
                [UIView animateWithDuration:0.15 animations:^{
                    pan.view.center = CGPointMake(MainScreen_Width - pan.view.bounds.size.width/2, pan.view.center.y);
                }];

            }else{
                [UIView animateWithDuration:0.15 animations:^{
                    pan.view.center = CGPointMake(pan.view.bounds.size.width/2, pan.view.center.y);
                }];
            }
            break;
            
        default:
            break;
    }
}

@end
