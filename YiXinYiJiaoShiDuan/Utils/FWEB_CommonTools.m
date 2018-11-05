//
//  FWEB_CommonTools.m
//  fuwuEbao
//
//  Created by Jiao on 2018/8/9.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import "AppDelegate.h"
#import "JZD_PwdOrCodeLoginViewController.h"
#import "FWEB_CommonTools.h"

@implementation FWEB_CommonTools
+ (instancetype)defaultInstance {
    static FWEB_CommonTools *obj = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        obj = [[FWEB_CommonTools alloc] init];
    });
    return obj;
}

+ (NSString *)stringFromDate:(NSDate *)date withFormate:(NSString *)dateFormate {
    if (!date || !dateFormate.length) {
        return nil;
    }
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    formate.dateFormat = dateFormate;
    return [formate stringFromDate:date];
}

+ (void)showHud {
    [MBProgressHUD showHUDAddedTo:[self currentNavigationController].view animated:NO];
}

+ (void)hidHud {
    [MBProgressHUD hideHUDForView:[self currentNavigationController].view animated:NO];
}

+ (void)endEditing {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

+ (UINavigationController *)currentNavigationController {
    id vc = [UIApplication sharedApplication].delegate.window.rootViewController;
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return vc;
    }
    UIViewController *nav = [vc presentedViewController];
    if ([nav isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController *)nav;
    }
    if ([vc isKindOfClass:[UITabBarController class]]) {
        id selectVC = [(UITabBarController *)vc selectedViewController];
        if ([selectVC isKindOfClass:[UINavigationController class]]) {
            return selectVC;
        }
    }
    return nil;
}

+ (BOOL)networkEnable {
//    return [USER_DEFAULTS boolForKey:KNetworkEnable];
    return YES;
}

+ (void)makeTostWithError:(NSError *)error inViewCenter:(UIView *)view {
    [view makeToast:error.userInfo[NSLocalizedDescriptionKey] duration:1. position:CSToastPositionCenter];
}

+ (void)makeTostWithMsg:(NSString *)msg inViewCenter:(UIView *)view {
    [view makeToast:msg duration:1. position:CSToastPositionCenter];
}

+ (void)makeTostWithError:(NSError *)error {
    [self makeTostWithError:error inViewCenter:[UIApplication sharedApplication].keyWindow];
}

+ (void)makeTostWithMsg:(NSString *)msg {
    [[UIApplication sharedApplication].keyWindow makeToast:msg duration:1. position:CSToastPositionCenter];
}

+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//登录成功处理（）
+ (void)handleLoginSuccess {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UITabBarController *tabBarController = [storyboard instantiateInitialViewController];
    tabBarController.delegate = [self defaultInstance];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.window.rootViewController = tabBarController;
}

//跳转到登录界面
+ (void)showLoginViewController {
    JZD_PwdOrCodeLoginViewController *vc = [[JZD_PwdOrCodeLoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.window.rootViewController = nav;
}
@end
