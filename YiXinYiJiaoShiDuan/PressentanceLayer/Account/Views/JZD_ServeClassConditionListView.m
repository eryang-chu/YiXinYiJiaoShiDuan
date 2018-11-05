//
//  JZD_ServeClassConditionListView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeClassConditionListTableViewCell.h"
#import "JZD_ServeClassConditionListView.h"

@interface JZD_ServeClassConditionListView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_ServeClassConditionListView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ServeClassConditionListTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ServeClassConditionListTableViewCell"];
        
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.dataList.count;
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZD_ServeClassConditionListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ServeClassConditionListTableViewCell"];
//    NSDictionary *dict = [self.dataList objectAtIndex:indexPath.row];
//
//    cell.titleLabel.text = [dict null_objectForKey:@"ClassName"];
//    cell.totalClasses.text = [NSString stringWithFormat:@"%@次", [dict null_objectForKey:@"TotalPeriod"]];
//    cell.usedClasses.text = [NSString stringWithFormat:@"%@次", [dict null_objectForKey:@"UserPeriod"]];
//    cell.surplusClasses.text = [NSString stringWithFormat:@"%@次", [dict null_objectForKey:@"SurplusPeriod"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.reportDidSelectAtIndexPath) {
        self.reportDidSelectAtIndexPath(indexPath);
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
