//
//  IJSD_ClassScheduleWeekViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_ClassScheduleWeekView.h"

#import "IJSD_ClassScheduleMonthViewController.h"
#import "IJSD_ClassScheduleWeekViewController.h"

@interface IJSD_ClassScheduleWeekViewController ()
@property (weak, nonatomic) IBOutlet IJSD_ClassScheduleWeekView *classScheduleWeekView;

@property (weak, nonatomic) IBOutlet UIButton *lastWeekButton;
@property (weak, nonatomic) IBOutlet UIButton *weekButton;
@property (weak, nonatomic) IBOutlet UIButton *nextWeekButton;

@property (nonatomic, strong) NSArray *dataList;
@end

@implementation IJSD_ClassScheduleWeekViewController

#pragma mark - 移除月课表视图控制器
- (void)removeClassScheduleMonthViewController {
    NSMutableArray *vcArrM = [NSMutableArray arrayWithCapacity:0];
    [vcArrM addObjectsFromArray:self.navigationController.viewControllers];
    for (UIViewController *temp in vcArrM) {
        if ([temp isKindOfClass:[IJSD_ClassScheduleMonthViewController class]]) {
            [vcArrM removeObject:temp];
            break;
        }
    }
    
    self.navigationController.viewControllers = vcArrM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self removeClassScheduleMonthViewController];
    
    [self.lastWeekButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.weekButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.nextWeekButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    
    self.lastWeekButton.selected = NO;
    self.weekButton.selected = YES;
    self.nextWeekButton.selected = NO;
    
    NSArray *dataArr = @[@{@"weekday":@"星期三", @"date":@"10-31", @"list":@[@{@"title":@"6年级全科全优6-1班（18暑2）", @"status":@"已上课", @"campus":@"杨家坪校区", @"classroom":@"教室201", @"time":@"09:00—11:00", @"number":@"22/24"}, @{@"title":@"6年级全科全优6-1班（18暑2）", @"status":@"已上课", @"campus":@"杨家坪校区", @"classroom":@"教室201", @"time":@"09:00—11:00", @"number":@"22/24"}, @{@"title":@"6年级全科全优6-1班（18暑2）", @"status":@"已上课", @"campus":@"杨家坪校区", @"classroom":@"教室201", @"time":@"09:00—11:00", @"number":@"22/24"}]}, @{@"weekday":@"星期三", @"date":@"10-31", @"list":@[@{@"title":@"6年级全科全优6-1班（18暑2）", @"status":@"已上课", @"campus":@"杨家坪校区", @"classroom":@"教室201", @"time":@"09:00—11:00", @"number":@"22/24"}, @{@"title":@"6年级全科全优6-1班（18暑2）", @"status":@"已上课", @"campus":@"杨家坪校区", @"classroom":@"教室201", @"time":@"09:00—11:00", @"number":@"22/24"}]}, @{@"weekday":@"星期三", @"date":@"10-31", @"list":@[]}];
    
    self.classScheduleWeekView.dataList = dataArr;
    
    @weakify(self);
    self.classScheduleWeekView.cellDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);//
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_ClassScheduleCourseDetailViewController"];
        [self setHidesBottomBarWhenPushed:YES];
        
    };
    // Do any additional setup after loading the view.
}

//返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

//上周
- (IBAction)lastweekButtonClick:(id)sender {
    if (!self.lastWeekButton.selected) {
        self.lastWeekButton.selected = YES;
        self.lastWeekButton.backgroundColor = SYSTEM_RED_COLOR;
        [self.lastWeekButton setTitleColor:HEX_COLOR(0xffffff) forState:UIControlStateNormal];
        
        self.weekButton.selected = NO;
        self.weekButton.backgroundColor = HEX_COLOR(0xf2f2f2);
        [self.weekButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
        
        self.nextWeekButton.selected = NO;
        self.nextWeekButton.backgroundColor = HEX_COLOR(0xf2f2f2);
        [self.nextWeekButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    }
}

//本周
- (IBAction)weekButtonClick:(id)sender {
    if (!self.weekButton.selected) {
        self.weekButton.selected = YES;
        self.weekButton.backgroundColor = SYSTEM_RED_COLOR;
        [self.weekButton setTitleColor:HEX_COLOR(0xffffff) forState:UIControlStateNormal];
        
        self.lastWeekButton.selected = NO;
        self.lastWeekButton.backgroundColor = HEX_COLOR(0xf2f2f2);
        [self.lastWeekButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
        
        self.nextWeekButton.selected = NO;
        self.nextWeekButton.backgroundColor = HEX_COLOR(0xf2f2f2);
        [self.nextWeekButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    }
}

//下周
- (IBAction)nextWeekButtonClick:(id)sender {
    if (!self.nextWeekButton.selected) {
        self.nextWeekButton.selected = YES;
        self.nextWeekButton.backgroundColor = SYSTEM_RED_COLOR;
        [self.nextWeekButton setTitleColor:HEX_COLOR(0xffffff) forState:UIControlStateNormal];
        
        self.lastWeekButton.selected = NO;
        self.lastWeekButton.backgroundColor = HEX_COLOR(0xf2f2f2);
        [self.lastWeekButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
        
        self.weekButton.selected = NO;
        self.weekButton.backgroundColor = HEX_COLOR(0xf2f2f2);
        [self.weekButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    }
}

//按月
- (IBAction)monthButtonClick:(id)sender {
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_ClassScheduleMonthViewController"];
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
