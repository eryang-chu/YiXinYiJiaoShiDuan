//
//  UIColor+FWEB_Extension.m
//  fuwuEbao
//
//  Created by Jiao on 2018/8/8.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import "UIColor+FWEB_Extension.h"

@implementation UIColor (FWEB_Extension)
+ (UIColor *)DefGreenColor {
    return [UIColor colorWithRed:12./255. green:183./255 blue:15/255. alpha:1];
}

+ (UIColor *)RandomColor {
    return [UIColor colorWithRed:arc4random_uniform(255)/255. green:arc4random_uniform(255)/255. blue:arc4random_uniform(255)/255. alpha:1];
}
@end
