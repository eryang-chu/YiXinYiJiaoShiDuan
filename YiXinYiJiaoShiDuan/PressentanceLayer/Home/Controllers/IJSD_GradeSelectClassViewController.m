//
//  IJSD_GradeSelectClassViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_GradeInputSurePromptView.h"
#import "IJSD_SelectCampusAndExamPromptView.h"
#import "IJSD_SelectClassInputGradeListView.h"
#import "IJSD_GradeSelectClassViewController.h"

@interface IJSD_GradeSelectClassViewController ()
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;

@property (weak, nonatomic) IBOutlet IJSD_SelectClassInputGradeListView *selectClassInputGradeListView;
@property (nonatomic, strong) IJSD_SelectCampusAndExamPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;

@property (nonatomic, strong) NSArray *classesList;
@property (nonatomic, strong) NSMutableArray *gradeListM;

@property (nonatomic, strong) IJSD_GradeInputSurePromptView *surePromptView;

@property (weak, nonatomic) IBOutlet UIView *selectClassView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleViewTop;
@property (weak, nonatomic) IBOutlet UIView *bottomSureView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSureViewHeight;
@end

@implementation IJSD_GradeSelectClassViewController

- (NSMutableArray *)gradeListM {
    if (!_gradeListM) {
        _gradeListM = [NSMutableArray arrayWithCapacity:0];
    }
    return _gradeListM;
}

- (IJSD_GradeInputSurePromptView *)surePromptView {
    if (!_surePromptView) {
        _surePromptView = [[IJSD_GradeInputSurePromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 60, 200)];
        [_surePromptView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
        @weakify(self);
        _surePromptView.sureButtonClick = ^{
            @strongify(self);
            [self removeSurePromptView];
            
            [self setHidesBottomBarWhenPushed:YES];
            [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_GradeInputSuccessViewController"];
            [self setHidesBottomBarWhenPushed:YES];
        };
        _surePromptView.cancelButtonClick = ^{
            @strongify(self);
            [self removeSurePromptView];
        };
    }
    return _surePromptView;
}

- (IJSD_SelectCampusAndExamPromptView *)promptView {
    if (!_promptView) {
        if (self.classesList.count < 4) {
            _promptView = [[IJSD_SelectCampusAndExamPromptView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - 50 *self.classesList.count, DEVICE_WIDTH, 50 *self.classesList.count)];
        } else {
            _promptView = [[IJSD_SelectCampusAndExamPromptView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - 200, DEVICE_WIDTH, 200)];
        }
        
        
        @weakify(self);
        _promptView.cancelButtonClick = ^{
            @strongify(self);
            [self removePromptView];
        };
        _promptView.sureButtonClick = ^(NSIndexPath *index) {
            @strongify(self);
            [self removePromptView];
            //标题
            self.classLabel.text = [NSString stringWithFormat:@"%@",[self.classesList objectAtIndex:index.row]];
        };
    }
    return _promptView;
}

- (UIView *)backGroundView {
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backGroundView.backgroundColor = [UIColor colorWithWhite:.3 alpha:.6];
    }
    return _backGroundView;
}

#pragma mark - 弹出提示框
- (void)addPromptView {
    [[UIApplication sharedApplication].keyWindow addSubview:self.backGroundView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.promptView];
}
- (void)addSurePromptView {
    [[UIApplication sharedApplication].keyWindow addSubview:self.backGroundView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.surePromptView];
    self.surePromptView.center = [UIApplication sharedApplication].keyWindow.center;
}

#pragma mark - 移除提示框
- (void)removePromptView {
    [self.backGroundView removeFromSuperview];
    [self.promptView removeFromSuperview];
}
- (void)removeSurePromptView {
    [self.backGroundView removeFromSuperview];
    [self.surePromptView removeFromSuperview];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.vcType == IJSD_GradeSelectClassViewControllerTypeInput) {
        self.selectClassInputGradeListView.viewType = IJSD_SelectClassInputGradeListViewTypeInput;
    } else {
        self.selectClassInputGradeListView.viewType = IJSD_SelectClassInputGradeListViewTypeLook;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.searchView layerCornerRadius:@8 borderWidth:@.6 borderColor:HEX_COLOR(0x666666)];
    
    NSArray *classesArr = @[@"4年级奥数拓展4-2班", @"4年级奥数拓展4-2班", @"4年级奥数拓展4-2班", @"4年级奥数拓展4-2班", @"4年级奥数拓展4-2班", @"4年级奥数拓展4-2班"];
    
    if (self.vcType == IJSD_GradeSelectClassViewControllerTypeInput) {
        self.selectClassInputGradeListView.viewType = IJSD_SelectClassInputGradeListViewTypeInput;
    } else {
        self.selectClassInputGradeListView.viewType = IJSD_SelectClassInputGradeListViewTypeLook;
    }
    
    self.classesList = [NSArray arrayWithArray:classesArr];
    // Do any additional setup after loading the view.
}

//
- (void)setVcType:(IJSD_GradeSelectClassViewControllerType)vcType {
    _vcType = vcType;
    switch (vcType) {
        case IJSD_GradeSelectClassViewControllerTypeInput:
            self.searchView.hidden = NO;
            self.bottomSureView.hidden = NO;
            self.bottomSureViewHeight.constant = 50;
            self.titleViewTop.constant = 60;
            break;
        case IJSD_GradeSelectClassViewControllerTypeLook:
            self.searchView.hidden = YES;
            self.bottomSureView.hidden = YES;
            self.bottomSureViewHeight.constant = 0;
            self.titleViewTop.constant = 5;
            break;
            
        default:
            break;
    }
}

//返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

//选择班级
- (IBAction)classButtonClick:(id)sender {
    [self addPromptView];
    self.promptView.dataList = self.classesList;
}

//确认录入
- (IBAction)sureInputButtonClick:(id)sender {
    //
    [self addSurePromptView];
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
