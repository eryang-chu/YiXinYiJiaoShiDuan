//
//  IJSD_ClassScheduleClassNumberViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_ClassScheduleClassNumberListView.h"
#import "IJSD_ClassScheduleClassNumberViewController.h"

@interface IJSD_ClassScheduleClassNumberViewController ()
@property (weak, nonatomic) IBOutlet IJSD_ClassScheduleClassNumberListView *classScheduleClassNumberListView;
@property (weak, nonatomic) IBOutlet UILabel *yingdaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *shidaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *jifeiLabel;

@end

@implementation IJSD_ClassScheduleClassNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.classScheduleClassNumberListView.phoneButtonClickAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
    };
    // Do any additional setup after loading the view.
}

//返回
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
