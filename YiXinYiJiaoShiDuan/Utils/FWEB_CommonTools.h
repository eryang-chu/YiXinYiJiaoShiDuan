//
//  FWEB_CommonTools.h
//  fuwuEbao
//
//  Created by Jiao on 2018/8/9.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UINavigationController;
@class UIView;

@interface FWEB_CommonTools : NSObject

// 结束编辑
+ (void)endEditing;

/**
 获取当前的导航控制器
 @return 当前导航
 */
+ (UINavigationController *)currentNavigationController;

//网络是否可用
+ (BOOL)networkEnable;

//  将error中msg显示在view center上
+ (void)makeTostWithError:(NSError *)error inViewCenter:(UIView *)view;
+ (void)makeTostWithMsg:(NSString *)msg inViewCenter:(UIView *)view;
+ (void)makeTostWithMsg:(NSString *)msg;
+ (void)makeTostWithError:(NSError *)error;

//展示蒙板
+ (void)showHud;
//隐藏蒙板
+ (void)hidHud;

//日期
+ (NSString *)stringFromDate:(NSDate *)date withFormate:(NSString *)dateFormate;

//判断手机号码
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

//登录成功处理（）
+ (void)handleLoginSuccess;

//跳转到登录界面
+ (void)showLoginViewController;
@end
