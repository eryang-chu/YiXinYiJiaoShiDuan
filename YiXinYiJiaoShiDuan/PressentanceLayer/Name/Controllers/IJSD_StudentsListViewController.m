//
//  IJSD_StudentsListViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_StudentsListView.h"

#import "JZD_AccountSetPromptView.h"
#import "JZD_TimeTableSelectTimePromptView.h"
#import "IJSD_StudentsListViewController.h"

@interface IJSD_StudentsListViewController ()
@property (weak, nonatomic) IBOutlet UIButton *jifeiButton;
@property (weak, nonatomic) IBOutlet UIButton *chuqinButton;
@property (weak, nonatomic) IBOutlet UIButton *addStudentButton;
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIImageView *chuqinImage;
@property (weak, nonatomic) IBOutlet UIImageView *jifeiImage;
@property (weak, nonatomic) IBOutlet UIButton *callNameButton;

@property (weak, nonatomic) IBOutlet UILabel *yingdaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *chuqinLabel;
@property (weak, nonatomic) IBOutlet UILabel *jifeiLabel;
@property (weak, nonatomic) IBOutlet UILabel *shitingLabel;
@property (weak, nonatomic) IBOutlet IJSD_StudentsListView *studentsListView;

@property (nonatomic, strong) JZD_AccountSetPromptView *promptView2;
@property (nonatomic, strong) JZD_TimeTableSelectTimePromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) UIView *phoneBackGroundView;
@property (nonatomic, strong) NSArray *reasonList;
@end

@implementation IJSD_StudentsListViewController

- (JZD_AccountSetPromptView *)promptView2 {
    if (!_promptView2) {
        _promptView2 = [[JZD_AccountSetPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 140)];
        @weakify(self);
        _promptView2.cancelButtonClick = ^{
            @strongify(self);
            [self removePhonePromptView];
        };
        _promptView2.promptLabel.text = @"是否拨打该生家长电话？";
        _promptView2.sureButtonClick = ^{
            @strongify(self);
            [self removePhonePromptView];
            NSLog(@"打电话");
        };
    }
    return _promptView2;
}
- (JZD_TimeTableSelectTimePromptView *)promptView {
    if (!_promptView) {
        if (self.reasonList.count < 4) {
            _promptView = [[JZD_TimeTableSelectTimePromptView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - 50 *self.reasonList.count, DEVICE_WIDTH, 50 *self.reasonList.count)];
        } else {
            _promptView = [[JZD_TimeTableSelectTimePromptView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - 200, DEVICE_WIDTH, 200)];
        }
        
        @weakify(self);
        _promptView.cellDidSelectAtIndexPath = ^(NSIndexPath *index) {
            @strongify(self);
            [self removePromptView];
            NSDictionary *dict = [self.reasonList objectAtIndex:index.row];
//            self.campusDict = dict;
//            self.campusLabel.text = [dict objectForKey:@"Name"];
        };
    }
    return _promptView;
}

- (UIView *)backGroundView {
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backGroundView.backgroundColor = [UIColor colorWithWhite:.3 alpha:.6];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removePromptView)];
        [_backGroundView addGestureRecognizer:tap];
    }
    return _backGroundView;
}

- (UIView *)phoneBackGroundView {
    if (!_phoneBackGroundView) {
        _phoneBackGroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _phoneBackGroundView.backgroundColor = [UIColor colorWithWhite:.3 alpha:.6];
    }
    return _phoneBackGroundView;
}

#pragma mark - 弹出提示框
- (void)addPromptView {
    [[UIApplication sharedApplication].keyWindow addSubview:self.backGroundView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.promptView];
}
- (void)addPhonePromptView {
    [[UIApplication sharedApplication].keyWindow addSubview:self.phoneBackGroundView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.promptView2];
     self.promptView2.center = [UIApplication sharedApplication].keyWindow.center;
}

#pragma mark - 移除提示框
- (void)removePromptView {
    [self.backGroundView removeFromSuperview];
    [self.promptView removeFromSuperview];
}
- (void)removePhonePromptView {
    [self.phoneBackGroundView removeFromSuperview];
    [self.promptView2 removeFromSuperview];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.searchView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.addStudentButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.callNameButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    
    NSArray *reasonArr = @[@{@"Name":@"无"}, @{@"Name":@"01-事假"}, @{@"Name":@"02-病假"}, @{@"Name":@"03-旷课"}, @{@"Name":@"已补课"}];
    self.reasonList = [NSArray arrayWithArray:reasonArr];
    self.promptView.dataList = reasonArr;
    @weakify(self);
    self.studentsListView.queqinButtonClickAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
        [self addPromptView];
    };
    self.studentsListView.phoneButtonClickAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
        [self addPhonePromptView];
    };
    // Do any additional setup after loading the view.
}

#pragma mark - 返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

#pragma mark - 出勤
- (IBAction)chuqinButtonClick:(id)sender {
}

#pragma mark - 计费
- (IBAction)jifeiButtonClick:(id)sender {
}

#pragma mark - 添加学员
- (IBAction)addStudentButtonClick:(id)sender {
    //
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"CallNames" controllerId:@"IJSD_AddStudentsListViewController"];
    [self setHidesBottomBarWhenPushed:YES];
}


- (IBAction)callNameButtonClick:(id)sender {
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
