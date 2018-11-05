//
//  IJSD_AccountMyEvaluateViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_StarView.h"

#import "IJSD_AccountMyEvaluateViewController.h"

@interface IJSD_AccountMyEvaluateViewController ()
@property (weak, nonatomic) IBOutlet UILabel *campusLabel;
@property (weak, nonatomic) IBOutlet UILabel *courseLabel;
@property (weak, nonatomic) IBOutlet UILabel *myAverageScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *rankingLabel;
@property (weak, nonatomic) IBOutlet UILabel *receiveEvaluageLabel;
@property (weak, nonatomic) IBOutlet UILabel *theCampusAverageScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *allCampusAverageScoreLabel;

@property (weak, nonatomic) IBOutlet UIView *myAverageScoreView;
@property (weak, nonatomic) IBOutlet UIView *otherAverageScoreView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewWidth;

@property (weak, nonatomic) IBOutlet JZD_StarView *starView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *starViewWidth;
@end

@implementation IJSD_AccountMyEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.myAverageScoreView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.otherAverageScoreView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    
    self.mainViewWidth.constant = DEVICE_WIDTH;
    self.mainViewHeight.constant = DEVICE_HEIGHT - 64;
    
    self.scrollView.bounces = YES;
    
    self.starView.score = 5;
    
    self.starViewWidth.constant = DEVICE_WIDTH / 2.f - 80;
    // Do any additional setup after loading the view.
}

//返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

//选择校区
- (IBAction)campusButtonClick:(id)sender {
    NSLog(@"====校区====");
}

//选择课程
- (IBAction)courseButtonClick:(id)sender {
    NSLog(@"====课程====");
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
