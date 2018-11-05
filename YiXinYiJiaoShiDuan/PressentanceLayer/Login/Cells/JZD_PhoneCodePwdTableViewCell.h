//
//  JZD_PhoneCodePwdTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, JZD_PhoneCodePwdTableViewCellType) {
    JZD_PhoneCodePwdTableViewCellTypePhone, //输入手机号
    JZD_PhoneCodePwdTableViewCellTypeCode, //输入验证码
    JZD_PhoneCodePwdTableViewCellTypePwd, //输入密码
    JZD_PhoneCodePwdTableViewCellTypeModifyPhone,//修改手机号
    JZD_PhoneCodePwdTableViewCellTypeModifyPhoneCode,//修改手机号验证码
};

@interface JZD_PhoneCodePwdTableViewCell : IJSD_BasicTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, assign) JZD_PhoneCodePwdTableViewCellType cellType;
@property (copy, nonatomic) void (^textFieldDidChange)(UITextField *textfield);
@property (nonatomic, copy) void (^codeButtonClick)(JZD_PhoneCodePwdTableViewCell *cell);
@property (nonatomic, copy) void (^forgetPwdButtonClick)(void);

- (void)startTiming; // 开始计时
- (void)stopTiming;//结束计时
@end
