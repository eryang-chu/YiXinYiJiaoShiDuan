//
//  JZD_PwdOrCodeLoginView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_PhoneCodePwdTableViewCell.h"
#import "JZD_LoginButtonTableViewCell.h"
#import "JZD_QuickLoginTableViewCell.h"

#import "JZD_LoginHeaderView.h"
#import "JZD_PwdOrCodeLoginView.h"

typedef NS_ENUM(NSUInteger, JZD_PwdOrCodeLoginViewType) {
    JZD_PwdOrCodeLoginViewTypePwdLogin, //密码登录
    JZD_PwdOrCodeLoginViewTypeCodeLogin, //短信登录
};

@interface JZD_PwdOrCodeLoginView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *authCode;
@property (strong, nonatomic) NSString *pwd;
@property (strong, nonatomic) JZD_LoginHeaderView *headerView;
@property (nonatomic, assign) JZD_PwdOrCodeLoginViewType viewType;
@end
@implementation JZD_PwdOrCodeLoginView

- (JZD_LoginHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[JZD_LoginHeaderView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 270)];
    }
    return _headerView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y - 20, self.bounds.size.width, self.bounds.size.height + 20)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_PhoneCodePwdTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_PhoneCodePwdTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_LoginButtonTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_LoginButtonTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_QuickLoginTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_QuickLoginTableViewCell"];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
        [_tableView addGestureRecognizer:tap];
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}
- (void)tapGesture {
    [self endEditing:YES];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
    
    @weakify(self);
    self.headerView.pwdLoginButtonClick = ^{
        @strongify(self);
        self.viewType = JZD_PwdOrCodeLoginViewTypePwdLogin;
    };
    self.headerView.codeLoginButtonClick = ^{
        @strongify(self);
        self.viewType = JZD_PwdOrCodeLoginViewTypeCodeLogin;
    };
}

- (void)setViewType:(JZD_PwdOrCodeLoginViewType)viewType {
    _viewType = viewType;
    [self.tableView reloadData];
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 55;
    }else if (indexPath.row == 1) {
        if (self.viewType == JZD_PwdOrCodeLoginViewTypePwdLogin) {
            return 90;
        }
        return 55;
    }else if (indexPath.row == 2) {
        return 100;
    }else {
        if (self.viewType == JZD_PwdOrCodeLoginViewTypePwdLogin) {
            return DEVICE_HEIGHT - 515;
        }
        return DEVICE_HEIGHT - 480;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_PhoneCodePwdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_PhoneCodePwdTableViewCell"];
        cell.cellType = JZD_PhoneCodePwdTableViewCellTypePhone;
        
        cell.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        @weakify(self);
        cell.textFieldDidChange = ^(UITextField *textfield) {
            @strongify(self);
            self.phone = textfield.text ?: @"";
        };
        
        return cell;
    } else if (indexPath.row == 1) {
        JZD_PhoneCodePwdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_PhoneCodePwdTableViewCell"];
        cell.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        if (_viewType == JZD_PwdOrCodeLoginViewTypePwdLogin) {
            cell.cellType = JZD_PhoneCodePwdTableViewCellTypePwd;
            @weakify(self);
            cell.forgetPwdButtonClick = ^{
                @strongify(self);
                if (self.forgetPwdButtonClick) {
                    self.forgetPwdButtonClick();
                }
            };
            cell.textFieldDidChange = ^(UITextField *textfield) {
                @strongify(self);
                self.pwd = textfield.text ?: @"";
            };
        }else {
            cell.cellType = JZD_PhoneCodePwdTableViewCellTypeCode;
            @weakify(self);
            cell.textFieldDidChange = ^(UITextField *textfield) {
                @strongify(self);
                self.authCode = textfield.text ?: @"";
            };
            cell.codeButtonClick = ^(JZD_PhoneCodePwdTableViewCell *cell) {
                @strongify(self);
                if (self.getCodeButtonClick) {
                    self.getCodeButtonClick(self.phone, cell);
                }
            };
        }
        
        return cell;
    } else if (indexPath.row == 2) {
        JZD_LoginButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_LoginButtonTableViewCell"];
        
        if (_viewType == JZD_PwdOrCodeLoginViewTypePwdLogin) {
            @weakify(self);
            cell.loginButtonClick = ^{
                @strongify(self);
                if (self.pwdLoginButtonClick) {
                    self.pwdLoginButtonClick(self.phone, self.pwd);
                }
            };
        } else {
            @weakify(self);
            cell.loginButtonClick = ^{
                @strongify(self);
                if (self.codeLoginButtonClick) {
                    self.codeLoginButtonClick(self.phone, self.authCode);
                }
            };
        }
        
        return cell;
    } else {
        JZD_QuickLoginTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_QuickLoginTableViewCell"];
        @weakify(self);
        cell.quickButtonClick = ^{
            @strongify(self);
            if (self.quickLoginButtonClick) {
                self.quickLoginButtonClick();
            }
        };
        return cell;
    }
    return 0;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
