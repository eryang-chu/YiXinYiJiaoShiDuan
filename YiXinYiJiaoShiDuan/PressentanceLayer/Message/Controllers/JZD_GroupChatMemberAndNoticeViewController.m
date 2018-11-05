//
//  JZD_GroupChatMemberAndNoticeViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_GroupChatMemberAndNoticeView.h"
#import "JZD_GroupChatMemberAndNoticeViewController.h"

@interface JZD_GroupChatMemberAndNoticeViewController ()
@property (weak, nonatomic) IBOutlet JZD_GroupChatMemberAndNoticeView *groupChatMemberAndNoticeView;

@end

@implementation JZD_GroupChatMemberAndNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.groupChatMemberAndNoticeView.noticeButtonClick = ^{
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Message" controllerId:@"JZD_GroupChatNoticesViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    self.groupChatMemberAndNoticeView.memberDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
        
        
    };
    self.groupChatMemberAndNoticeView.moreButtonClick = ^{
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Message" controllerId:@"JZD_GroupChatMemberListViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    // Do any additional setup after loading the view.
}

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
