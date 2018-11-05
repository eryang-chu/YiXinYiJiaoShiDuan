//
//  IJSD_PublicListViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_PublicListView.h"
#import "IJSD_PublicListViewController.h"

@interface IJSD_PublicListViewController ()
@property (weak, nonatomic) IBOutlet IJSD_PublicListView *publicListView;
@end

@implementation IJSD_PublicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.publicListView.cellDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);//
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_PublicDetailViewController"];
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
