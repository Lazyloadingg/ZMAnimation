//
//  VC_Neure.m
//  ZMAnimation
//
//  Created by Mac2 on 2017/7/10.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "VC_Neure.h"
#import "ZMHead.h"

#define Self_Width  self.view.bounds.size.width
#define Self_Height  self.view.bounds.size.height
#define MainScreen_Width [UIScreen mainScreen].bounds.size.width
#define MainScreen_Height [UIScreen mainScreen].bounds.size.height 

@interface M_CircleModel : NSObject
@property(nonatomic,assign)CGFloat originX;
@property(nonatomic,assign)CGFloat originY;
@property(nonatomic,assign)CGFloat offsetX;
@property(nonatomic,assign)CGFloat offsetY;
@property(nonatomic,assign)CGFloat cornerRadius;
@end

@interface VC_Neure ()
@property(nonatomic,strong)UIView * v_background;
@property(nonatomic,strong)NSMutableArray * arr_circle;
@property(nonatomic,assign)NSInteger circleNum;
@property(nonatomic,strong)NSTimer * timer;
@end

@implementation VC_Neure
#pragma mark --> 🐷 life cycle 🐷
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
    [self ZMInitCircle];
    [self drawAnimation];
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.07 target:self selector:@selector(drawAnimation) userInfo:nil repeats:YES];
    self.timer = timer;
    ZMLog(@"定时器%@",timer);
}
#pragma mark >_<! --> 初始化子视图
-(void)initSubViews{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.v_background];
}

-(void)ZMInitCircle{
    
    _circleNum = 20;
    _arr_circle = [NSMutableArray arrayWithCapacity:_circleNum];
    
    NSInteger width = MainScreen_Width;
    NSInteger height = MainScreen_Height;
    
    for (NSInteger index = 0; index < _circleNum; index++) {
        M_CircleModel * model = [[M_CircleModel alloc]init];
        
        model.originX = arc4random() % width;
        model.originY = arc4random() % height;
        model.offsetX = (3 + arc4random() % 15) / 10.0;
        model.offsetY = (3 + arc4random() % 15) / 10.0;
        
        CGFloat signX = arc4random() % 20;
        CGFloat signY = arc4random() % 20;
        
        if (signX > 10) {
            model.offsetX = -model.offsetX;
        }
        if (signY > 10) {
            model.offsetY = -model.offsetY;
        }
        model.cornerRadius = 1+ arc4random() % 3;
        [_arr_circle addObject:model];
    }
    
}
-(void)drawAnimation{
    
    [_v_background removeFromSuperview];
    _v_background = nil;
    [self.view addSubview:self.v_background];
    
    for (M_CircleModel * model in _arr_circle) {
        
        if (model.originX > MainScreen_Width) {
            model.originX = 0;
        }else if (model.originX < 0){
            model.originX = MainScreen_Width;
        }
        if (model.originY > MainScreen_Height) {
            model.originY = 0;
        }else if (model.originY < 0){
            model.originY = MainScreen_Height;
        }
        model.originX += model.offsetX;
        model.originY += model.offsetY;
        
        [self drawCircleWithModel:model];
    }
    
    for (NSInteger index1 = 0; index1 < _circleNum; index1++) {
        for (NSInteger index2 = 0; index2 < _circleNum; index2++) {
//            if (index2+index1 < _circleNum) {
                M_CircleModel * model1 = _arr_circle[index1];
                M_CircleModel * model2 = _arr_circle[index2];
                
                CGFloat A = model1.originX - model2.originX;
                CGFloat B = model1.originY - model2.originY;
                CGFloat length = sqrt(A * A + B * B);
                float lineOpacity;
                if (length<=MainScreen_Width/2) {
                    lineOpacity=0.2;
                }else if (MainScreen_Width/2>length>MainScreen_Width){
                    lineOpacity=0.15;
                }else if(MainScreen_Width>length>MainScreen_Height/2){
                    lineOpacity=0.1;
                }else{
                    lineOpacity=0.0;
                }
                if ( lineOpacity > 0) {
                    [self drawLineWithModel:model1 model:model2];
                }
//            }
        }
    }
}
#pragma mark --> 🐷 draw 🐷
-(void)drawCircleWithModel:(M_CircleModel *)model{
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [[UIColor grayColor]colorWithAlphaComponent:0.5].CGColor;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(model.originX, model.originY, model.cornerRadius*2, model.cornerRadius*2));
    
    layer.path = path;
    CGPathRelease(path);
    [self.v_background.layer addSublayer:layer];
}
-(void)drawLineWithModel:(M_CircleModel *)model1 model:(M_CircleModel *)model2{
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 0.4;
    
    layer.strokeColor = [UIColor colorWithRed:100/255.0f green:100/255.0f blue:100/255.0f alpha:0.15].CGColor;
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(model1.originX + model1.cornerRadius, model1.originY + model1.cornerRadius )];
    [path addLineToPoint:CGPointMake(model2.originX + model2.cornerRadius , model2.originY + model2.cornerRadius)];
    layer.path = path.CGPath;
    [self.v_background.layer addSublayer:layer];
}
#pragma mark --> 🐷 lazy load 🐷
-(UIView *)v_background{
    if (!_v_background) {
        _v_background = [[UIView alloc]initWithFrame:self.view.bounds];
        _v_background.backgroundColor = [UIColor whiteColor];
    }
    return _v_background;
}
-(void)dealloc{
    ZMLog(@"VC_Neure  自爆完成");
}
@end

#pragma mark --> 🐷 CircleModel implementation 🐷
@implementation M_CircleModel
-(void)dealloc{
    ZMLog(@"CircleModel  自爆完成");
}
@end
