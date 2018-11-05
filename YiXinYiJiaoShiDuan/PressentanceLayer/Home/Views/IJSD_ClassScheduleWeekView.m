//
//  IJSD_ClassScheduleWeekView.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_ClassScheduleWeekTableViewCell.h"
#import "IJSD_ClassScheduleWeekNoTableViewCell.h"
#import "IJSD_ClassScheduleWeekView.h"

@interface IJSD_ClassScheduleWeekView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation IJSD_ClassScheduleWeekView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"IJSD_ClassScheduleWeekTableViewCell" bundle:nil] forCellReuseIdentifier:@"IJSD_ClassScheduleWeekTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"IJSD_ClassScheduleWeekNoTableViewCell" bundle:nil] forCellReuseIdentifier:@"IJSD_ClassScheduleWeekNoTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
}

- (void)reloadData {
    [self.tableView reloadData];
}

- (void)setDataList:(NSArray *)dataList {
    _dataList = dataList;
    
    [self.tableView reloadData];
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSDictionary *dict = [self.dataList objectAtIndex:section];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 35)];
    headerView.backgroundColor = HEX_COLOR(0xf2f2f2);
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 80, 35)];
    titleLabel.font = [UIFont systemFontOfSize:13];
    titleLabel.textColor = HEX_COLOR(0x333333);
    titleLabel.text = [dict null_objectForKey:@"weekday"];
    [headerView addSubview:titleLabel];
    
    UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake(DEVICE_WIDTH - 132, 0, 120, 35)];
    subLabel.font = [UIFont systemFontOfSize:13];
    subLabel.textColor = HEX_COLOR(0x333333);
    subLabel.text = [dict null_objectForKey:@"date"];
    subLabel.textAlignment = NSTextAlignmentRight;
    [headerView addSubview:subLabel];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = [self.dataList objectAtIndex:indexPath.section];
    NSArray *arr = [dict null_objectForKey:@"list"];
    if (!arr.count) {
        return 30;
    }
    return 75;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dict = [self.dataList objectAtIndex:section];
    NSArray *arr = [dict null_objectForKey:@"list"];
    if (arr.count == 0) {
        return 1;
    }
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = [self.dataList objectAtIndex:indexPath.section];
    NSArray *arr = [dict null_objectForKey:@"list"];
    
    if (!arr.count) {
        IJSD_ClassScheduleWeekNoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IJSD_ClassScheduleWeekNoTableViewCell"];
        
        return cell;
    } else {
        IJSD_ClassScheduleWeekTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IJSD_ClassScheduleWeekTableViewCell"];
        
        NSDictionary *dictionary = [arr objectAtIndex:indexPath.row];
        cell.titleLabel.text = [dictionary null_objectForKey:@"title"];
        cell.statusLabel.text = [dictionary null_objectForKey:@"status"];
        cell.campusLabel.text = [dictionary null_objectForKey:@"campus"];
        cell.classroomLabel.text = [dictionary null_objectForKey:@"classroom"];
        cell.timeLabel.text = [dictionary null_objectForKey:@"time"];
        cell.numberLabel.text = [dictionary null_objectForKey:@"number"];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellDidSelectAtIndexPath) {
        self.cellDidSelectAtIndexPath(indexPath);
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
