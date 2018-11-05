//
//  IJSD_DynamicSelectClassViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/3.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_DynamicSelectClassListView.h"
#import "IJSD_DynamicSelectClassViewController.h"

@interface IJSD_DynamicSelectClassViewController ()
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIImageView *allSelectImage;
@property (weak, nonatomic) IBOutlet UILabel *allSelectLabel;
@property (weak, nonatomic) IBOutlet UIButton *allSelectButton;
@property (weak, nonatomic) IBOutlet IJSD_DynamicSelectClassListView *dynamicSelectClassListView;

@end

@implementation IJSD_DynamicSelectClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allSelectButton.selected = NO;
    [self.searchView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    // Do any additional setup after loading the view.
}

#pragma mark - 返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

#pragma mark - 全选
- (IBAction)allSelectButtonClick:(id)sender {
    if (self.allSelectButton.selected) {
        self.allSelectButton.selected = NO;
        [self.allSelectImage setImage:[UIImage imageNamed:@"ic_zhiweixuan"]];
    } else {
        self.allSelectButton.selected = YES;
        [self.allSelectImage setImage:[UIImage imageNamed:@"ic_zhixuanzhong"]];
    }
}

#pragma mark - 确定
- (IBAction)sureButtonClick:(id)sender {
    
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
