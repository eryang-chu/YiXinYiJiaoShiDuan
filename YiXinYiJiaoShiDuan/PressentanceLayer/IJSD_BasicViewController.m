//
//  IJSD_BasicViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicViewController.h"

@interface IJSD_BasicViewController ()
@property (strong, nonatomic) UIView *blankHubView;
@property (assign, nonatomic) BOOL isShowBlankView;
@end

@implementation IJSD_BasicViewController

- (UIView *)blankHubView {
    if (!_blankHubView) {
        _blankHubView = [[UIView alloc] init];
        _blankHubView.backgroundColor = [UIColor whiteColor];
        
        [MBProgressHUD showHUDAddedTo:_blankHubView animated:YES];
    }
    return _blankHubView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)showNormalBlankLoadingView {
    [self showNormalBlankLoadingInView:self.view];
}

- (void)showNormalBlankLoadingInView:(UIView *)view {
    if (_isShowBlankView) {
        return;
    }
    _isShowBlankView = YES;
    self.blankHubView.frame = view.bounds;
    self.blankHubView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [view addSubview:self.blankHubView];
    @weakify(self);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self);
        [self hideBlankLoadingView];
    });
}
- (void)showClearColorBlankLoadingView {
    [self showClearColorBlankLoadingInView:self.view];
}
- (void)showClearColorBlankLoadingInView:(UIView *)view {
    self.blankHubView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.2];
    [self showNormalBlankLoadingInView:view];
}
- (void)hideBlankLoadingView {
    if (!_isShowBlankView) {
        return;
    }
    _isShowBlankView = NO;
    [self.blankHubView removeFromSuperview];
    self.blankHubView = nil;
}

#pragma mark - 界面跳转
- (void)pushToViewControllerWithStoryBoardName:(NSString *)storyBoardName controllerId:(NSString *)controllerId {
    //获取storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    //获取viewController
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:controllerId];
    //push
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)popViewController {
    [self.navigationController popViewControllerAnimated:YES];
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
