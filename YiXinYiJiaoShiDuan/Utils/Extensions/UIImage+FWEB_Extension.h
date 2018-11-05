//
//  UIImage+FWEB_Extension.h
//  fuwuEbao
//
//  Created by Jiao on 2018/8/8.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FWEB_Extension)
//  颜色创建图片
//  color       创建图片的颜色
+ (UIImage *)imageWithColor:(UIColor *)color;

//头像默认图
+ (UIImage *)defaultHeadImage;

//正方形占位图
+ (UIImage *)squarePlaceHolder;
//长方形展位图
+ (UIImage *)rectanglePlaceHolder;

- (UIImage *)blurryImageWithBlurLevel:(CGFloat)blur;


@end

@interface UIImageView (ILT_Extension)

- (void)setImageWithUrl:(NSURL *)url placeholder:(UIImage *)placeholder;


@end

@interface UIButton (ILT_WebImageExtension)
- (void)setImageWithUrl:(NSURL *)url placeholder:(UIImage *)placeholder forstate:(UIControlState)state;
@end
