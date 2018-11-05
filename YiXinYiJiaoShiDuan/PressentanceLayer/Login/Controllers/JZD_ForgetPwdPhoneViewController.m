//
//  JZD_ForgetPwdPhoneViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ForgetPwdPhoneView.h"
#import "JZD_ForgetPwdCodeViewController.h"
#import "JZD_ForgetPwdPhoneViewController.h"

@interface JZD_ForgetPwdPhoneViewController ()
@property (weak, nonatomic) IBOutlet JZD_ForgetPwdPhoneView *forgetPwdPhoneView;

@end

@implementation JZD_ForgetPwdPhoneViewController


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

//返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.forgetPwdPhoneView.getCodeButtonClick = ^(NSString *phone) {
        NSLog(@"====获取验证码====");
        @strongify(self);
        if (![FWEB_CommonTools isMobileNumber:phone]) {
            //提示
            [self.view makeToast:@"请输入正确的手机号码" duration:1 position:CSToastPositionCenter];
        } else {
            JZD_ForgetPwdCodeViewController *vc = [[JZD_ForgetPwdCodeViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    };
//    self.forgetPwdPhoneView.backButtonClick = ^{
//        NSLog(@"====返回====");
//        @strongify(self);
//        [self.navigationController popViewControllerAnimated:YES];
//    };
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
