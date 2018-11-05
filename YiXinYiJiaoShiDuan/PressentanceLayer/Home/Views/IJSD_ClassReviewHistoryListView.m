//
//  IJSD_ClassReviewHistoryListView.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_ClassReviewHistoryListTableViewCell.h"
#import "IJSD_ClassReviewHistoryListView.h"

@interface IJSD_ClassReviewHistoryListView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation IJSD_ClassReviewHistoryListView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"IJSD_ClassReviewHistoryListTableViewCell" bundle:nil] forCellReuseIdentifier:@"IJSD_ClassReviewHistoryListTableViewCell"];
        
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IJSD_ClassReviewHistoryListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IJSD_ClassReviewHistoryListTableViewCell"];
    
    return cell;
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
