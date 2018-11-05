//
//  IJSD_CallNamesViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_CallNamesListView.h"
#import "IJSD_SelectCampusAndExamPromptView.h"

#import "IJSD_CallNamesViewController.h"

@interface IJSD_CallNamesViewController ()
@property (weak, nonatomic) IBOutlet IJSD_CallNamesListView *callNamesListView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) IJSD_SelectCampusAndExamPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) NSArray *dateList;
@end

@implementation IJSD_CallNamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.callNamesListView.cellDidSelectedAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
        //IJSD_StudentsListViewController
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"CallNames" controllerId:@"IJSD_StudentsListViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    
    NSArray *dateArr = @[@"8月5日（周日）", @"8月6日（周一）", @"8月7日（周二）", @"8月8日（周三）", @"8月9日（周四）"];
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
            self.titleLabel.text = [NSString stringWithFormat:@"%@",[self.dateList objectAtIndex:index.row]];
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

//选择日期
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
