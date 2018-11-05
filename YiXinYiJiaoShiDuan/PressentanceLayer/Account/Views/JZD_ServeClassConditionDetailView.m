//
//  JZD_ServeClassConditionDetailView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_AccountFeedbackDetailTableViewCell.h"
#import "JZD_ServeClassConditionDetailView.h"

@interface JZD_ServeClassConditionDetailView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_ServeClassConditionDetailView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"IJSD_AccountFeedbackDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"IJSD_AccountFeedbackDetailTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.dataList.count;
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IJSD_AccountFeedbackDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IJSD_AccountFeedbackDetailTableViewCell"];
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (!section) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 40)];
        headerView.backgroundColor = HEX_COLOR(0xf2f2f2);

        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, DEVICE_WIDTH - 24, 40)];
        titleLabel.text = @"2018年6月";
        titleLabel.textColor = HEX_COLOR(0x333333);
        titleLabel.font = [UIFont systemFontOfSize:16];
        [headerView addSubview:titleLabel];
        return headerView;
    }
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 40)];
    headerView.backgroundColor = HEX_COLOR(0xf2f2f2);
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, DEVICE_WIDTH - 24, 40)];
    titleLabel.text = @"2018年6月";
    titleLabel.textColor = HEX_COLOR(0x333333);
    titleLabel.font = [UIFont systemFontOfSize:16];
    [headerView addSubview:titleLabel];
    return headerView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
