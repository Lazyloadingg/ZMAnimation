//
//  M_MainTableView.m
//  ZMAnimation
//
//  Created by 圣光大人 on 2017/7/6.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "M_MainTableView.h"

@implementation M_MainTableView
+(instancetype)initWIthClass:(Class)targetVC title:(NSString *)str_title{
    M_MainTableView * model = [[M_MainTableView alloc]init];
    model.str_title = str_title;
    model.targetVC = targetVC;
    model.str_subtitle = [NSString stringWithFormat:@"%@",model.targetVC];
    return model;
}
@end
