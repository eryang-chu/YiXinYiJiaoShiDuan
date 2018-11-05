//
//  IJSD_SelectClassInputGradeListView.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_GradeStudentListTableViewCell.h"
#import "IJSD_SelectClassInputGradeListView.h"

@interface IJSD_SelectClassInputGradeListView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *footerView;
@end

@implementation IJSD_SelectClassInputGradeListView

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 38)];
        
        UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, DEVICE_WIDTH - 24, 38)];
        footerLabel.text = @"如有学生缺考，成绩不填即可";
        footerLabel.font = [UIFont systemFontOfSize:13];
        footerLabel.textColor = HEX_COLOR(0x333333);
        [_footerView addSubview:footerLabel];
    }
    return _footerView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = self.footerView;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"IJSD_GradeStudentListTableViewCell" bundle:nil] forCellReuseIdentifier:@"IJSD_GradeStudentListTableViewCell"];
        
//        _tableView.tableFooterView = [UIView new];
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

- (void)setViewType:(IJSD_SelectClassInputGradeListViewType)viewType {
    _viewType = viewType;
    if (viewType == IJSD_SelectClassInputGradeListViewTypeInput) {
        self.tableView.tableFooterView = self.footerView;
    } else {
        self.tableView.tableFooterView = [UIView new];
    }
    [self.tableView reloadData];
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.dataList.count;
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IJSD_GradeStudentListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IJSD_GradeStudentListTableViewCell"];
    if (self.viewType == IJSD_SelectClassInputGradeListViewTypeInput) {
        cell.cellType = IJSD_GradeStudentListTableViewCellTypeInput;
    } else {
        cell.cellType = IJSD_GradeStudentListTableViewCellTypeLook;
    }
    @weakify(self);
    cell.textFieldDidChange = ^(UITextField *textfield) {
        @strongify(self);
        if (self.returnGradeWithIndexPath) {
            self.returnGradeWithIndexPath(indexPath, textfield.text);
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
