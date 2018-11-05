//
//  JZD_AccountSetModifyPwdView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_AccountSetModifyPwdView : UIView
@property (nonatomic, copy) void (^backButtonClick)(void);
@property (copy, nonatomic) void (^sureButtonClick)(NSString *oldPwd, NSString *passWord, NSString *surePwd);
@end
