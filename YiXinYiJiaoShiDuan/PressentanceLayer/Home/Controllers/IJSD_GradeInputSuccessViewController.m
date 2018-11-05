//
//  IJSD_GradeInputSuccessViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_GradeSelectClassViewController.h"
#import "IJSD_GradeInputSuccessViewController.h"

@interface IJSD_GradeInputSuccessViewController ()
@property (weak, nonatomic) IBOutlet UIButton *gradeButton;
@property (weak, nonatomic) IBOutlet UIButton *otherClassButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *gradeButtonTrail;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherClassButtonLead;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeight;
@end

@implementation IJSD_GradeInputSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.bounces = YES;
    self.contentViewWidth.constant = DEVICE_WIDTH;
    self.contentViewHeight.constant = DEVICE_HEIGHT - 64;
    self.gradeButtonTrail.constant = (DEVICE_WIDTH - 130 * 2 - 16) / 2.f;
    self.otherClassButtonLead.constant = (DEVICE_WIDTH - 130 * 2 - 16) / 2.f;
    [self.gradeButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.otherClassButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    // Do any additional setup after loading the view.
}

//查看成绩
- (IBAction)gradeButtonClick:(id)sender {
    for (UIViewController *temp in self.navigationController.viewControllers) {
        if ([temp isKindOfClass:[IJSD_GradeSelectClassViewController class]]) {
            IJSD_GradeSelectClassViewController *vc = (IJSD_GradeSelectClassViewController *)temp;
            vc.vcType = IJSD_GradeSelectClassViewControllerTypeLook;
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}

//录入其他班级
- (IBAction)otherClassButtonClick:(id)sender {
    for (UIViewController *temp in self.navigationController.viewControllers) {
        if ([temp isKindOfClass:[IJSD_GradeSelectClassViewController class]]) {
            IJSD_GradeSelectClassViewController *vc = (IJSD_GradeSelectClassViewController *)temp;
            vc.vcType = IJSD_GradeSelectClassViewControllerTypeInput;
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
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
