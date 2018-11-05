//
//  IJSD_HomeViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_HomeView.h"
#import "IJSD_HomeViewController.h"

@interface IJSD_HomeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet IJSD_HomeView *homeView;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) NSArray *bannerList;
@end

@implementation IJSD_HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *dataArr = @[@{@"image":@"ic_yuwen", @"name":@"我的课表"}, @{@"image":@"ic_waijiao", @"name":@"课堂点评"}, @{@"image":@"ic_quanke", @"name":@"教学报告"}, @{@"image":@"ic_onetoone", @"name":@"成绩录入"}, @{@"image":@"ic_yuwen", @"name":@"发动态"}, @{@"image":@"ic_waijiao", @"name":@"公告"}, @{@"image":@"ic_quanke", @"name":@"漏打卡预警"}, @{@"image":@"ic_onetoone", @"name":@"教案"}];
    NSArray *bannerList = @[@"https://yxy.micmark.com/Upload/Banner/banner2.jpg", @"https://yxy.micmark.com/Upload/Banner/banner3.jpg"];
    
    self.dataList = [NSArray arrayWithArray:dataArr];
    self.bannerList = [NSArray arrayWithArray:bannerList];
    
    self.homeView.courseList = dataArr;
    self.homeView.bannerList = bannerList;
    
    @weakify(self);
    self.homeView.courseCellDidSelectedAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
        switch (index.row) {
            case 0:
                //我的课表
                [self setHidesBottomBarWhenPushed:YES];
                [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_ClassScheduleWeekViewController"];
                [self setHidesBottomBarWhenPushed:NO];
                break;
            case 1:
                //课堂点评
                [self setHidesBottomBarWhenPushed:YES];
                [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_ClassReviewViewController"];
                [self setHidesBottomBarWhenPushed:NO];
                break;
            case 2:
                //教学报告
                [self setHidesBottomBarWhenPushed:YES];
                [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_TeachingReportViewController"];
                [self setHidesBottomBarWhenPushed:NO];
                break;
            case 3:
                //成绩录入//IJSD_GradeSelectCampusViewController
                [self setHidesBottomBarWhenPushed:YES];
                [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_GradeSelectCampusViewController"];
                [self setHidesBottomBarWhenPushed:NO];
                break;
            case 4:
                //发动态IJSD_DynamicSelectClassViewController
                [self setHidesBottomBarWhenPushed:YES];
                [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_DynamicSelectClassViewController"];
                [self setHidesBottomBarWhenPushed:NO];
                break;
            case 5:
                //公告
                [self setHidesBottomBarWhenPushed:YES];
                [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_PublicListViewController"];
                [self setHidesBottomBarWhenPushed:NO];
                break;
            case 6:
                //漏打卡预警
                [self setHidesBottomBarWhenPushed:YES];
                [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_LouDaKaYuJingViewController"];
                [self setHidesBottomBarWhenPushed:NO];
                break;
            case 7:
                //教案
                [self setHidesBottomBarWhenPushed:YES];
                [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_TeachingPlanViewController"];
                [self setHidesBottomBarWhenPushed:NO];
                break;
                
            default:
                break;
        }
    };
    self.homeView.advertisingDidSelectAtIndexPath = ^(NSInteger index) {
        
    };
    // Do any additional setup after loading the view.
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
