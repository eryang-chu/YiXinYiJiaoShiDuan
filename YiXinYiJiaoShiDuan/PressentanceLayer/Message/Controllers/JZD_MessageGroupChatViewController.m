//
//  JZD_MessageGroupChatViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_MessageGroupChatViewController.h"

@interface JZD_MessageGroupChatViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation JZD_MessageGroupChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}
- (IBAction)memberButtonClick:(id)sender {
    NSLog(@"====群成员====");//
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Message" controllerId:@"JZD_GroupChatMemberAndNoticeViewController"];
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
