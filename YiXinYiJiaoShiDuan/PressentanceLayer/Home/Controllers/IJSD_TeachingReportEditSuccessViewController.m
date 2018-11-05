//
//  IJSD_TeachingReportEditSuccessViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_TeachingReportListViewController.h"
#import "IJSD_TeachingReportEditSuccessViewController.h"

@interface IJSD_TeachingReportEditSuccessViewController ()
@property (weak, nonatomic) IBOutlet UIButton *otherClassButton;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *homeButtonTrail;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherClassButtonLead;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeight;
@end

@implementation IJSD_TeachingReportEditSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentViewWidth.constant = DEVICE_WIDTH;
    self.contentViewHeight.constant = DEVICE_HEIGHT - 64;
    [self.otherClassButton layerCornerRadius:@8 borderWidth:@.6 borderColor:SYSTEM_RED_COLOR];
    [self.homeButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    self.homeButtonTrail.constant = (DEVICE_WIDTH - 130 * 2 - 16) / 2.f;
    self.otherClassButtonLead.constant = (DEVICE_WIDTH - 130 * 2 - 16) / 2.f;
    // Do any additional setup after loading the view.
}

//返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

//编辑其他班级
- (IBAction)editOtherClassButtonClick:(id)sender {
    for (UIViewController *temp in self.navigationController.viewControllers) {
        if ([temp isKindOfClass:[IJSD_TeachingReportListViewController class]]) {
            IJSD_TeachingReportListViewController *vc = (IJSD_TeachingReportListViewController *)temp;
//            vc.vcType = IJSD_GradeSelectClassViewControllerTypeLook;
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}

//返回首页
- (IBAction)homeButtonClick:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
