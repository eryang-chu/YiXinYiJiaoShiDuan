//
//  IJSD_AddStudentsListView.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/3.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_AddStudentsListTableViewCell.h"
#import "IJSD_AddStudentsListView.h"

@interface IJSD_AddStudentsListView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) IJSD_AddStudentsListTableViewCell *selectCell;
@end

@implementation IJSD_AddStudentsListView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"IJSD_AddStudentsListTableViewCell" bundle:nil] forCellReuseIdentifier:@"IJSD_AddStudentsListTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IJSD_AddStudentsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IJSD_AddStudentsListTableViewCell"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectCell) {
        self.selectCell.selected = NO;
    }
    
    IJSD_AddStudentsListTableViewCell *cell = (IJSD_AddStudentsListTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    self.selectCell = cell;
    cell.selected = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
