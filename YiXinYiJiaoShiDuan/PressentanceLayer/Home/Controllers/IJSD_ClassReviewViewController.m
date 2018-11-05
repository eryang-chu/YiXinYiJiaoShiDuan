//
//  IJSD_ClassReviewViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_ClassReviewListView.h"
#import "IJSD_ClassReviewViewController.h"

@interface IJSD_ClassReviewViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startDateButton;
@property (weak, nonatomic) IBOutlet UIButton *endDateButton;
@property (weak, nonatomic) IBOutlet IJSD_ClassReviewListView *classReviewListView;

@end

@implementation IJSD_ClassReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.startDateButton layerCornerRadius:@15 borderWidth:@.6 borderColor:SYSTEM_RED_COLOR];
    [self.endDateButton layerCornerRadius:@15 borderWidth:@.6 borderColor:SYSTEM_RED_COLOR];
    
    @weakify(self);
    self.classReviewListView.cellDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);//选择学生
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_ClassReviewSelectStudentViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    // Do any additional setup after loading the view.
}

#pragma mark - 返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

#pragma mark - 开始日期
- (IBAction)startDateButtonClick:(id)sender {
}

#pragma mark - 结束日期
- (IBAction)endDateButtonClick:(id)sender {
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
