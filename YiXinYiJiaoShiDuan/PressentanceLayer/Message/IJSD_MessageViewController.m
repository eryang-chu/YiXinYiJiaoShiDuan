//
//  IJSD_MessageViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_MessageListView.h"

#import "IJSD_MessageViewController.h"

@interface IJSD_MessageViewController ()
@property (weak, nonatomic) IBOutlet UIView *noMessageView;
@property (weak, nonatomic) IBOutlet JZD_MessageListView *messageListView;
@end

@implementation IJSD_MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:3.0f];
    // Do any additional setup after loading the view.
}

//通讯录
- (IBAction)addressBookButtonClick:(id)sender {
    NSLog(@"====通讯录====");//JZD_MessageAddressBookListViewController
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Message" controllerId:@"JZD_MessageAddressBookListViewController"];
    [self setHidesBottomBarWhenPushed:NO];
}

- (void)delayMethod {
    self.noMessageView.hidden = YES;
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
