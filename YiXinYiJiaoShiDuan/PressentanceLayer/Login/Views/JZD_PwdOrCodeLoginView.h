//
//  JZD_PwdOrCodeLoginView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JZD_PhoneCodePwdTableViewCell;


@interface JZD_PwdOrCodeLoginView : UIView

@property (nonatomic, copy) void (^quickLoginButtonClick)(void);
@property (nonatomic, copy) void (^forgetPwdButtonClick)(void);
@property (copy, nonatomic) void (^codeLoginButtonClick)(NSString *phone, NSString *code);
@property (copy, nonatomic) void (^pwdLoginButtonClick)(NSString *phone, NSString *pwd);
@property (copy, nonatomic) void (^getCodeButtonClick)(NSString *phone, JZD_PhoneCodePwdTableViewCell *cell);
@end
