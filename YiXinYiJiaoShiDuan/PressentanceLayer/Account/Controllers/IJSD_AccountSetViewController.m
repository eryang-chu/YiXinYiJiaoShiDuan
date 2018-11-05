//
//  IJSD_AccountSetViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountSetPromptView.h"
#import "JZD_AccountSetView.h"
#import "IJSD_AccountSetViewController.h"

@interface IJSD_AccountSetViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountSetView *accountSetView;
@property (nonatomic, strong) JZD_AccountSetPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@end

@implementation IJSD_AccountSetViewController

- (JZD_AccountSetPromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_AccountSetPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 140)];
        @weakify(self);
        _promptView.cancelButtonClick = ^{
            @strongify(self);
            [self removePromptView];
        };
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.accountSetView.cellDidSelectedAtIndex = ^(NSIndexPath *index) {
        @strongify(self);
        if (!index.row) {
            [self setHidesBottomBarWhenPushed:YES];
            [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountSetModifyPwdViewController"];
            [self setHidesBottomBarWhenPushed:YES];
        } else if (index.row == 2) {
            self.promptView.promptLabel.text = @"是否确定清除缓存？";
            self.promptView.sureButtonClick = ^{
                @strongify(self);
                [self removePromptView];
                NSLog(@"清除缓存");
            };
            [self addPromptView];
        } else if (index.row == 3) {
            self.promptView.promptLabel.text = @"是否确定退出登录？";
            self.promptView.sureButtonClick = ^{
                @strongify(self);
                [self removePromptView];
                NSLog(@"退出登录");
            };
            [self addPromptView];
        }
    };
    // Do any additional setup after loading the view.
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
