//
//  VC_Electric.m
//  ZMAnimation
//
//  Created by Mac2 on 2017/7/10.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "VC_Electric.h"
#import "ZMHead.h"

#define WaterMaxHeight MainScreen_Width-120
@interface VC_Electric ()
@property(nonatomic,strong)UIView * v_progress;
@property(nonatomic,strong)UISlider * v_slider;
@property(nonatomic,strong)CAShapeLayer * lay_progress;
@property(nonatomic,strong)CAShapeLayer * lay_water1;
@property(nonatomic,strong)CAShapeLayer * lay_water2;
@property(nonatomic,strong)UIView * v_water1;
@property(nonatomic,strong)UIView * v_water2;
@property(nonatomic,assign)CGFloat water1_x;
@property(nonatomic,assign)CGFloat water2_x;
@property(nonatomic,assign)CGFloat waterHeight;
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
    v_progress.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.4];
    [self.view addSubview:v_progress];
    self.v_progress = v_progress;
    
    CAShapeLayer * layerBottom = [CAShapeLayer layer];
    layerBottom.fillColor = [UIColor clearColor].CGColor;
    layerBottom.strokeColor = [UIColor whiteColor].CGColor;
    layerBottom.lineWidth = 3;
    layerBottom.lineDashPattern = @[@2];
    UIBezierPath * pathBottom = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 84, MainScreen_Width-100, MainScreen_Width-100)];
    layerBottom.path = pathBottom.CGPath;
    [self.v_progress.layer addSublayer:layerBottom];
    
    CAShapeLayer * layerTop = [CAShapeLayer layer];
    layerTop.fillColor = [UIColor clearColor].CGColor;
    layerTop.strokeColor = [UIColor yellowColor].CGColor;
    layerTop.lineWidth = 10;
    layerTop.lineDashPattern = @[@2];
    layerTop.strokeEnd = 0.0;
    UIBezierPath * pathTop = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 84, MainScreen_Width-100, MainScreen_Width-100)];
    layerTop.path = pathTop.CGPath;
    self.lay_progress = layerTop;
    [self.v_progress.layer addSublayer:layerTop];
    
    CAShapeLayer * layerLine = [CAShapeLayer layer];
    layerLine.fillColor = [UIColor clearColor].CGColor;
    layerLine.strokeColor = [UIColor whiteColor].CGColor;
    layerLine.lineWidth = 0.4;
    UIBezierPath * pathLine = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(60, 94, MainScreen_Width-120, MainScreen_Width-120)];
    layerLine.path = pathLine.CGPath;
    [self.v_progress.layer addSublayer:layerLine];
    
    UISlider * v_slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 450, MainScreen_Width-100, 10)];
    [v_slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:v_slider];
    
    UIView * v_water1 = [[UIView alloc]initWithFrame:CGRectMake(60, 94, MainScreen_Width-120, MainScreen_Width-120)];
    v_water1.layer.cornerRadius = (MainScreen_Width-120)/2;
    v_water1.layer.masksToBounds = YES;
    v_water1.backgroundColor = [UIColor colorWithRed:0.34 green:0.40 blue:0.71 alpha:0.80];
    [v_water1.layer addSublayer:_lay_water1];
    [self.v_progress addSubview:v_water1];
    self.v_water1 = v_water1;
    
    UIView * v_water2 = [[UIView alloc]initWithFrame:CGRectMake(60, 94, MainScreen_Width-120, MainScreen_Width-120)];
    v_water2.layer.cornerRadius = (MainScreen_Width-100)/2;
    v_water2.layer.masksToBounds = YES;
    v_water2.backgroundColor =  [UIColor clearColor];
    [v_water2.layer addSublayer:_lay_water2];
    [self.v_progress addSubview:v_water2];
    self.v_water2 = v_water2;
    
    CAShapeLayer * layer_water1 = [CAShapeLayer layer];
    layer_water1.fillColor = [[UIColor whiteColor]colorWithAlphaComponent:0.2].CGColor;
    layer_water1.strokeColor = [[UIColor whiteColor]colorWithAlphaComponent:0.4].CGColor;
    layer_water1.lineWidth = 0.4;
    self.lay_water1 = layer_water1;
    
    CAShapeLayer * layer_water2 = [CAShapeLayer layer];
    layer_water2.fillColor = [[UIColor whiteColor]colorWithAlphaComponent:0.2].CGColor;
    layer_water2.strokeColor = [[UIColor whiteColor]colorWithAlphaComponent:0.4].CGColor;
    layer_water2.lineWidth = 0.4;
    self.lay_water2 = layer_water2;
    
    _waterHeight = MainScreen_Width - 120;
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.08 target:self selector:@selector(waterAnimation) userInfo:nil repeats:YES];
    ZMLog(@"%@",timer);
    
}
-(void)waterAnimation{
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, -WaterMaxHeight*0.5)];
    float y = 0;
    _water2_x += 0.15;
    for (float x = 0; x <= self.v_water1.frame.size.width; x++) {
        //峰高* sin(x * M_PI / self.frame.size.width * 峰的数量 + 移动速度)
        y = 7* sin(x * M_PI / self.v_water1.frame.size.width * 2 - _water2_x) ;
        
        [path addLineToPoint:CGPointMake(x, y+_waterHeight)];
    }
    
    [path addLineToPoint:CGPointMake(self.v_water1.frame.size.width, WaterMaxHeight*0.5)];
    [path addLineToPoint:CGPointMake(self.v_water1.frame.size.width, WaterMaxHeight)];
    [path addLineToPoint:CGPointMake(0, WaterMaxHeight)];
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    
    self.v_water1.layer.mask = layer;
    
}
-(void)changeValue:(UISlider *)slider{
    self.lay_progress.strokeEnd = slider.value;
    if (slider.value >=0 || slider.value <=1) {
        _waterHeight = (1-slider.value) * WaterMaxHeight/3;
        ZMLog(@"--------%f",slider.value);
    }
}
-(void)dealloc{
        ZMLog(@"VC_Electric 号机自爆报完成");
}
@end
