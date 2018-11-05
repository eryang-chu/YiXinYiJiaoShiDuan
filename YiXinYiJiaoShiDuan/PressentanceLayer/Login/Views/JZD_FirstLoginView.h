//
//  JZD_FirstLoginView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JZD_PhoneCodePwdTableViewCell;
@interface JZD_FirstLoginView : UIView
@property (nonatomic, copy) void (^quickLoginButtonClick)(void);
@property (copy, nonatomic) void (^loginButtonClick)(NSString *phone, NSString *code);
@property (copy, nonatomic) void (^getCodeButtonClick)(NSString *account, JZD_PhoneCodePwdTableViewCell *cell);
@end
