//
//  M_MainTableView.h
//  ZMAnimation
//
//  Created by 圣光大人 on 2017/7/6.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface M_MainTableView : NSObject
@property(nonatomic,strong)Class  targetVC;
@property(nonatomic,copy)NSString * str_title;
@property(nonatomic,copy)NSString * str_subtitle;
+(instancetype)initWIthClass:(Class)targetVC title:(NSString *)str_title ;
@end
