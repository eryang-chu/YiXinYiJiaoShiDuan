//
//  JZD_AccountSetModifyPwdTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, JZD_AccountSetModifyPwdTableViewCellType) {
    JZD_AccountSetModifyPwdTableViewCellTypeNormal, //
    JZD_AccountSetModifyPwdTableViewCellTypePwdPrompt, //
};
@interface JZD_AccountSetModifyPwdTableViewCell : IJSD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (nonatomic, assign) JZD_AccountSetModifyPwdTableViewCellType cellType;
@property (copy, nonatomic) void (^textFieldDidChange)(UITextField *textfield);
@end
