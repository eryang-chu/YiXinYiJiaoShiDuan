//
//  IJSD_HomeView.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//
#import "JZD_HomeCourseTableViewCell.h"

#import "IJXF_AdvertisingView.h"
#import "IJSD_HomeView.h"

@interface IJSD_HomeView () <UITableViewDelegate, UITableViewDataSource, advertisingViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) IJXF_AdvertisingView *advertisingView;
@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) NSMutableArray *bannerArrM;
@end

@implementation IJSD_HomeView
- (NSMutableArray *)bannerArrM {
    if (!_bannerArrM) {
        _bannerArrM = [NSMutableArray arrayWithCapacity:0];
    }
    return _bannerArrM;
}

- (IJXF_AdvertisingView *)advertisingView {
    if (!_advertisingView) {
        _advertisingView = [[IJXF_AdvertisingView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 170)];
        _advertisingView.delegate = self;
    }
    return _advertisingView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.advertisingView;
//        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_HomeCourseTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_HomeCourseTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self addSubview:self.tableView];
}

- (void)setBannerList:(NSArray *)bannerList {
    _bannerList = bannerList;
    [self.bannerArrM removeAllObjects];

    for (NSString *imageUrl in bannerList) {
        [self.bannerArrM addObject:imageUrl];
    }

    [self.advertisingView _loadDataWithUrlArray:self.bannerArrM targetView:self];
    [self.advertisingView _startAnimation];
    
    [self.tableView reloadData];
}

- (void)setCourseList:(NSArray *)courseList {
    _courseList = courseList;
    
    [self.tableView reloadData];
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.courseList.count > 4) {
        return 220;
    }
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZD_HomeCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_HomeCourseTableViewCell"];
    cell.subjectList = self.courseList;
    
    @weakify(self);
    cell.cellDidSelectedAtIndex = ^(NSIndexPath *index) {
        @strongify(self);
        if (self.courseCellDidSelectedAtIndexPath) {
            self.courseCellDidSelectedAtIndexPath(index);
        }
    };
    
    return cell;
}

#pragma mark - advertisingViewDelegate
- (void)advertisingView:(IJXF_AdvertisingView *)view clickImageIndex:(NSInteger)index {
    if (self.advertisingDidSelectAtIndexPath) {
        self.advertisingDidSelectAtIndexPath(index);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
