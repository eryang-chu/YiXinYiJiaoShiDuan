//
//  DefineMacro.h
//  fuwuEbao
//
//  Created by Jiao on 2018/8/8.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#ifndef DefineMacro_h
#define DefineMacro_h


//用户信息
#define USER_INFO @"parentInfo"
#define USER_IS_FIRST_LOGIN @"isFirstLogin"
#define USER_IS_LOGIN @"isLogin"
#define USER_SELECTED_BABY_INFO @"selectedBabyInfo"//选择的baby信息

//屏幕宽高
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
//随机颜色
#define KRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]


#endif /* DefineMacro_h */

#import <Foundation/Foundation.h>

typedef void(^NoParamsBlock)(void);
typedef void(^NormalFailureBlock)(NSError *error);

#define Deprecated(_msg) __attribute__((deprecated(_msg)))

#ifndef    weakify
#if __has_feature(objc_arc)

#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x; \
_Pragma("clang diagnostic pop")

#else

#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __block __typeof__(x) __block_##x##__ = x; \
_Pragma("clang diagnostic pop")

#endif
#endif



#ifndef    strongify
#if __has_feature(objc_arc)

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __weak_##x##__; \
_Pragma("clang diagnostic pop")

#else

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __block_##x##__; \
_Pragma("clang diagnostic pop")

#endif
#endif

#define ImageNamed(imageName) [UIImage imageNamed:imageName]
#pragma mark - Color

#define RGBA_COLOR(r, g, b, a) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:a]

#define RGB_COLOR(r, g, b) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:1]

#define HEXA_COLOR(hexValue, AlphaValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:AlphaValue]

#define HEX_COLOR(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]


#define SYSTEM_RED_COLOR HEX_COLOR(0xc92a3a)
#define SYSTEM_BLACK_COLOR HEX_COLOR(0x333333)
#define SYSTEM_GRAY_COLOR HEX_COLOR(0x808080)

#pragma mark - System

#define DEVICE_SCALE [UIScreen mainScreen].scale

#define DEVICE_WIDTH CGRectGetWidth([UIScreen mainScreen].bounds)
#define DEVICE_HEIGHT CGRectGetHeight([UIScreen mainScreen].bounds)

#define MULTIPLIER SCREEN_WIDTH/375.0

#define DEVICE_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] doubleValue]
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]
#pragma mark - DEVICE

#define IS_PHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

//判断设备
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)



#pragma mark - UI

#define SysFont(size) [UIFont systemFontOfSize:size]

#define mark - KEYS

