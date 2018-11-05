//
//  IJSD_AccountViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_AccountViewController.h"

@interface IJSD_AccountViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewWidth;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end

@implementation IJSD_AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.headImage layerCornerRadius:@45 borderWidth:@5 borderColor:HEX_COLOR(0xffffff)];
    self.mainViewWidth.constant = DEVICE_WIDTH;
    self.mainViewHeight.constant = DEVICE_HEIGHT - 49;
    self.scrollView.bounces = YES;
    [self.contentView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.backgroundImage layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    
    self.scrollView.bounces = YES;
    // Do any additional setup after loading the view.
}

//头像点击事件
- (IBAction)headButtonClick:(id)sender {
    NSLog(@"====登录====");
}
//评价点击事件
- (IBAction)evaluateButtonClick:(id)sender {
    NSLog(@"====评价====");//IJSD_AccountMyEvaluateViewController
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"IJSD_AccountMyEvaluateViewController"];
    [self setHidesBottomBarWhenPushed:NO];
}
//课消记录点击事件
- (IBAction)classRecordButtonClick:(id)sender {
    NSLog(@"====课消记录====");//JZD_ServeClassConditionListViewController
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_ServeClassConditionListViewController"];
    [self setHidesBottomBarWhenPushed:NO];
}
//意见反馈点击事件
- (IBAction)feedbackButtonClick:(id)sender {
    NSLog(@"====意见反馈====");
}
//设置点击事件
- (IBAction)setButtonClick:(id)sender {
    NSLog(@"====设置====");
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"IJSD_AccountSetViewController"];
    [self setHidesBottomBarWhenPushed:NO];
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
