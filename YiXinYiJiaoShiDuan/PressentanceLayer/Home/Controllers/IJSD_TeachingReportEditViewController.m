//
//  IJSD_TeachingReportEditViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountSetPromptView.h"
#import "IJSD_TeachingReportEditView.h"
#import "IJSD_TeachingReportEditViewController.h"

@interface IJSD_TeachingReportEditViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet IJSD_TeachingReportEditView *teachingReportEditView;
@property (nonatomic, strong) NSArray *dataList;

@property (nonatomic, strong) JZD_AccountSetPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@end

@implementation IJSD_TeachingReportEditViewController

- (JZD_AccountSetPromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_AccountSetPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 140)];
        _promptView.promptLabel.text = @"是否删除本节课的点评？";
        @weakify(self);
        _promptView.cancelButtonClick = ^{
            @strongify(self);
            [self removePromptView];
        };
        _promptView.sureButtonClick = ^{
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
    
    NSArray *dataArr = @[@{@"date":@"2018年10月10号", @"times":@"8", @"classScore":@5, @"workScore":@5, @"contentStr":@"莉莉同学今天表现很好，认真完成了老师布置的家庭作业，错题改错以及剩余题目也完成了。"},@{@"date":@"2018年10月10号", @"times":@"8", @"classScore":@5, @"workScore":@5, @"contentStr":@"莉莉同学今天表现很好，认真完成了老师布置的家庭作业，错题改错以及剩余题目也完成了。"},@{@"date":@"2018年10月10号", @"times":@"8", @"classScore":@5, @"workScore":@5, @"contentStr":@"莉莉同学今天表现很好，认真完成了老师布置的家庭作业，错题改错以及剩余题目也完成了。"}];
    
    if (self.editable) {
        self.teachingReportEditView.viewType = IJSD_TeachingReportEditViewTypeEdit;
    } else {
        self.teachingReportEditView.viewType = IJSD_TeachingReportEditViewTypeNormal;
    }
    
    self.dataList = [NSArray arrayWithArray:dataArr];
    
    self.teachingReportEditView.dataList = self.dataList;
    
    @weakify(self);
    self.teachingReportEditView.deleteButtonAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
        [self addPromptView];
    };
    // Do any additional setup after loading the view.
}

//返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

//发送
- (IBAction)sendButtonClick:(id)sender {
    NSLog(@"====发送====");//IJSD_TeachingReportEditSuccessViewController
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_TeachingReportEditSuccessViewController"];
    [self setHidesBottomBarWhenPushed:YES];
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
