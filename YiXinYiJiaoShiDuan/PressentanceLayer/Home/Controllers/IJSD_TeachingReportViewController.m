//
//  IJSD_TeachingReportViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_SelectCampusAndExamPromptView.h"

#import "IJSD_TeachingReportViewController.h"

@interface IJSD_TeachingReportViewController ()
@property (weak, nonatomic) IBOutlet UILabel *campusLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewWidth;

@property (nonatomic, strong) IJSD_SelectCampusAndExamPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) NSArray *campusList;
@end

@implementation IJSD_TeachingReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentViewWidth.constant = DEVICE_WIDTH;
    self.contentViewHeight.constant = DEVICE_HEIGHT - 64 - 50;
    
    self.scrollView.bounces = YES;
    
    NSArray *campusArr = @[@"杨家坪校区", @"杨家坪校区1", @"杨家坪校区", @"杨家坪校区2", @"杨家坪校区3", @"杨家坪校区4"];
    self.campusList = [NSArray arrayWithArray:campusArr];
    // Do any additional setup after loading the view.
}

- (IJSD_SelectCampusAndExamPromptView *)promptView {
    if (!_promptView) {
        if (self.campusList.count < 4) {
            _promptView = [[IJSD_SelectCampusAndExamPromptView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - 50 *self.campusList.count, DEVICE_WIDTH, 50 *self.campusList.count)];
        } else {
            _promptView = [[IJSD_SelectCampusAndExamPromptView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - 200, DEVICE_WIDTH, 200)];
        }
        
        
        @weakify(self);
        _promptView.cancelButtonClick = ^{
            @strongify(self);
            [self removePromptView];
        };
        _promptView.sureButtonClick = ^(NSIndexPath *index) {
            @strongify(self);
            [self removePromptView];
            
            //标题
            self.campusLabel.text = [NSString stringWithFormat:@"%@",[self.campusList objectAtIndex:index.row]];
        };
    }
    return _promptView;
}

- (UIView *)backGroundView {
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backGroundView.backgroundColor = [UIColor colorWithWhite:.3 alpha:.6];
        //        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removePromptView)];
        //        [_backGroundView addGestureRecognizer:tap];
    }
    return _backGroundView;
}

#pragma mark - 弹出提示框
- (void)addPromptView {
    [[UIApplication sharedApplication].keyWindow addSubview:self.backGroundView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.promptView];
}

#pragma mark - 移除提示框
- (void)removePromptView {
    [self.backGroundView removeFromSuperview];
    [self.promptView removeFromSuperview];
}

//返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

//确认
- (IBAction)sureButtonClick:(id)sender {
    //
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_TeachingReportListViewController"];
    [self setHidesBottomBarWhenPushed:YES];
}

//选择校区
- (IBAction)selectCampusButtonClick:(id)sender {
    [self addPromptView];
    self.promptView.dataList = self.campusList;
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
