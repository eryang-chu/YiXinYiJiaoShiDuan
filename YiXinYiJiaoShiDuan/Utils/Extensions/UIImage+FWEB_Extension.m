//
//  UIImage+FWEB_Extension.m
//  fuwuEbao
//
//  Created by Jiao on 2018/8/8.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIButton+WebCache.h>
#import "UIImage+FWEB_Extension.h"

@implementation UIImage (FWEB_Extension)
+ (UIImage *)defaultHeadImage {
    return [UIImage imageNamed:@"pho_default-avatar_man"];
}

+ (UIImage *)rectanglePlaceHolder {
    return [UIImage imageNamed:@"ic_tuijan"];
}

+ (UIImage *)squarePlaceHolder {
    return [UIImage imageNamed:@"square_place_holder"];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    if (!color) {
        return [UIImage new];
    }
    CGRect rect=CGRectMake(0,0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (UIImage *)blurryImageWithBlurLevel:(CGFloat)blur {
    CIImage *inputImage = [CIImage imageWithCGImage:self.CGImage];
    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur" keysAndValues:kCIInputImageKey, inputImage, @"inputRadius", @(blur), nil];
    CIImage *outputImage = filter.outputImage;
    CGImageRef outImage = [context createCGImage:outputImage
                                        fromRect:[outputImage extent]];
    return [UIImage imageWithCGImage:outImage];
}



@end

@implementation UIImageView (ILT_Extension)

- (void)setImageWithUrl:(NSURL *)url placeholder:(UIImage *)placeholder {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:SDWebImageAllowInvalidSSLCertificates];
}

@end

@implementation UIButton (ILT_WebImageExtension)

- (void)setImageWithUrl:(NSURL *)url placeholder:(UIImage *)placeholder forstate:(UIControlState)state {
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholder options:SDWebImageAllowInvalidSSLCertificates];
}

- (CGSize)intrinsicContentSize {
    return self.frame.size;
}
@end
