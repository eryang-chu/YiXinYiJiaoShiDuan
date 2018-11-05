//
//  JZD_ForgetPwdCodeViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ForgetPwdCodeView.h"
#import "JZD_FirstLoginPromptView.h"
#import "JZD_ForgetPwdCodeViewController.h"

@interface JZD_ForgetPwdCodeViewController ()
@property (weak, nonatomic) IBOutlet JZD_ForgetPwdCodeView *forgetPwdCodeView;
@property (nonatomic, strong) JZD_FirstLoginPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@end

@implementation JZD_ForgetPwdCodeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

/**
 * 让状态栏样式为白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (JZD_FirstLoginPromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_FirstLoginPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 55)];
        
        _promptView.viewType = JZD_FirstLoginPromptViewTypeTip;
    }
    return _promptView;
}

- (UIView *)backGroundView {
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backGroundView.backgroundColor = [UIColor colorWithWhite:.3 alpha:.6];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
        [_backGroundView addGestureRecognizer:tap];
    }
    return _backGroundView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.forgetPwdCodeView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    
    self.forgetPwdCodeView.finishButtonClick = ^(NSString *code, NSString *password) {
        NSLog(@"====完成====");
        @strongify(self);
        [self addPromptView];
        [self  performSelector:@selector(removePromptView) withObject:nil afterDelay:2.0f];
        
        //跳转到登录界面
//        [FWEB_CommonTools showLoginViewController];
    };
    // Do any additional setup after loading the view from its nib.
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

#pragma mark - 手势
- (void)tapGesture {
    [self removePromptView];
}

//返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
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
