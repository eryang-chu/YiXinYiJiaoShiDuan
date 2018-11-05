//
//  IJSD_TeachingReportListViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_TeachingReportListView.h"
#import "IJSD_SelectCampusAndExamPromptView.h"

#import "IJSD_TeachingReportEditViewController.h"
#import "IJSD_TeachingReportListViewController.h"

@interface IJSD_TeachingReportListViewController ()
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UIButton *allSelectButton;
@property (weak, nonatomic) IBOutlet UIImageView *allSelectImage;
@property (weak, nonatomic) IBOutlet IJSD_TeachingReportListView *teachingReportListView;
@property (nonatomic, strong) IJSD_SelectCampusAndExamPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) NSArray *classList;
@end

@implementation IJSD_TeachingReportListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *classArr = @[@"数学期中考试", @"数学期中考试1", @"数学期中考试2", @"数学期中考试3"];
    self.classList = [NSArray arrayWithArray:classArr];
    
    self.allSelectButton.selected = NO;
    
    @weakify(self);
    self.teachingReportListView.cellDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
        //可编辑
        [self setHidesBottomBarWhenPushed:YES];
//        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_TeachingReportEditViewController"];
        //获取storyboard
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
        //获取viewController
        IJSD_TeachingReportEditViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"IJSD_TeachingReportEditViewController"];
        controller.editable = YES;
        //push
        [self.navigationController pushViewController:controller animated:YES];
        [self setHidesBottomBarWhenPushed:YES];
    };
    // Do any additional setup after loading the view.
}

//返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

//选择班级
- (IBAction)classButtonClick:(id)sender {
    [self addPromptView];
    self.promptView.dataList = self.classList;
}

//全选
- (IBAction)allSelectButtonClick:(id)sender {
    if (self.allSelectButton.selected) {
        self.allSelectButton.selected = NO;
        self.allSelectImage.image = [UIImage imageNamed:@"ic_zhiweixuan"];
    } else {
        self.allSelectButton.selected = YES;
        self.allSelectImage.image = [UIImage imageNamed:@"ic_zhixuanzhong"];
    }
}

//编辑
- (IBAction)editReportButtonClick:(id)sender {
    //不可编辑
    [self setHidesBottomBarWhenPushed:YES];
//    [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_TeachingReportEditViewController"];
    //获取storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    //获取viewController
    IJSD_TeachingReportEditViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"IJSD_TeachingReportEditViewController"];
    controller.editable = NO;
    //push
    [self.navigationController pushViewController:controller animated:YES];
    [self setHidesBottomBarWhenPushed:YES];
}

- (IJSD_SelectCampusAndExamPromptView *)promptView {
    if (!_promptView) {
        if (self.classList.count < 4) {
            _promptView = [[IJSD_SelectCampusAndExamPromptView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - 50 *self.classList.count, DEVICE_WIDTH, 50 *self.classList.count)];
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
            self.classLabel.text = [NSString stringWithFormat:@"%@",[self.classList objectAtIndex:index.row]];
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
