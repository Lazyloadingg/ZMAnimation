//
//  VC_ Rubber.m
//  ZMAnimation
//
//  Created by Mac2 on 2017/7/11.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "VC_ Rubber.h"
#import "ZMHead.h"
@interface VC__Rubber ()
@property(nonatomic,strong)NSMutableArray * arr_path;
@property(nonatomic,strong)UIView * v_drawing;
@property(nonatomic,strong)UIImageView * v_image;

@end

@implementation VC__Rubber

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.navigationController.navigationBar.subviews.firstObject setAlpha:0];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSubViews];
}

#pragma mark >_<! 👉🏻 🐷Life cycle🐷
#pragma mark >_<! 👉🏻 🐷System Delegate🐷
#pragma mark >_<! 👉🏻 🐷Custom Delegate🐷
#pragma mark >_<! 👉🏻 🐷Event  Response🐷
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:point];
    
    NSMutableArray * array = [NSMutableArray array];
    self.arr_path = array;
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.v_image  ];
//    UIColor * color = [self colorAtPixel:point image:self.v_image.image];



    [self.arr_path addObject:NSStringFromCGPoint(point)];
//    self.view.backgroundColor = color;
//    NSLog(@"--------%@",color);
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  self.v_image.image =  [self drawImageWithImage:self.v_image.image pointArr:self.arr_path];
}
#pragma mark >_<! 👉🏻 🐷Private Methods🐷
- (UIColor *)colorAtPixel:(CGPoint)point  image:(UIImage *)image{
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, image.size.width, image.size.height), point)) {
        return nil;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage =image.CGImage;
    NSUInteger width = image.size.width;
    NSUInteger height = image.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 1,
                                                 1,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast |     kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    CGFloat red   =  (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  =  (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
- (UIImage *)drawImageWithImage:(UIImage *)image pointArr:(NSArray *)array{
    CGImageRef cgimage = [image CGImage];
    
    size_t width = CGImageGetWidth(cgimage); // 图片宽度
    size_t height = CGImageGetHeight(cgimage); // 图片高度
    unsigned char *data = calloc(width * height * 4, sizeof(unsigned char)); // 取图片首地址
    size_t bitsPerComponent = 8; // r g b a 每个component bits数目
    size_t bytesPerRow = width * 4; // 一张图片每行字节数目 (每个像素点包含r g b a 四个字节)
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB(); // 创建rgb颜色空间
    
    CGContextRef context =
    CGBitmapContextCreate(data,
                          width,
                          height,
                          bitsPerComponent,
                          bytesPerRow,
                          space,
                          kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), cgimage);
    
    for (size_t i = 0; i < height; i++)
    {
        for (size_t j = 0; j < width; j++)
        {
     
            size_t pixelIndex = i * width * 4 + j * 4;

            unsigned char red = data[pixelIndex];
            unsigned char green = data[pixelIndex + 1];
            unsigned char blue = data[pixelIndex + 2];
            
            // 修改颜色
            red = 0;
            data[pixelIndex] = red;
            data[pixelIndex] = green;
            data[pixelIndex] = blue;
        }
    }
    
    cgimage = CGBitmapContextCreateImage(context);
    UIImage * img = [UIImage imageWithCGImage:cgimage];
    return img;
}
#pragma mark >_<! 👉🏻 🐷Lazy loading🐷
#pragma mark >_<! 👉🏻 🐷Init SubViews🐷
-(void)initSubViews{
    UIView * view = [[UIView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view];
//    self.v_drawing = view;
    
    
    UIImageView * img = [[UIImageView alloc]init];
    img.frame = self.view.bounds;
    img.image = [UIImage imageNamed:@"iPhone 7"];
    [self.view addSubview:img];
    self.v_image = img;
    
//    [self drawImageWithImage:self.v_image.image];
}
@end
