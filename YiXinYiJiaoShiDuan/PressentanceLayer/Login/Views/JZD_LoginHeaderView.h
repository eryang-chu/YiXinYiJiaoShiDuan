//
//  JZD_LoginHeaderView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_LoginHeaderView : UIView
@property (nonatomic, copy) void (^backButtonClick)(void);
@property (nonatomic, copy) void (^pwdLoginButtonClick)(void);
@property (nonatomic, copy) void (^codeLoginButtonClick)(void);

- (instancetype)initWithFrame:(CGRect)frame;
@end
