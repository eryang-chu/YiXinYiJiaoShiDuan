//
//  IJSD_AddStudentsListViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/3.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_AddStudentsListView.h"
#import "IJSD_AddStudentsListViewController.h"

@interface IJSD_AddStudentsListViewController ()

@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *addStudentButton;
@property (weak, nonatomic) IBOutlet IJSD_AddStudentsListView *addStudentsListView;
@end

@implementation IJSD_AddStudentsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.searchView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.addStudentButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    // Do any additional setup after loading the view.
}

#pragma mark - 返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

#pragma mark - 搜索
- (IBAction)addStudentButtonClick:(id)sender {
}

#pragma mark - 底部按钮
- (IBAction)bottom:(id)sender {
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
