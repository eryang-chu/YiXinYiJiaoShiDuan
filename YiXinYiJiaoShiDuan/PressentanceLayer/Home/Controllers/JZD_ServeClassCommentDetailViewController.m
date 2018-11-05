//
//  JZD_ServeClassCommentDetailViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//


#import "JZD_ServeClassCommentDetailView.h"

#import "JZD_ServeClassComentDetailContentViewController.h"
#import "JZD_ServeClassCommentDetailViewController.h"

@interface JZD_ServeClassCommentDetailViewController ()
@property (weak, nonatomic) IBOutlet JZD_ServeClassCommentDetailView *serveClassCommentDetailView;
@property (nonatomic, strong) NSDictionary *dataDictionary;
@end

@implementation JZD_ServeClassCommentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.serveClassCommentDetailView.contentButtonClick = ^{
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];

        //获取storyboard
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
        //获取viewController
        JZD_ServeClassComentDetailContentViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"JZD_ServeClassComentDetailContentViewController"];
        controller.classContent = [self.dataDictionary null_objectForKey:@"ClassContent"];
        
        [self.navigationController pushViewController:controller animated:YES];
        [self setHidesBottomBarWhenPushed:YES];
    };
    
    NSDictionary *dict = @{@"ClassAverageClassScore":@0, @"ClassAverageWorkScore":@0, @"ClassContent":@"上课内容", @"ClassName":@"英语201810", @"ClassScore":@4, @"CommentID":@"15b846b2-a029-4e77-89d9-d6e1a16a74ee", @"CommentStr":@"不错哟", @"ImgUrl":@"", @"PersonAverageClassScore":@0, @"PersonAverageWorkScore":@0, @"StudentName":@"张三1", @"TeacherName":@"员工001", @"WorkScore":@4};
    self.dataDictionary = [NSDictionary dictionaryWithDictionary:dict];
    self.serveClassCommentDetailView.dataDict = dict;
//    [JZD_ServeApi getClassCommentDetailWithCommentId:[self.dataDict null_objectForKey:@"CommentID"] success:^(NSDictionary *dataDict) {
//        @strongify(self);
//        self.dataDictionary = [NSDictionary dictionaryWithDictionary:dataDict];
//        self.serveClassCommentDetailView.dataDict = dataDict;
//    } failure:^{
//        
//    }];
    // Do any additional setup after loading the view.
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
