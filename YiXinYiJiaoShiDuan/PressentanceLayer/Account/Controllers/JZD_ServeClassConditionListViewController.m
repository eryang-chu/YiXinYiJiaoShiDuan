//
//  JZD_ServeClassConditionListViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//


#import "JZD_ServeClassConditionListView.h"
#import "JZD_ServeClassConditionListViewController.h"

@interface JZD_ServeClassConditionListViewController ()
@property (weak, nonatomic) IBOutlet JZD_ServeClassConditionListView *ServeClassConditionListView;

@property (nonatomic, strong) NSArray *dataList;
@end

@implementation JZD_ServeClassConditionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.ServeClassConditionListView.reportDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);//JZD_ServeClassConditionDetailViewController
        NSDictionary *dict = [self.dataList objectAtIndex:index.row];
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"IJSD_AccountClassAwayDetailViewController"];
        //获取storyboard
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Serve" bundle:nil];
        //获取viewController
//        JZD_ServeClassConditionDetailViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"JZD_ServeClassConditionDetailViewController"];
//        controller.classId = [dict null_objectForKey:@"ClassId"];
        //push
//        [self.navigationController pushViewController:controller animated:YES];
        [self setHidesBottomBarWhenPushed:YES];
    };
    
    // Do any additional setup after loading the view.
}

- (IBAction)backButttonClick:(id)sender {
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
