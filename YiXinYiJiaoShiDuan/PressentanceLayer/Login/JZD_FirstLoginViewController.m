//
//  JZD_FirstLoginViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_PhoneCodePwdTableViewCell.h"
#import "JZD_FirstLoginView.h"
#import "JZD_FirstLoginPromptView.h"

#import "JZD_FirstLoginViewController.h"

@interface JZD_FirstLoginViewController ()
@property (weak, nonatomic) IBOutlet JZD_FirstLoginView *firstLoginView;
@property (nonatomic, strong) JZD_FirstLoginPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) JZD_PhoneCodePwdTableViewCell *cell;
@end

@implementation JZD_FirstLoginViewController

- (JZD_FirstLoginPromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_FirstLoginPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 160)];
        
        _promptView.viewType = JZD_FirstLoginPromptViewTypeModifyPwd;
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    @weakify(self);
    self.firstLoginView.quickLoginButtonClick = ^{
        NSLog(@"====快捷登录====");
        @strongify(self);
        [self.cell stopTiming];
    };
    
    self.firstLoginView.loginButtonClick = ^(NSString *phone, NSString *code) {
        NSLog(@"====登录====");
        @strongify(self);
        [self.cell stopTiming];
        
        if (![FWEB_CommonTools isMobileNumber:phone]) {
            [self.view makeToast:@"请输入正确的手机号码" duration:1 position:CSToastPositionCenter];
        } else if (!code.length) {
            [self.view makeToast:@"请输入验证码" duration:1 position:CSToastPositionCenter];
        } else {
            [self addPromptView];
//            @weakify(self);
//            [JZD_UserApi parentCodeLoginWithAccount:phone success:^(NSDictionary *dict) {
//                @strongify(self);
//                [self addPromptView];
//                [USER_DEFAULTS setObject:dict forKey:USER_INFO];
//                [USER_DEFAULTS setBool:YES forKey:USER_IS_LOGIN];
//                [USER_DEFAULTS synchronize];
//            } failure:^(NSString *message) {
//                @strongify(self);
//                [self.view makeToast:message duration:1 position:CSToastPositionCenter];
//            }];
        }
    };
    
    self.firstLoginView.getCodeButtonClick = ^(NSString *account, JZD_PhoneCodePwdTableViewCell *cell) {
        NSLog(@"====获取验证码====");
        @strongify(self);
        if (![FWEB_CommonTools isMobileNumber:account]) {
            //提示
            [self.view makeToast:@"请输入正确的手机号码" duration:1 position:CSToastPositionCenter];
        } else {
            [cell startTiming];
            self.cell = cell;
            
//            @weakify(self);
//            [JZD_UserApi sendMsgCodeWithPhone:account success:^(NSString *message) {
//                @strongify(self);
//                [self.view makeToast:message duration:1 position:CSToastPositionCenter];
//            } failure:^(NSString *message) {
//                @strongify(self);
//                [self.view makeToast:message duration:1 position:CSToastPositionCenter];
//            }];
        }
    };
    
    self.promptView.modifyPwdButtonClick = ^{
        NSLog(@"====好的====");
        @strongify(self);
        [self removePromptView];
        
        
//        JZD_ForgetPwdPhoneViewController *vc = [[JZD_ForgetPwdPhoneViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
    };
    
    self.promptView.noModifyPwdButtonClick = ^{
        NSLog(@"====不了，下次再说====");
        @strongify(self);
        [self removePromptView];
        [FWEB_CommonTools handleLoginSuccess];
//        JZD_PwdOrCodeLoginViewController *vc = [[JZD_PwdOrCodeLoginViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
        //选择baby
//        JZD_SelectBabyViewController *vc = [[JZD_SelectBabyViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
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
