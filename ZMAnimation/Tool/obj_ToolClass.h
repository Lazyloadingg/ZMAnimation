//
//  obj_ToolClass.h
//
//  Created by 王亚鹏 on 2017/2/8.
//  Copyright © 2017年 王亚鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface obj_ToolClass : NSObject
/**依比例计算控件高*/
+(CGFloat)calculationScaleHeight:(CGFloat )Height;
/**依比例计算控件宽*/
+(CGFloat)calculationScaleWidth:(CGFloat)Width;
/**依比例计算相对于view的纵向距离*/
+(CGFloat)getFrameY:(UIView *__nonnull)view cgfloat:(CGFloat )Y;
/**依比例计算相对于view的横向距离*/
+(CGFloat)getFrameX:(UIView *__nonnull)view cgfloat:(CGFloat)X;
/**拉伸图片*/
+(UIImage *__nonnull)stretchWithImage:(UIImage * __nonnull)image;


/**判断设备类型*/
+(BOOL)iPhoneOriPad;
/**判断手机号*/
+ (BOOL)valiMobile:(NSString *__nonnull)str_PhoneNum;
/**分享*/
+(void)shareWithArray:(NSArray *__nonnull)array controller:(UIViewController*__nonnull)vc location:(UIButton *__nonnull)button;
/**根据Key获取userdefaults数据*/
+(id _Nullable )GetObjectFromNSUserDefaultsWithKey:(NSString * __nonnull)key;
/**根据Key向userdefaults存储数据*/
+(void)SaveObjectToNSUserDefaultsWithKey:(NSString * __nonnull)str_kry object:(id __nonnull)obj;
/**是否为数字*/
+(BOOL)validateNumberWithString:(NSString *__nonnull)str_content;
/**是否为字母*/
+(BOOL)validateEnglishWithString:(NSString *__nonnull)str_content;
/**是否为字母或数字*/
+(BOOL)validateEnglishAndNumberWithString:(NSString *__nonnull)str_content;
/**生成透明图片*/
+(UIImage *__nonnull)GetlucencyImageWithColor:(UIColor *__nonnull)color;


@end
