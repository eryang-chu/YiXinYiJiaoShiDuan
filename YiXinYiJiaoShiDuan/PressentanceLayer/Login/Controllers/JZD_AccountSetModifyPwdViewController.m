//
//  JZD_AccountSetModifyPwdViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_FirstLoginPromptView.h"
#import "JZD_AccountSetModifyPwdView.h"
#import "JZD_AccountSetModifyPwdViewController.h"

@interface JZD_AccountSetModifyPwdViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountSetModifyPwdView *accountSetModifyPwdView;
@property (nonatomic, strong) JZD_FirstLoginPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, assign) BOOL successed;
@end

@implementation JZD_AccountSetModifyPwdViewController

- (JZD_FirstLoginPromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_FirstLoginPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 50)];
        _promptView.viewType = JZD_FirstLoginPromptViewTypeTip;
    }
    return _promptView;
}

- (UIView *)backGroundView {
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backGroundView.backgroundColor = [UIColor colorWithWhite:.3 alpha:.6];
    }
    return _backGroundView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.successed = NO;
    @weakify(self);
    self.accountSetModifyPwdView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.accountSetModifyPwdView.sureButtonClick = ^(NSString *oldPwd, NSString *passWord, NSString *surePwd) {
        NSLog(@"========");
        @strongify(self);
        if (self.successed) {
            self.promptView.tipLabel.text = @"密码修改成功";
            [self addPromptView];
            [self performSelector:@selector(removePromptView) withObject:nil afterDelay:1.0f];
        } else {
            self.promptView.tipLabel.text = @"新密码不能与原密码相同";
            [self addPromptView];
            [self performSelector:@selector(removePromptView) withObject:nil afterDelay:1.0f];
        }
    };
    // Do any additional setup after loading the view.
}

#pragma mark - 弹出提示框
- (void)addPromptView {
    [[UIApplication sharedApplication].keyWindow addSubview:self.backGroundView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.promptView];
    self.promptView.center = [UIApplication sharedApplication].keyWindow.center;
}

#pragma mark - 移除提示框
- (void)removePromptView {
    [self.backGroundView removeFromSuperview];
    [self.promptView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
