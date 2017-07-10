//
//  VC_LineChartAnimation.m
//  ZMAnimation
//
//  Created by Mac2 on 2017/7/7.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "VC_LineChartAnimation.h"
#import "ZMHead.h"
@interface VC_LineChartAnimation ()
@property(nonatomic,strong)UIBezierPath * path;
@end

@implementation VC_LineChartAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self initSubViews];
}
#pragma mark --> 🐷 初始化子视图 🐷
-(void)initSubViews{
    
    CAShapeLayer * shapelayer = [CAShapeLayer layer];
    shapelayer.frame = self.view.layer.bounds;
    shapelayer.backgroundColor = [UIColor clearColor].CGColor;
    shapelayer.path = self.path.CGPath;
    shapelayer.fillColor = [UIColor clearColor].CGColor;
    shapelayer.strokeColor = [UIColor whiteColor].CGColor;
    shapelayer.lineWidth = 0.5;
    shapelayer.opacity = 0.7;
    
    [self.view.layer addSublayer:shapelayer];
    
    CAShapeLayer * subLayer = [CAShapeLayer layer];
    subLayer.path = self.path.CGPath;
    subLayer.fillColor = [UIColor clearColor].CGColor;
    subLayer.lineWidth = 1.0f;
    subLayer.strokeEnd = 0.0f;
    subLayer.strokeColor  = [UIColor redColor].CGColor;
    [subLayer setTransform:CATransform3DMakeScale(1, 1, 1.f)];
    [self.view.layer addSublayer:subLayer];
    
    CABasicAnimation * ani_start = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    ani_start.toValue = @(0.98);
    ani_start.fromValue =@(0);
    
    CABasicAnimation * ani_end = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    ani_end.fromValue = @(0.02);
    ani_end.toValue = @(1);
    
    CAAnimationGroup * aniGroup = [CAAnimationGroup animation];
    aniGroup.duration = 4.0f;
    aniGroup.autoreverses = YES;
    aniGroup.repeatCount = CGFLOAT_MAX;
    aniGroup.animations = @[ani_start,ani_end];
    
    [subLayer addAnimation:aniGroup forKey:nil];
    
}
#pragma mark --> 🐷 lazy load 🐷
-(UIBezierPath *)path{
    if (!_path) {
        _path = [UIBezierPath bezierPath];
        [_path moveToPoint   : CGPointMake(0, 150)];
        [_path addLineToPoint: CGPointMake(68, 150)];
        [_path addLineToPoint: CGPointMake(83, 107)];
        [_path addLineToPoint: CGPointMake(96, 206)];
        [_path addLineToPoint: CGPointMake(102, 150)];
        [_path addLineToPoint: CGPointMake(116, 150)];
        [_path addLineToPoint: CGPointMake(127, 82)];
        [_path addLineToPoint: CGPointMake(143, 213)];
        [_path addLineToPoint: CGPointMake(160, 150)];
        [_path addLineToPoint: CGPointMake(179, 150)];
        [_path addLineToPoint: CGPointMake(183, 135)];
        [_path addLineToPoint: CGPointMake(192, 169)];
        [_path addLineToPoint: CGPointMake(199, 150)];
        [_path addLineToPoint: CGPointMake(210, 177)];
        [_path addLineToPoint: CGPointMake(227, 70)];
        [_path addLineToPoint: CGPointMake(230, 210)];
        [_path addLineToPoint: CGPointMake(249, 135)];
        [_path addLineToPoint: CGPointMake(257, 150)];
        [_path addLineToPoint: CGPointMake(360, 150)];
        [_path addLineToPoint: CGPointMake(372, 124)];
        [_path addLineToPoint: CGPointMake(395, 197)];
        [_path addLineToPoint: CGPointMake(408, 82)];
        [_path addLineToPoint: CGPointMake(416, 150)];
        [_path addLineToPoint: CGPointMake(424, 135)];
        [_path addLineToPoint: CGPointMake(448, 224)];
        [_path addLineToPoint: CGPointMake(456, 107)];
        [_path addLineToPoint: CGPointMake(463, 150)];
        [_path addLineToPoint: CGPointMake(600, 150)];
    }
    return _path;
}
-(void)dealloc{
    ZMLog(@"VC_LineChartAnimation 自爆完成");
}
@end
