//
//  IJSD_TeachingReportEditView.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_StarView.h"

#import "IJSD_TeachingReportEditListTableViewCell.h"
#import "IJSD_TeachingReportTotalEvaluateTableViewCell.h"
#import "IJSD_TeachingReportEditView.h"

@interface IJSD_TeachingReportEditView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSString *totalEvaluate;
@end

@implementation IJSD_TeachingReportEditView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"IJSD_TeachingReportEditListTableViewCell" bundle:nil] forCellReuseIdentifier:@"IJSD_TeachingReportEditListTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"IJSD_TeachingReportTotalEvaluateTableViewCell" bundle:nil] forCellReuseIdentifier:@"IJSD_TeachingReportTotalEvaluateTableViewCell"];
        
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [_tableView addGestureRecognizer:tapGR];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)tapAction:(id)sender {
    [self endEditing:YES];
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
    if (indexPath.row == self.dataList.count) {
        return 130;
    } else {
        NSDictionary *dict = [self.dataList objectAtIndex:indexPath.row];
        NSString *contentStr = [dict null_objectForKey:@"contentStr"];
        
        CGFloat height = [contentStr labelHeightWithFont:[UIFont systemFontOfSize:13] labelWidth:DEVICE_WIDTH - 24] + 5 + 30 + 30 + 5 + 5;
        return height;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.dataList.count) {
        IJSD_TeachingReportTotalEvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IJSD_TeachingReportTotalEvaluateTableViewCell"];
        @weakify(self);
        cell.textFieldDidChange = ^(UITextField *textfield) {
            @strongify(self);
            self.totalEvaluate = textfield.text ?: @"";
        };
        
        return cell;
    }
    
    IJSD_TeachingReportEditListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IJSD_TeachingReportEditListTableViewCell"];
    
    if (self.viewType == IJSD_TeachingReportEditViewTypeNormal) {
        cell.cellType = IJSD_TeachingReportEditListTableViewCellTypeNormal;
    } else {
        cell.cellType = IJSD_TeachingReportEditListTableViewCellTypeEdit;
    }
    
    NSDictionary *dict = [self.dataList objectAtIndex:indexPath.row];
    cell.classStarView.score = [[dict null_objectForKey:@"classScore"] integerValue];
    cell.workStarView.score = [[dict null_objectForKey:@"workScore"] integerValue];
    cell.dateLabel.text = [dict null_objectForKey:@"date"] ?: @"";
    cell.timesLabel.text = [NSString stringWithFormat:@"第%@次课", [dict null_objectForKey:@"times"]];
    cell.contentLabel.text = [dict null_objectForKey:@"contentStr"] ?: @"";
    cell.editTextField.text = [dict null_objectForKey:@"contentStr"] ?: @"";
    
    @weakify(self);
    cell.textFieldDidChange = ^(UITextField *textfield) {
        @strongify(self);
    };

    cell.editButtonClick = ^{
        @strongify(self);
    };
    
    cell.deleteButtonClick = ^{
        @strongify(self);
        if (self.deleteButtonAtIndexPath) {
            self.deleteButtonAtIndexPath(indexPath);
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
