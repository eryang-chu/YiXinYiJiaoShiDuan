//
//  IJSD_TeachingPlanListView.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_TeachingPlanListTableViewCell.h"
#import "IJSD_TeachingPlanListView.h"

@interface IJSD_TeachingPlanListView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation IJSD_TeachingPlanListView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"IJSD_TeachingPlanListTableViewCell" bundle:nil] forCellReuseIdentifier:@"IJSD_TeachingPlanListTableViewCell"];
        
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

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IJSD_TeachingPlanListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IJSD_TeachingPlanListTableViewCell"];
    
    @weakify(self);
    cell.downloadButtonClick = ^{
        @strongify(self);
        if (self.downloadButtonClickAtIndexPath) {
            self.downloadButtonClickAtIndexPath(indexPath);
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
