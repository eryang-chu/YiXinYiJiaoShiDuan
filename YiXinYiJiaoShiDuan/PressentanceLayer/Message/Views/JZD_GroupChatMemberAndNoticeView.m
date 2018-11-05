//
//  JZD_GroupChatMemberAndNoticeView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_GroupChatMemberTableViewCell.h"
#import "JZD_GroupChatMemberNoticeTableViewCell.h"
#import "JZD_GroupChatMemberAndNoticeView.h"

@interface JZD_GroupChatMemberAndNoticeView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_GroupChatMemberAndNoticeView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_GroupChatMemberTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_GroupChatMemberTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_GroupChatMemberNoticeTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_GroupChatMemberNoticeTableViewCell"];
        
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
    if (!indexPath.row) {
        return 400;
    }
    return 165;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_GroupChatMemberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_GroupChatMemberTableViewCell"];
        
        @weakify(self);
        cell.moreButtonClick = ^{
            @strongify(self);
            if (self.moreButtonClick) {
                self.moreButtonClick();
            }
        };
        cell.cellDidSelectAtIndexPath = ^(NSIndexPath *index) {
            @strongify(self);
            if (self.memberDidSelectAtIndexPath) {
                self.memberDidSelectAtIndexPath(index);
            }
        };
        
        return cell;
    }
    JZD_GroupChatMemberNoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_GroupChatMemberNoticeTableViewCell"];
    
    @weakify(self);
    cell.noticeButtonClick = ^{
        @strongify(self);
        if (self.noticeButtonClick) {
            self.noticeButtonClick();
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
