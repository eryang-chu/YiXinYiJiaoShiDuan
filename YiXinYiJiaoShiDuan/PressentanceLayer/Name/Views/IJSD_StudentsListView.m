//
//  IJSD_StudentsListView.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_StudentsListTableViewCell.h"
#import "IJSD_StudentsListView.h"

@interface IJSD_StudentsListView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation IJSD_StudentsListView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"IJSD_StudentsListTableViewCell" bundle:nil] forCellReuseIdentifier:@"IJSD_StudentsListTableViewCell"];
        
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
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IJSD_StudentsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IJSD_StudentsListTableViewCell"];
    
    @weakify(self);
    cell.chuqinButtonClick = ^{
        @strongify(self);
        if (self.chuqinButtonClickAtIndexPath) {
            self.chuqinButtonClickAtIndexPath(indexPath);
        }
    };
    cell.jifeiButtonClick = ^{
        @strongify(self);
        if (self.jifeiButtonClickAtIndexPath) {
            self.jifeiButtonClickAtIndexPath(indexPath);
        }
    };
    cell.queqinButtonClick = ^{
        @strongify(self);
        if (self.queqinButtonClickAtIndexPath) {
            self.queqinButtonClickAtIndexPath(indexPath);
        }
    };
    cell.phoneButtonClick = ^{
        @strongify(self);
        if (self.phoneButtonClickAtIndexPath) {
            self.phoneButtonClickAtIndexPath(indexPath);
        }
    };
    
    
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
