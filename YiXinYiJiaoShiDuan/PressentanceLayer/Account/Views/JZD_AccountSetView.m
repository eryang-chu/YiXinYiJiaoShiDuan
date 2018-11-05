//
//  JZD_AccountSetView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountBabyInfoTableViewCell.h"
#import "JZD_AccountSetView.h"

@interface JZD_AccountSetView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_AccountSetView

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_AccountBabyInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_AccountBabyInfoTableViewCell"];
        
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
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZD_AccountBabyInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_AccountBabyInfoTableViewCell"];
    if (indexPath.row == 4) {
        cell.cellType = JZD_AccountBabyInfoTableViewCellTypeAccountSet;
    } else {
        cell.cellType = JZD_AccountBabyInfoTableViewCellTypeNextNoLabel;
    }
    
    if (!indexPath.row) {
        cell.titleLabel.text = @"修改密码";
    } else if (indexPath.row == 1) {
        cell.titleLabel.text = @"关于我们";
    } else if (indexPath.row == 2) {
        cell.titleLabel.text = @"清除缓存";
    } else if (indexPath.row == 3) {
        cell.titleLabel.text = @"退出登录";
    } else {
        cell.titleLabel.text = @"当前版本";
        cell.contentLabel.text = @"1.0.0";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellDidSelectedAtIndex) {
        self.cellDidSelectedAtIndex(indexPath);
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
