//
//  JZD_ServeClassComentDetailContentView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeClassCommentDetailEvaluateContentTableViewCell.h"
#import "JZD_ServeClassComentDetailContentView.h"

@interface JZD_ServeClassComentDetailContentView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_ServeClassComentDetailContentView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ServeClassCommentDetailEvaluateContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ServeClassCommentDetailEvaluateContentTableViewCell"];
        
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
    CGFloat height = [self.commentStr labelHeightWithFont:[UIFont systemFontOfSize:16] labelWidth:DEVICE_WIDTH - 24] + 70;
    
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZD_ServeClassCommentDetailEvaluateContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ServeClassCommentDetailEvaluateContentTableViewCell"];
    cell.cellType = JZD_ServeClassCommentDetailEvaluateContentTableViewCellTypeContent;
    cell.contentLabel.text = self.commentStr;
    
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
