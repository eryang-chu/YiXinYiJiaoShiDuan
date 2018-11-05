//
//  JZD_ForgetPwdPhoneView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_ForgetPwdPhoneView : UIView
@property (nonatomic, copy) void (^backButtonClick)(void);
@property (copy, nonatomic) void (^getCodeButtonClick)(NSString *phone);
@end
