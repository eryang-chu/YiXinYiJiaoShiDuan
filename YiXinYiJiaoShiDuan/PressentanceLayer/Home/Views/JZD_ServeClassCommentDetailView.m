//
//  JZD_ServeClassCommentDetailView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ClassCommentDetailTableViewCell.h"
#import "JZD_ServeClassCommentDetailEvaluateTableViewCell.h"
#import "JZD_ServeClassCommentDetailEvaluateContentTableViewCell.h"
#import "JZD_ServeClassCommentDetailView.h"

@interface JZD_ServeClassCommentDetailView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_ServeClassCommentDetailView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ClassCommentDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ClassCommentDetailTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ServeClassCommentDetailEvaluateTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ServeClassCommentDetailEvaluateTableViewCell"];
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

- (void)setDataDict:(NSDictionary *)dataDict {
    _dataDict = dataDict;
    
    [self.tableView reloadData];
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        return 250;
    } else if (indexPath.row == 1) {
        return 230;
    }
    NSString *contentStr = [self.dataDict null_objectForKey:@"CommentStr"];
    CGFloat height = [contentStr labelHeightWithFont:[UIFont systemFontOfSize:16] labelWidth:DEVICE_WIDTH - 12] + 70;
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_ClassCommentDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ClassCommentDetailTableViewCell"];
        @weakify(self);
        cell.contentButtonClick = ^{
            @strongify(self);
            if (self.contentButtonClick) {
                self.contentButtonClick();
            }
        };
        cell.studentLabel.text = [self.dataDict null_objectForKey:@"StudentName"];
        cell.classLabel.text = [self.dataDict null_objectForKey:@"ClassName"];
        cell.teacherLabel.text = [self.dataDict null_objectForKey:@"TeacherName"];
        cell.contentLabel.text = [self.dataDict null_objectForKey:@"ClassContent"];
        return cell;
    } else if (indexPath.row == 1) {
        JZD_ServeClassCommentDetailEvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ServeClassCommentDetailEvaluateTableViewCell"];
        cell.classLabel.text = [NSString stringWithFormat:@"人均：%@     班平：%@", [self.dataDict null_objectForKey:@"ClassAverageWorkScore"] ?: @"", [self.dataDict null_objectForKey:@"PersonAverageWorkScore"] ?: @""];
        cell.workLabel.text = [NSString stringWithFormat:@"人均：%@     班平：%@", [self.dataDict null_objectForKey:@"ClassAverageClassScore"] ?: @"", [self.dataDict null_objectForKey:@"PersonAverageClassScore"] ?: @""];
        cell.workScore = [[self.dataDict null_objectForKey:@"WorkScore"] integerValue];
        cell.classScore = [[self.dataDict null_objectForKey:@"ClassScore"] integerValue];
        
        return cell;
    }
    JZD_ServeClassCommentDetailEvaluateContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ServeClassCommentDetailEvaluateContentTableViewCell"];
    cell.contentLabel.text = [self.dataDict null_objectForKey:@"CommentStr"];
    cell.cellType = JZD_ServeClassCommentDetailEvaluateContentTableViewCellTypeNormal;
    
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
