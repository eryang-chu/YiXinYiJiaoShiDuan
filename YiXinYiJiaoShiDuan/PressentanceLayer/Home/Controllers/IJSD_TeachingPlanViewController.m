//
//  IJSD_TeachingPlanViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_TeachingPlanListView.h"
#import "IJSD_TeachingPlanViewController.h"

@interface IJSD_TeachingPlanViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *endButton;

@property (weak, nonatomic) IBOutlet IJSD_TeachingPlanListView *teachingPlanListView;
@end

@implementation IJSD_TeachingPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.searchView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.searchButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    
    [self.startButton layerCornerRadius:@8 borderWidth:@.6 borderColor:SYSTEM_RED_COLOR];
    [self.endButton layerCornerRadius:@8 borderWidth:@.6 borderColor:SYSTEM_RED_COLOR];
    
    @weakify(self);
    self.teachingPlanListView.downloadButtonClickAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
    };
    // Do any additional setup after loading the view.
}

#pragma mark - 返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

#pragma mark - 搜索
- (IBAction)searchButtonClick:(id)sender {
}

#pragma mark - 开始日期
- (IBAction)startButtonClick:(id)sender {
}

#pragma mark - 结束日期
- (IBAction)endButtonClick:(id)sender {
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
