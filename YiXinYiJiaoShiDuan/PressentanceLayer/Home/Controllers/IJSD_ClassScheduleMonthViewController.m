//
//  IJSD_ClassScheduleMonthViewController.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeCalendarView.h"
#import "IJSD_ClassScheduleMonthListView.h"

#import "IJSD_ClassScheduleWeekViewController.h"
#import "IJSD_ClassScheduleMonthViewController.h"

@interface IJSD_ClassScheduleMonthViewController ()
@property (weak, nonatomic) IBOutlet UIButton *lastMonthButton;
@property (weak, nonatomic) IBOutlet UIButton *monthButton;
@property (weak, nonatomic) IBOutlet UIButton *nextMonthButton;
@property (weak, nonatomic) IBOutlet JZD_ServeCalendarView *serveCalendarView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serveCalendarViewHeight;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet IJSD_ClassScheduleMonthListView *classScheduleMonthListView;

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) NSString *currentDate;
@property (nonatomic, assign) NSInteger firstDay;

@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, strong) NSString *endDate;

@property (nonatomic, strong) NSMutableArray *dataListM;
@property (nonatomic, strong) NSArray *dataList;//课表
@property (nonatomic, strong) NSArray *studentClassList;//某一天的课表

@end

@implementation IJSD_ClassScheduleMonthViewController

- (NSMutableArray *)dataListM {
    if (!_dataListM) {
        _dataListM = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataListM;
}

#pragma mark - 移除周课表视图控制器
- (void)removeClassScheduleWeekViewController {
    NSMutableArray *vcArrM = [NSMutableArray arrayWithCapacity:0];
    [vcArrM addObjectsFromArray:self.navigationController.viewControllers];
    for (UIViewController *temp in vcArrM) {
        if ([temp isKindOfClass:[IJSD_ClassScheduleWeekViewController class]]) {
            [vcArrM removeObject:temp];
            break;
        }
    }
    
    self.navigationController.viewControllers = vcArrM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self removeClassScheduleWeekViewController];
    
    [self.lastMonthButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.monthButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.nextMonthButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    
    self.lastMonthButton.selected = NO;
    self.monthButton.selected = YES;
    self.nextMonthButton.selected = NO;
    
    self.date = [NSDate date];
    self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.currentDate = [formatter stringFromDate:[NSDate date]];
    
//    @weakify(self);
    self.serveCalendarView.cellDidSelectedAtIndex = ^(NSString *date) {
//        @strongify(self);//选择日期
//        @weakify(self);
//        //获取某一天的课表
//        [JZD_ServeApi getStudentClassByDayWithStudentId:@"" date:date success:^(NSArray *dataList) {
//            @strongify(self);
//            self.studentClassList = [NSArray arrayWithArray:dataList];
//            self.serveTimeTableView.studentClassList = dataList;
//        } failure:^{
//
//        }];
    };
    
    [self getAllDaysWithCalender];
    
    self.serveCalendarView.firstday = self.firstDay;
    self.serveCalendarView.currentDate = self.currentDate;
    self.serveCalendarView.dataList = self.dataListM;
    
    if ((self.firstDay + self.dataListM.count) % 7) {
        self.serveCalendarViewHeight.constant = 50 * ((self.firstDay + self.dataListM.count) / 7 + 1);
    } else {
        self.serveCalendarViewHeight.constant = 50 * ((self.firstDay + self.dataListM.count) / 7);
    }
    
    
    NSString *nowString = [formatter stringFromDate:self.date];
    NSArray *nowArray = [nowString componentsSeparatedByString:@"-"];
    self.monthLabel.text = [NSString stringWithFormat:@"%@月", [nowArray objectAtIndex:1]];
    
    [self getStartDateAndEndDate];
    
    @weakify(self);
    self.classScheduleMonthListView.numberButtonClickAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);//
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_ClassScheduleClassNumberViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    // Do any additional setup after loading the view.
}

//返回
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

//按周
- (IBAction)changeWeekButtonClick:(id)sender {
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"IJSD_ClassScheduleWeekViewController"];
    [self setHidesBottomBarWhenPushed:YES];
}

//上月
- (IBAction)lastMonthButtonClick:(id)sender {
    if (!self.lastMonthButton.selected) {
        self.lastMonthButton.selected = YES;
        self.lastMonthButton.backgroundColor = SYSTEM_RED_COLOR;
        [self.lastMonthButton setTitleColor:HEX_COLOR(0xffffff) forState:UIControlStateNormal];
        
        self.monthButton.selected = NO;
        self.monthButton.backgroundColor = HEX_COLOR(0xf2f2f2);
        [self.monthButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
        
        self.nextMonthButton.selected = NO;
        self.nextMonthButton.backgroundColor = HEX_COLOR(0xf2f2f2);
        [self.nextMonthButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    }
}

//本月
- (IBAction)monthButtonClick:(id)sender {
    if (!self.monthButton.selected) {
        self.monthButton.selected = YES;
        self.monthButton.backgroundColor = SYSTEM_RED_COLOR;
        [self.monthButton setTitleColor:HEX_COLOR(0xffffff) forState:UIControlStateNormal];
        
        self.lastMonthButton.selected = NO;
        self.lastMonthButton.backgroundColor = HEX_COLOR(0xf2f2f2);
        [self.lastMonthButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
        
        self.nextMonthButton.selected = NO;
        self.nextMonthButton.backgroundColor = HEX_COLOR(0xf2f2f2);
        [self.nextMonthButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    }
}

//下月
- (IBAction)nextMonthButtonClick:(id)sender {
    if (!self.nextMonthButton.selected) {
        self.nextMonthButton.selected = YES;
        self.nextMonthButton.backgroundColor = SYSTEM_RED_COLOR;
        [self.nextMonthButton setTitleColor:HEX_COLOR(0xffffff) forState:UIControlStateNormal];
        
        self.lastMonthButton.selected = NO;
        self.lastMonthButton.backgroundColor = HEX_COLOR(0xf2f2f2);
        [self.lastMonthButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
        
        self.monthButton.selected = NO;
        self.monthButton.backgroundColor = HEX_COLOR(0xf2f2f2);
        [self.monthButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    }
}

//上个月
- (IBAction)lastMonthImageClick:(id)sender {
    NSLog(@"上个月");
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSString *currentMonth = [formatter stringFromDate:self.date];
    NSArray *monthArr = [currentMonth componentsSeparatedByString:@"-"];
    NSMutableArray *monthArrM = [NSMutableArray arrayWithArray:monthArr];
    NSString *monthString = [monthArrM objectAtIndex:1];
    NSString *yearString = [monthArrM objectAtIndex:0];
    NSString *lastStr = nil;
    if (monthString.integerValue == 1) {
        NSString *monthString2 = @"12";
        NSString *yearString2 = [NSString stringWithFormat:@"%ld", yearString.integerValue - 1];
        [monthArrM replaceObjectAtIndex:1 withObject:monthString2];
        [monthArrM replaceObjectAtIndex:0 withObject:yearString2];
        lastStr = [monthArrM componentsJoinedByString:@"-"];
    } else {
        NSString *monthString2 = [NSString stringWithFormat:@"%ld", monthString.integerValue - 1];
        [monthArrM replaceObjectAtIndex:1 withObject:monthString2];
        lastStr = [monthArrM componentsJoinedByString:@"-"];
    }
    
    
    NSDate *lastDate = [formatter dateFromString:lastStr];
    self.date = lastDate;
    [self getAllDaysWithCalender];
    
    if ((self.firstDay + self.dataListM.count) % 7) {
        self.serveCalendarViewHeight.constant = 50 * ((self.firstDay + self.dataListM.count) / 7 + 1);
    } else {
        self.serveCalendarViewHeight.constant = 50 * ((self.firstDay + self.dataListM.count) / 7);
    }
    
    self.serveCalendarView.firstday = self.firstDay;
    self.serveCalendarView.dataList = self.dataListM;
    
    
    NSString *nowString = [formatter stringFromDate:self.date];
    NSArray *nowArray = [nowString componentsSeparatedByString:@"-"];
    self.monthLabel.text = [NSString stringWithFormat:@"%@月", [nowArray objectAtIndex:1]];
    
    [self getStartDateAndEndDate];
//    [self getCourseTable];
}

//下个月
- (IBAction)nextMonthImageClick:(id)sender {
    NSLog(@"下个月");
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSString *currentMonth = [formatter stringFromDate:self.date];
    NSArray *monthArr = [currentMonth componentsSeparatedByString:@"-"];
    NSMutableArray *monthArrM = [NSMutableArray arrayWithArray:monthArr];
    NSString *monthString = [monthArrM objectAtIndex:1];
    NSString *yearString = [monthArrM objectAtIndex:0];
    
    NSString *nextStr = nil;
    if (monthString.integerValue == 12) {
        NSString *monthString2 = @"1";
        NSString *yearString2 = [NSString stringWithFormat:@"%ld", yearString.integerValue + 1];
        [monthArrM replaceObjectAtIndex:1 withObject:monthString2];
        [monthArrM replaceObjectAtIndex:0 withObject:yearString2];
        nextStr = [monthArrM componentsJoinedByString:@"-"];
    } else {
        NSString *nextString = [NSString stringWithFormat:@"%ld", monthString.integerValue + 1];
        [monthArrM replaceObjectAtIndex:1 withObject:nextString];
        nextStr = [monthArrM componentsJoinedByString:@"-"];
    }
    
    NSDate *nextDate = [formatter dateFromString:nextStr];
    self.date = nextDate;
    [self getAllDaysWithCalender];
    
    if ((self.firstDay + self.dataListM.count) % 7) {
        self.serveCalendarViewHeight.constant = 50 * ((self.firstDay + self.dataListM.count) / 7 + 1);
    } else {
        self.serveCalendarViewHeight.constant = 50 * ((self.firstDay + self.dataListM.count) / 7);
    }
    
    self.serveCalendarView.firstday = self.firstDay;
    self.serveCalendarView.dataList = self.dataListM;
    
    NSString *nowString = [formatter stringFromDate:self.date];
    NSArray *nowArray = [nowString componentsSeparatedByString:@"-"];
    self.monthLabel.text = [NSString stringWithFormat:@"%@月", [nowArray objectAtIndex:1]];
    
    [self getStartDateAndEndDate];
//    [self getCourseTable];
}

//当与开始时间和结束时间
- (void)getStartDateAndEndDate {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate = [self.dataListM firstObject];
    NSString *start = [formatter stringFromDate:startDate];
    NSArray *startArr = [start componentsSeparatedByString:@" "];
    self.startDate = [startArr firstObject];
    
    
    NSDate *endDate = [self.dataListM lastObject];
    NSString *endStr = [formatter stringFromDate:endDate];
    NSArray *endArr = [endStr componentsSeparatedByString:@" "];
    self.endDate = [endArr firstObject];
}

// 获取当月的天数
- (NSInteger)getNumberOfDaysInMonth{
    // NSRange是一个结构体，其中location是一个以0为开始的index，length是表示对象的长度。他们都是NSUInteger类型。
    NSRange range = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self.date];
    NSUInteger numberOfDaysInMonth = range.length;
    return numberOfDaysInMonth;
}
// 获取当月中所有天数
- (void) getAllDaysWithCalender{
    [self.dataListM removeAllObjects];
    
    NSUInteger dayCount = [self getNumberOfDaysInMonth];//一个月的总天数
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSString * str = [formatter stringFromDate:self.date];
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    for (NSInteger i = 1; i <= dayCount; i++) {
        NSString * sr = [NSString stringWithFormat:@"%@-%ld",str,i];
        
        NSDate *suDate = [formatter dateFromString:sr];
        
        if (i == 1) {
            self.firstDay = [self getweekDayWithDate:suDate];
        }
        [self.dataListM addObject:suDate];
    }
}

- (NSInteger)getweekDayWithDate:(NSDate *) date{
    // 指定日历的算法
    NSDateComponents *comps = [self.calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:date];
    
    // 直接调用自己weekDay属性
    NSInteger weekday = [comps weekday];
    
    weekday--;
    NSLog(@"[comps weekday] = %ld",(long)weekday);
    if (weekday == 7) {
        return 0;
    }else
        return weekday;
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
