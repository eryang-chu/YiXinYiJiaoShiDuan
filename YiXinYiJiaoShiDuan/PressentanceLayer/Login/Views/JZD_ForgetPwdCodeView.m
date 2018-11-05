//
//  JZD_ForgetPwdCodeView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_PhoneCodePwdTableViewCell.h"
#import "JZD_LoginButtonTableViewCell.h"
//#import "JZD_ForgetPwdTopView.h"
#import "JZD_ForgetPwdCodeView.h"

@interface JZD_ForgetPwdCodeView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *password;
@end
@implementation JZD_ForgetPwdCodeView
- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 110)];
    }
    return _topView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.topView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_PhoneCodePwdTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_PhoneCodePwdTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_LoginButtonTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_LoginButtonTableViewCell"];
        
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
    
//    @weakify(self);
//    self.topView.backButtonClick = ^{
//        @strongify(self);
//        if (self.backButtonClick) {
//            self.backButtonClick();
//        }
//    };
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 55;
    } else if (indexPath.row == 1) {
        return 55;
    } else {
        return 100;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_PhoneCodePwdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_PhoneCodePwdTableViewCell"];
        cell.cellType = JZD_PhoneCodePwdTableViewCellTypePhone;
        
        cell.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        @weakify(self);
        cell.textFieldDidChange = ^(UITextField *textfield) {
            @strongify(self);
            self.code = textfield.text ?: @"";
        };
        
        return cell;
    } else if (indexPath.row == 1) {
        JZD_PhoneCodePwdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_PhoneCodePwdTableViewCell"];
        cell.cellType = JZD_PhoneCodePwdTableViewCellTypePhone;
        
        cell.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        @weakify(self);
        cell.textFieldDidChange = ^(UITextField *textfield) {
            @strongify(self);
            self.password = textfield.text ?: @"";
        };
        
        return cell;
    } else {
        JZD_LoginButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_LoginButtonTableViewCell"];
        [cell.loginButton setTitle:@"完成" forState:UIControlStateNormal];
        @weakify(self);
        cell.loginButtonClick = ^{
            @strongify(self);
            if (self.finishButtonClick) {
                self.finishButtonClick(self.code, self.password);
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
