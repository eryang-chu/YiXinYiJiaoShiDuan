//
//  JZD_FirstLoginPromptView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JZD_FirstLoginPromptViewType) {
    JZD_FirstLoginPromptViewTypeModifyPwd, //修改密码提示框
    JZD_FirstLoginPromptViewTypeRelationship, //你是孩子什么人提示框
    JZD_FirstLoginPromptViewTypeError, //错误信息提示框
    JZD_FirstLoginPromptViewTypeTip, //错误信息
    JZD_FirstLoginPromptViewTypeAccountInputBabyName,//我的 输入宝贝姓名
};

@interface JZD_FirstLoginPromptView : UIView
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
- (instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic, assign) JZD_FirstLoginPromptViewType viewType;
@property (nonatomic, copy) void (^modifyPwdButtonClick)(void);
@property (nonatomic, copy) void (^noModifyPwdButtonClick)(void);
@property (nonatomic, copy) void (^sureButtonClick)(void);
@property (nonatomic, copy) void (^servicerButtonClick)(void);
@property (copy, nonatomic) void (^textFieldDidChange)(UITextField *textfield);
@end
