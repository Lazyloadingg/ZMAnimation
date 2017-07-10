//
//  ZMHead.h
//  ZMAnimation
//
//  Created by Mac2 on 2017/7/7.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#ifndef ZMHead_h
#define ZMHead_h

#import "obj_ToolClass.h"
#import "VC_LineChartAnimation.h"
#import "VC_Login.h"
#import "VC_Main.h"
#import "VC_Neure.h"
#import "VC_CollectionMove.h"
#import "VC_Electric.h"
#import "ZMBaseViewController.h"


#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#ifdef DEBUG
/**  //获取类名(文件名)；
 NSString *className = NSStringFromClass([self class]);
 NSLog(@"类名--------%@",className);
 
 //获取当前方法名；
 NSLog(@"%s",__FUNCTION__);
 
 //获取当前方法名；
 NSLog(@"%s",__func__);
 
 //获取当前方法名；
 NSLog(@"%s",__PRETTY_FUNCTION__);
 
 //获取当前所在行；
 NSLog(@"%d",__LINE__);
 
 //获取该文件的绝对路径；
 NSLog(@"%s",__FILE__);
 
 //获取当前日期；
 NSLog(@"%s",__DATE__);
 
 //获取当前时分秒；
 NSLog(@"%s",__TIME__);
 
 //获取当前时间戳；
 NSLog(@"%s",__TIMESTAMP__);*/
#define ZMLog(FORMAT, ...) fprintf(stderr,"%s:%s:%d : %s\n",__TIME__, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define ZMLog(FORMAT, ...) nil
#endif

#define Self_Width  self.view.bounds.size.width
#define Self_Height  self.view.bounds.size.height
#define MainScreen_Width [UIScreen mainScreen].bounds.size.width
#define MainScreen_Height [UIScreen mainScreen].bounds.size.height


#endif /* ZMHead_h */
