//
//  IJSD_ClassReviewReviewViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_StarView.h"

#import "JZD_ServeClassComentDetailContentViewController.h"
#import "IJSD_ClassReviewReviewViewController.h"

@interface IJSD_ClassReviewReviewViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewHeight;

@property (weak, nonatomic) IBOutlet UILabel *studentNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *teacherLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *perCapitaLabel;
@property (weak, nonatomic) IBOutlet UILabel *classFlatLabel;
@property (weak, nonatomic) IBOutlet JZD_StarView *classStarView;
@property (weak, nonatomic) IBOutlet UILabel *workPerCapitaLabel;
@property (weak, nonatomic) IBOutlet UILabel *workClassFlatLabel;
@property (weak, nonatomic) IBOutlet JZD_StarView *workStarView;
@property (weak, nonatomic) IBOutlet UITextView *evaluateTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveTemplateButton;
@end

@implementation IJSD_ClassReviewReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.classStarView.score = 4;
    self.workStarView.score = 5;
    [self.saveTemplateButton layerCornerRadius:@8 borderWidth:@.6 borderColor:SYSTEM_RED_COLOR];
    [self.evaluateTextView layerCornerRadius:@8 borderWidth:@.6 borderColor:HEX_COLOR(0x666666)];
    
    self.scrollView.bounces = YES;
    self.mainViewWidth.constant = DEVICE_WIDTH;
    self.mainViewHeight.constant = 895;
    self.scrollView.contentSize = CGSizeMake(DEVICE_WIDTH, 895);
    
    // Do any additional setup after loading the view.
}

#pragma mark - 存为草稿
- (IBAction)saveButtonClick:(id)sender {
}

#pragma mark - 提交
- (IBAction)commitButtonClick:(id)sender {
}

#pragma mark - 选择模版
- (IBAction)selectTemplateButtonClick:(id)sender {
    //
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_ClassReviewTemplateViewController"];
    [self setHidesBottomBarWhenPushed:YES];
}

#pragma mark - 存为模版
- (IBAction)saveTemplateButtonClick:(id)sender {
}

#pragma mark - 添加图片
- (IBAction)addImageButtonClick:(id)sender {
}

#pragma mark - 上课内容
- (IBAction)classContentButtonClick:(id)sender {
    [self setHidesBottomBarWhenPushed:YES];
    
    //获取storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    //获取viewController
    JZD_ServeClassComentDetailContentViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"JZD_ServeClassComentDetailContentViewController"];
    controller.classContent = @"莉莉同学今天表现很不错";
    
    [self.navigationController pushViewController:controller animated:YES];
    [self setHidesBottomBarWhenPushed:YES];
}

#pragma mark - 点评历史
- (IBAction)historyButtonClick:(id)sender {
    //
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_ClassReviewHistoryListViewController"];
    [self setHidesBottomBarWhenPushed:YES];
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
