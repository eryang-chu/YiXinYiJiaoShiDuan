//
//  JZD_PwdOrCodeLoginViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//



#import "JZD_PhoneCodePwdTableViewCell.h"
#import "JZD_PwdOrCodeLoginView.h"

#import "JZD_ForgetPwdPhoneViewController.h"
#import "JZD_PwdOrCodeLoginViewController.h"

@interface JZD_PwdOrCodeLoginViewController ()
@property (weak, nonatomic) IBOutlet JZD_PwdOrCodeLoginView *pwdOrCodeLoginView;
@property (nonatomic, strong) JZD_PhoneCodePwdTableViewCell *cell;
@end

@implementation JZD_PwdOrCodeLoginViewController

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

    self.pwdOrCodeLoginView.quickLoginButtonClick = ^{
        NSLog(@"====微信登录====");
    };
    self.pwdOrCodeLoginView.forgetPwdButtonClick = ^{
        NSLog(@"====忘记密码====");
        JZD_ForgetPwdPhoneViewController *vc = [[JZD_ForgetPwdPhoneViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    self.pwdOrCodeLoginView.getCodeButtonClick = ^(NSString *phone, JZD_PhoneCodePwdTableViewCell *cell) {
        if (![FWEB_CommonTools isMobileNumber:phone]) {
            //提示
            [self.view makeToast:@"请输入正确的手机号码" duration:1 position:CSToastPositionCenter];
        } else {
            [cell startTiming];
            self.cell = cell;
            
//            @weakify(self);
//            [JZD_UserApi sendMsgCodeWithPhone:phone success:^(NSString *message) {
//                @strongify(self);
//                [self.view makeToast:message duration:1 position:CSToastPositionCenter];
//            } failure:^(NSString *message) {
//                @strongify(self);
//                [self.view makeToast:message duration:1 position:CSToastPositionCenter];
//            }];
        }
    };
    self.pwdOrCodeLoginView.pwdLoginButtonClick = ^(NSString *phone, NSString *pwd) {
        NSLog(@"====密码登录====");
        @strongify(self);
        
        if (![FWEB_CommonTools isMobileNumber:phone]) {
            [self.view makeToast:@"请输入正确的手机号码" duration:1 position:CSToastPositionCenter];
        } else if (!pwd.length) {
            [self.view makeToast:@"请输入密码" duration:1 position:CSToastPositionCenter];
        } else {
            [USER_DEFAULTS setBool:YES forKey:USER_IS_LOGIN];
            [USER_DEFAULTS synchronize];
            
            [FWEB_CommonTools handleLoginSuccess];
//            @weakify(self);
//            [JZD_UserApi parentLoginWithAccount:phone password:pwd success:^(NSDictionary *dict) {
//                //跳转到首页
//                NSLog(@"跳转到首页");
//                [USER_DEFAULTS setObject:dict forKey:USER_INFO];
//                [USER_DEFAULTS setBool:YES forKey:USER_IS_LOGIN];
//                [USER_DEFAULTS synchronize];
//
//                [FWEB_CommonTools handleLoginSuccess];
//            } failure:^(NSString *message) {
//                @strongify(self);
//                [self.view makeToast:message duration:1 position:CSToastPositionCenter];
//            }];
        }
        //选择宝贝
//        JZD_SelectBabyViewController *vc = [[JZD_SelectBabyViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
    };
    self.pwdOrCodeLoginView.codeLoginButtonClick = ^(NSString *phone, NSString *code) {
        NSLog(@"====短信登录====");
        @strongify(self);
        if (![FWEB_CommonTools isMobileNumber:phone]) {
            [self.view makeToast:@"请输入正确的手机号码" duration:1 position:CSToastPositionCenter];
        } else if (!code.length) {
            [self.view makeToast:@"请输入验证码" duration:1 position:CSToastPositionCenter];
        } else {
            [USER_DEFAULTS setBool:YES forKey:USER_IS_LOGIN];
            [USER_DEFAULTS synchronize];
            
            [FWEB_CommonTools handleLoginSuccess];
//            @weakify(self);
//            [JZD_UserApi parentCodeLoginWithAccount:phone success:^(NSDictionary *dict) {
//                [USER_DEFAULTS setObject:dict forKey:USER_INFO];
//                [USER_DEFAULTS setBool:YES forKey:USER_IS_LOGIN];
//                [USER_DEFAULTS synchronize];
//                
//                [FWEB_CommonTools handleLoginSuccess];
//            } failure:^(NSString *message) {
//                @strongify(self);
//                [self.view makeToast:message duration:1 position:CSToastPositionCenter];
//            }];
        }
    };
    // Do any additional setup after loading the view from its nib.
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
