//
//  JZD_AccountSetModifyPwdView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountSetModifyPwdTableViewCell.h"
#import "JZD_LoginButtonTableViewCell.h"
#import "JZD_AccountSetModifyPwdView.h"

@interface JZD_AccountSetModifyPwdView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) NSString *oldPwd;
@property (strong, nonatomic) NSString *passWord;
@property (strong, nonatomic) NSString *surePwd;
@end
@implementation JZD_AccountSetModifyPwdView

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y - 20, self.bounds.size.width, self.bounds.size.height + 20)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_AccountSetModifyPwdTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_AccountSetModifyPwdTableViewCell"];
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
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        return 85;
    } else if (indexPath.row == 3) {
        return 65;
    }
    return 55;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3) {
        JZD_LoginButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_LoginButtonTableViewCell"];
        [cell.loginButton setTitle:@"完成" forState:UIControlStateNormal];
        @weakify(self);
        cell.loginButtonClick = ^{
            @strongify(self);
            if (self.sureButtonClick) {
                self.sureButtonClick(self.oldPwd, self.passWord, self.surePwd);
            }
        };
        
        return cell;
    } else {
        JZD_AccountSetModifyPwdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_AccountSetModifyPwdTableViewCell"];
        if (!indexPath.row) {
            cell.inputTextField.placeholder = @"请输入原密码";
            cell.cellType = JZD_AccountSetModifyPwdTableViewCellTypeNormal;
            @weakify(self);
            cell.textFieldDidChange = ^(UITextField *textfield) {
                @strongify(self);
                self.oldPwd = textfield.text ?: @"";
            };
        } else if (indexPath.row == 1) {
            cell.inputTextField.placeholder = @"请输入新密码";
            cell.cellType = JZD_AccountSetModifyPwdTableViewCellTypeNormal;
            @weakify(self);
            cell.textFieldDidChange = ^(UITextField *textfield) {
                @strongify(self);
                self.passWord = textfield.text ?: @"";
            };
        } else {
            cell.inputTextField.placeholder = @"请再次输入新密码";
            cell.cellType = JZD_AccountSetModifyPwdTableViewCellTypePwdPrompt;
            @weakify(self);
            cell.textFieldDidChange = ^(UITextField *textfield) {
                @strongify(self);
                self.surePwd = textfield.text ?: @"";
            };
        }
        
        
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
