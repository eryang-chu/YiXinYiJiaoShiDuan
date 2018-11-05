//
//  IJSD_ClassReviewHistoryListViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_ClassReviewHistoryListView.h"
#import "IJSD_ClassReviewHistoryListViewController.h"

@interface IJSD_ClassReviewHistoryListViewController ()

@property (weak, nonatomic) IBOutlet IJSD_ClassReviewHistoryListView *classReviewHistoryListView;
@end

@implementation IJSD_ClassReviewHistoryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.classReviewHistoryListView.cellDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);//
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_ServeClassCommentDetailViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    // Do any additional setup after loading the view.
}

#pragma mark - 返回
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
