//
//  obj_ToolClass.m
//
//  Created by 王亚鹏 on 2017/2/8.
//  Copyright © 2017年 王亚鹏. All rights reserved.
//

#import "obj_ToolClass.h"
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
@implementation obj_ToolClass
+(CGFloat)calculationScaleHeight:(CGFloat )Height{
    CGFloat scale = Height / 667;
    CGFloat sss = ScreenHeight * scale;
  
    return sss;
}
+(CGFloat)calculationScaleWidth:(CGFloat)Width{
    CGFloat scale = Width / 375;
    CGFloat sss = ScreenWidth * scale;
    return sss;
}
+(CGFloat)getFrameY:(UIView *)view cgfloat:(CGFloat )Y{
    
    CGFloat yy = view.frame.origin.y + view.frame.size.height + [self calculationScaleHeight:Y];
    return yy;
}
+(CGFloat)getFrameX:(UIView *)view cgfloat:(CGFloat)X{
    CGFloat xx = view.frame.origin.x + view.frame.size.height + [self calculationScaleWidth:X];
    return xx;
}
+(void)shareWithArray:(NSArray *)array controller:(UIViewController*)vc location:(UIButton *)button{
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:array applicationActivities:nil];
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        [vc presentViewController:controller animated:YES completion:nil];
    }else{
//        UIPopoverController *pop = [[UIPopoverController alloc] initWithContentViewController:controller];
//        [pop presentPopoverFromRect:button.frame inView:vc.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }

}
//判断设备类型
+(BOOL)iPhoneOriPad{
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        return YES;
    }else{
        return NO;
    }
}
//图片区域拉伸
+(UIImage *)stretchWithImage:(UIImage * )image{
    UIImage * newImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.5, image.size.width* 0.5, image.size.height * 0.5, image.size.width* 0.5) resizingMode:UIImageResizingModeStretch];
    return newImage;
}
+ (BOOL)valiMobile:(NSString *)str_PhoneNum{
    str_PhoneNum = [str_PhoneNum stringByReplacingOccurrencesOfString:@" "withString:@""];
    if (str_PhoneNum.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:str_PhoneNum];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:str_PhoneNum];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:str_PhoneNum];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}
+(id)GetObjectFromNSUserDefaultsWithKey:(NSString * __nonnull)key{
    
    NSUserDefaults * UserDefaults = [NSUserDefaults standardUserDefaults];
    id  obj =[UserDefaults objectForKey:key];
    return obj;
    
}
+(void)SaveObjectToNSUserDefaultsWithKey:(NSString * __nonnull)str_kry object:(id __nonnull)obj{
    
    NSUserDefaults * UserDefaults = [NSUserDefaults standardUserDefaults];
    [UserDefaults setObject:obj forKey:str_kry];
    [UserDefaults synchronize];
    
}
+(BOOL)validateNumberWithString:(NSString *)str_content{
    BOOL isTrue = YES;
    NSCharacterSet * set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSInteger index = 0;
    while (index < str_content.length) {
        NSString * string = [str_content substringWithRange:NSMakeRange(index, 1)];
        NSRange range = [string rangeOfCharacterFromSet:set];
        if (range.length == 0) {
            isTrue = NO;
        }
        index++;
    }
    return isTrue;
}
+(BOOL)validateEnglishWithString:(NSString *)str_content{
    BOOL isTrue = YES;
    NSCharacterSet * set = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"];
    NSInteger index = 0;
    while (index < str_content.length) {
        NSString * string = [str_content substringWithRange:NSMakeRange(index, 1)];
        NSRange range = [string rangeOfCharacterFromSet:set];
        if (range.length == 0) {
            isTrue = NO;
        }
        index++;
    }
    return isTrue;
}
+(BOOL)validateEnglishAndNumberWithString:(NSString *)str_content{
    BOOL isTrue = YES;
    NSCharacterSet * set = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"];
    NSInteger index = 0;
    while (index < str_content.length) {
        NSString * string = [str_content substringWithRange:NSMakeRange(index, 1)];
        NSRange range = [string rangeOfCharacterFromSet:set];
        if (range.length == 0) {
            isTrue = NO;
        }
        index++;
    }
    return isTrue;
}
+(UIImage *)GetlucencyImageWithColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0.0f,0.0f, 1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
