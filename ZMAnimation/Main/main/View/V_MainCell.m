//
//  V_MainCell.m
//  ZMAnimation
//
//  Created by 圣光大人 on 2017/7/6.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "V_MainCell.h"
@interface V_MainCell()

@end

@implementation V_MainCell

+(instancetype)initWithTableView:(UITableView *)tableView ID:(NSString *)ID{
    V_MainCell * cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (!cell) {
        cell = [[V_MainCell alloc]init];
    }
    return cell;

}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}
#pragma mark >_<! --> 加载默认设置
-(void)loadDefaultsSetting{
    self.contentView.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.5];
}
#pragma mark >_<! --> 初始化子视图
-(void)initSubViews{
    
    UILabel * lab_firstTitle = [[UILabel alloc]init];
    lab_firstTitle.textColor = [[UIColor redColor]colorWithAlphaComponent:0.5];
    lab_firstTitle.font = [UIFont fontWithName:@"Courier-Oblique" size:16];
    [self.contentView addSubview:lab_firstTitle];
    self.lab_FirstTitle = lab_firstTitle;
    
    UILabel * lab_secondTitle = [[UILabel alloc]init];
    lab_secondTitle.font = [UIFont fontWithName:@"Avenir-Light" size:9];
    lab_secondTitle.textColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    
    [self.contentView addSubview:lab_secondTitle];
    self.lab_SecondTitle = lab_secondTitle;
    
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        
        CASpringAnimation * SpringAnimation = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
        SpringAnimation.fromValue = @(0.9);
        SpringAnimation.duration = SpringAnimation.settlingDuration;
        SpringAnimation.initialVelocity = 0;
        SpringAnimation.stiffness = 100;
        SpringAnimation.mass = 1;
        SpringAnimation.damping = 3;
        [self.lab_FirstTitle.layer addAnimation:SpringAnimation forKey:nil];
        
    }else{
        CASpringAnimation * SpringAnimation = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
        SpringAnimation.fromValue = @(1.1);
        SpringAnimation.duration = SpringAnimation.settlingDuration;
        SpringAnimation.initialVelocity = 0;
        SpringAnimation.stiffness = 100;
        SpringAnimation.mass = 1;
        SpringAnimation.damping = 3;
        [self.lab_FirstTitle.layer addAnimation:SpringAnimation forKey:nil];
    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)layoutSubviews{
    
    self.lab_FirstTitle.frame = CGRectMake(15, 0, self.bounds.size.width-30, self.bounds.size.height-15);
    
    self.lab_SecondTitle.frame = CGRectMake(15, self.lab_FirstTitle.frame.origin.y+self.lab_FirstTitle.frame.size.height, self.bounds.size.width-30, 15);
 }
@end
