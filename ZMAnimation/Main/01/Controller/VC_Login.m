//
//  VC_Login.m
//  ZMAnimation
//
//  Created by 圣光大人 on 2017/7/6.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "VC_Login.h"
#import "ZMHead.h"
#define Self_Width  self.view.bounds.size.width
#define Self_Height  self.view.bounds.size.height
#define MainScreen_Width [UIScreen mainScreen].bounds.size.width
#define MainScreen_Height [UIScreen mainScreen].bounds.size.height

@interface VC_Login ()
<
UITextFieldDelegate
>

@property(nonatomic,strong)UILabel * lab_title;
@property(nonatomic,strong)UITextField * tfd_username;
@property(nonatomic,strong)UITextField * tfd_password;
@property(nonatomic,strong)UIButton * btn_login;
@property(nonatomic,strong)UIImageView * img_background;
@property(nonatomic,strong)UIActivityIndicatorView * v_juhua;
@property(nonatomic,strong)UIImageView * img;
@end

@implementation VC_Login
#pragma mark --> 🐷 life cycle 🐷
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    CABasicAnimation * baseAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    baseAnimation.fromValue = @(-MainScreen_Width/2);
    baseAnimation.toValue = @(MainScreen_Width/2);
    baseAnimation.duration = .5;
    baseAnimation.fillMode = kCAFillModeBoth;

    [self.lab_title.layer addAnimation:baseAnimation forKey:nil];
    baseAnimation.beginTime = CACurrentMediaTime() + 0.2;
    [self.tfd_username.layer addAnimation:baseAnimation forKey:nil];
    baseAnimation.beginTime = CACurrentMediaTime() + 0.4;
    [self.tfd_password.layer addAnimation:baseAnimation forKey:nil];
    
    CASpringAnimation * lab_titleAnimation = [self ZMinitSpringAnimationWithBeginTime:CACurrentMediaTime() + 0.3];
    CASpringAnimation * usernameAnimation = [self ZMinitSpringAnimationWithBeginTime:CACurrentMediaTime() + 0.4];
    CASpringAnimation * passwordAnimation = [self ZMinitSpringAnimationWithBeginTime:CACurrentMediaTime() + 0.5];
    
    [self.lab_title.layer addAnimation:lab_titleAnimation forKey:nil];
    [self.tfd_username.layer addAnimation:usernameAnimation forKey:nil];
    [self.tfd_password.layer addAnimation:passwordAnimation forKey:nil];
    
    CABasicAnimation * btnRotationAni =[self ZMinitBaseAnimationWithType:@"transform.rotation" fromValue:@(M_PI_4)];
    
    CABasicAnimation * btnScaleAni = [self ZMinitBaseAnimationWithType:@"transform.scale" fromValue:@(5)];
    
    CABasicAnimation * btnOpacityAni = [self ZMinitBaseAnimationWithType:@"opacity" fromValue:@(0)];
    
    CAAnimationGroup * aniGroup = [[CAAnimationGroup alloc]init];
    aniGroup.duration = 0.5;
    aniGroup.beginTime = CACurrentMediaTime() + 0.5;
    aniGroup.fillMode = kCAFillModeBackwards;
    aniGroup.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    aniGroup.animations = @[btnRotationAni,btnScaleAni,btnOpacityAni];
    
    [self.btn_login.layer addAnimation:aniGroup forKey:nil];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(CABasicAnimation *)ZMinitBaseAnimationWithType:(NSString *)type fromValue:(id)value{
    CABasicAnimation * baseAnimation = [CABasicAnimation animationWithKeyPath:type];
//    baseAnimation.fillMode = kCAFillModeBoth;
    baseAnimation.fromValue = value;
    return baseAnimation;
}
-(CASpringAnimation *)ZMinitSpringAnimationWithBeginTime:(NSTimeInterval)begintime{
    CASpringAnimation * SpringAnimation = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
    SpringAnimation.fromValue = @(0.95);
    SpringAnimation.duration = SpringAnimation.settlingDuration;
    SpringAnimation.initialVelocity = 0;
    SpringAnimation.stiffness = 30;
    SpringAnimation.mass = 1;
    SpringAnimation.damping = 1;
    SpringAnimation.beginTime = begintime;
    SpringAnimation.fillMode = kCAFillModeBoth;
    return SpringAnimation;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultsSetting];
    [self initSubViews];
    
}
#pragma mark --> 🐷 delegate 🐷
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    CASpringAnimation *jumpAnimation   = [CASpringAnimation animationWithKeyPath:@"position.y"];
    jumpAnimation.fromValue            = @(textField.layer.position.y+1);
    jumpAnimation.toValue              = @(textField.layer.position.y);
    jumpAnimation.duration             = jumpAnimation.settlingDuration;
    jumpAnimation.initialVelocity      = 100.;
    jumpAnimation.mass                 = 10.;
    jumpAnimation.stiffness            = 1500.;
    jumpAnimation.damping              = 50.;
    [textField.layer addAnimation:jumpAnimation forKey:nil];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.tfd_password endEditing:YES];
    [self.tfd_username endEditing:YES];
}
-(void)LoginAction:(UIButton *)btn{
    ZMLog(@"做点什么");
    btn.layer.cornerRadius = 20;
    btn.backgroundColor = [UIColor colorWithRed:0.85 green:0.83 blue:0.45 alpha:1];

    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        CGRect rect = self.btn_login.frame;
        rect.origin.y = 482;
        self.btn_login.frame = rect;
        
    } completion:nil];
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:.4 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        CGRect rect = self.btn_login.bounds;
        rect.size.width = 300;
        self.btn_login.bounds = rect;
        
    } completion:nil];
    
    CABasicAnimation * btnCornerRadiusAni = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    btnCornerRadiusAni.toValue = @(20);
    
    CABasicAnimation * btnColorAni = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    btnColorAni.toValue = (__bridge id)([UIColor colorWithRed:0.85 green:0.83 blue:0.45 alpha:1].CGColor);
    
    CAAnimationGroup * aniGroup = [[CAAnimationGroup alloc]init];
    aniGroup.fillMode = kCAFillModeBackwards;
    aniGroup.duration = 0.6;
    
    aniGroup.animations = @[btnCornerRadiusAni,btnColorAni];
    [btn.layer addAnimation:aniGroup forKey:nil];
    self.v_juhua.hidden = NO;
    [self.v_juhua startAnimating];
    
    [self performSelector:@selector(LoginFailed) withObject:self afterDelay:3.0];
    
}
-(void)LoginFailed{
    
    self.v_juhua.hidden = YES;
    [self.v_juhua stopAnimating];
    
    self.btn_login.layer.cornerRadius = 10;
    self.btn_login.backgroundColor = [UIColor colorWithRed:154/255.0 green:219/255.0 blue:83/255.0 alpha:0.8];
    
    CAKeyframeAnimation * KeyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    KeyframeAnimation.values = @[@0,@M_PI_4,@0,@-M_PI_4];
    KeyframeAnimation.keyTimes = @[@0,@.25,@.5,@.75];
    KeyframeAnimation.repeatCount  = 4;
    [self.lab_title.layer addAnimation:KeyframeAnimation forKey:nil];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        CGRect rect = self.btn_login.frame;
        rect.origin.y = 382;
        self.btn_login.frame = rect;
        
    } completion:nil];
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:.4 initialSpringVelocity:.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        CGRect rect = self.btn_login.bounds;
        rect.size.width = 170;
        self.btn_login.bounds = rect;
        
    } completion:nil];
    
    CABasicAnimation * btnCornerRadiusAni = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    btnCornerRadiusAni.toValue = @(10);
    
    CABasicAnimation * btnColorAni = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    btnColorAni.toValue = (__bridge id)([UIColor colorWithRed:154/255.0 green:219/255.0 blue:83/255.0 alpha:0.8].CGColor);
    
    CAAnimationGroup * aniGroup = [[CAAnimationGroup alloc]init];
    aniGroup.fillMode = kCAFillModeBackwards;
    aniGroup.duration = 0.6;
    
    aniGroup.animations = @[btnCornerRadiusAni,btnColorAni];
    [self.btn_login.layer addAnimation:aniGroup forKey:nil];
}
#pragma mark --> 🐷 加载默认设置 🐷
-(void)loadDefaultsSetting{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar.subviews.firstObject setAlpha:0];
//    self.navigationItem.title = @"Login";
}
#pragma mark --> 🐷 初始化子视图 🐷
-(void)initSubViews{
    
    UIImageView * img_background = [[UIImageView alloc]initWithFrame:self.view.bounds];
    img_background.image = [UIImage imageNamed:@"5.jpg"];
    [self.view addSubview:img_background];
    self.img_background  = img_background;
    
    UIImageView * img = [[UIImageView alloc]initWithFrame:self.view.bounds];
    img.image = [UIImage imageNamed:@"5.jpg"];
    [self.view addSubview:img];
    self.img  = img;
    
    UILabel * lab_Title = [[UILabel alloc]init];
    lab_Title.frame = CGRectMake(0, 123, MainScreen_Width, 37);
    lab_Title.textAlignment = NSTextAlignmentCenter;
    lab_Title.text = @"圣光与你同在";
    lab_Title.textColor = [[UIColor whiteColor]colorWithAlphaComponent:0.8];
    lab_Title.font = [UIFont fontWithName:@"Avenir-Light" size:26];
    [self.view addSubview:lab_Title];
    self.lab_title = lab_Title;

    self.tfd_username = [self ZMInitTextfieldWith:
                         CGRectMake([obj_ToolClass calculationScaleWidth:76], [obj_ToolClass calculationScaleHeight:206], [obj_ToolClass calculationScaleWidth:224], 30)
                                    cornerRadius:15
                                    bgcolor:[UIColor whiteColor]
                                    textColor:[UIColor blackColor]];
    self.tfd_username.placeholder = @"  username";
    self.tfd_username.delegate = self;
    [self.view addSubview:self.tfd_username];

    self.tfd_password = [self ZMInitTextfieldWith:
                         CGRectMake([obj_ToolClass calculationScaleWidth:76], [obj_ToolClass calculationScaleWidth:282], [obj_ToolClass calculationScaleWidth:224], 30)
                                    cornerRadius:15
                                    bgcolor:[UIColor whiteColor]
                                    textColor:[UIColor blackColor]];
    self.tfd_password.placeholder = @"  password";
    self.tfd_password.delegate = self;
    [self.view addSubview:self.tfd_password];
    
    UIButton * btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(103, 382, 170, 40);
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor =  [UIColor colorWithRed:154/255.0 green:219/255.0 blue:83/255.0 alpha:0.8];
    [btn setTitle:@"Login" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(LoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.btn_login = btn;
    
    UIActivityIndicatorView * juhua = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    juhua.frame = CGRectMake(-20, 0, self.btn_login.bounds.size.width, self.btn_login.bounds.size.height);
    self.v_juhua = juhua;
    juhua.hidden = YES;
    [self.btn_login addSubview:juhua];
    
}
-(UITextField *)ZMInitTextfieldWith:(CGRect)rect cornerRadius:(CGFloat)cornerRadius bgcolor:(UIColor *)bgColor textColor:(UIColor*)TextColor{
    UITextField * tfd = [[UITextField alloc]initWithFrame:rect];
    tfd.backgroundColor = bgColor;
    tfd.textColor = TextColor;
    tfd.layer.cornerRadius = cornerRadius;
    tfd.layer.masksToBounds = YES;
    tfd.font = [UIFont systemFontOfSize:15];
    
    return tfd;
}
-(void)dealloc{
    ZMLog(@"VC_Login 自爆完成");
}
@end
