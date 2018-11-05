//
//  IJSD_ClassReviewSelectStudentViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_TeachingReportListView.h"
#import "IJSD_ClassReviewSelectStudentViewController.h"

@interface IJSD_ClassReviewSelectStudentViewController ()
@property (weak, nonatomic) IBOutlet IJSD_TeachingReportListView *teachingReportListView;
@property (weak, nonatomic) IBOutlet UIButton *allSelectButton;
@property (weak, nonatomic) IBOutlet UIImageView *allSelectImage;
@end

@implementation IJSD_ClassReviewSelectStudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allSelectButton.selected = NO;
    
    @weakify(self);
    self.teachingReportListView.cellDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_ClassReviewReviewViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    // Do any additional setup after loading the view.
}

#pragma mark - 上课内容
- (IBAction)contentButtonClick:(id)sender {
    //
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_ClassReviewContentViewController"];
    [self setHidesBottomBarWhenPushed:YES];
}

#pragma mark - 返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

#pragma mark - 全选
- (IBAction)allSelectButtonClick:(id)sender {
    if (self.allSelectButton.selected) {
        self.allSelectButton.selected = NO;
        self.allSelectImage.image = [UIImage imageNamed:@"ic_zhiweixuan"];
    } else {
        self.allSelectButton.selected = YES;
        self.allSelectImage.image = [UIImage imageNamed:@"ic_zhixuanzhong"];
    }
}

#pragma mark - 立即点评
- (IBAction)reviewButtonClick:(id)sender {
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_ClassReviewReviewViewController"];
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
