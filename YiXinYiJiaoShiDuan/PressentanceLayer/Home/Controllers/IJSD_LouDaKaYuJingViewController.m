//
//  IJSD_LouDaKaYuJingViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_LeakFillingListView.h"
#import "IJSD_SelectCampusAndExamPromptView.h"

#import "IJSD_LouDaKaYuJingViewController.h"

@interface IJSD_LouDaKaYuJingViewController ()
@property (weak, nonatomic) IBOutlet IJSD_LeakFillingListView *leakFillingListView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (nonatomic, strong) IJSD_SelectCampusAndExamPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) NSArray *dateList;
@end

@implementation IJSD_LouDaKaYuJingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.leakFillingListView.ignoreButtonClickAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
    };
    self.leakFillingListView.callButtonClickAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
    };
    
    NSArray *dateArr = @[@"2018-08-01", @"2018-08-02", @"2018-08-03", @"2018-08-04", @"2018-08-05"];
    self.dateList = [NSArray arrayWithArray:dateArr];
    self.promptView.dataList = dateArr;
    // Do any additional setup after loading the view.
}

- (IJSD_SelectCampusAndExamPromptView *)promptView {
    if (!_promptView) {
        if (self.dateList.count < 4) {
            _promptView = [[IJSD_SelectCampusAndExamPromptView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - 50 *self.dateList.count, DEVICE_WIDTH, 50 *self.dateList.count)];
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
            self.dateLabel.text = [NSString stringWithFormat:@"%@",[self.dateList objectAtIndex:index.row]];
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
}

#pragma mark - 移除提示框
- (void)removePromptView {
    [self.backGroundView removeFromSuperview];
    [self.promptView removeFromSuperview];
}

#pragma mark - 返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

#pragma mark - 选择日期
- (IBAction)dateButtonClick:(id)sender {
    [self addPromptView];
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
