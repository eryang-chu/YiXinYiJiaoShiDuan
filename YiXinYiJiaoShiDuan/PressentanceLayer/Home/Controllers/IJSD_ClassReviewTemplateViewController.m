//
//  IJSD_ClassReviewTemplateViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_ClassReviewTemplateListView.h"
#import "IJSD_ClassReviewTemplateViewController.h"

@interface IJSD_ClassReviewTemplateViewController ()
@property (weak, nonatomic) IBOutlet IJSD_ClassReviewTemplateListView *classReviewTemplateListView;
@property (nonatomic, strong) NSArray *dataList;
@end

@implementation IJSD_ClassReviewTemplateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *dataArr = @[@"上课认真听讲，及时完成课后作业，有不懂的问题会主动提问，并进行攻克，该生综合表现很好，希望可以再接再厉。", @"上课认真听讲，及时完成课后作业，有不懂的问题会主动提问，并进行攻克，该生综合表现很好，希望可以再接再厉。", @"上课认真听讲，及时完成课后作业，有不懂的问题会主动提问，并进行攻克，该生综合表现很好，希望可以再接再厉。上课认真听讲，及时完成课后作业，有不懂的问题会主动提问，并进行攻克，该生综合表现很好，希望可以再接再厉。"];
    
    self.classReviewTemplateListView.dataList = dataArr;
    
    @weakify(self);
    self.classReviewTemplateListView.cellDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
    };
    // Do any additional setup after loading the view.
}

#pragma mark - 确定
- (IBAction)sureButtonClick:(id)sender {
    [self popViewController];
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
