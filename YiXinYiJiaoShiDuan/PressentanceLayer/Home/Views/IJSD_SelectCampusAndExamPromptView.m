//
//  IJSD_SelectCampusAndExamPromptView.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_SelectCampusAndExamPromptTableViewCell.h"
#import "IJSD_SelectCampusAndExamPromptView.h"

@interface IJSD_SelectCampusAndExamPromptView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *index;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) IJSD_SelectCampusAndExamPromptTableViewCell *selectCell;
@end

@implementation IJSD_SelectCampusAndExamPromptView

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 50)];
        _headerView.backgroundColor = [UIColor whiteColor];
        
        UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 49)];
        cancel.titleLabel.font = [UIFont systemFontOfSize:16];
        [cancel setTitle:@"取消" forState:UIControlStateNormal];
        [cancel setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
        [cancel addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:cancel];
        
        UIButton *sure = [[UIButton alloc] initWithFrame:CGRectMake(DEVICE_WIDTH - 60, 0, 60, 49)];
        sure.titleLabel.font = [UIFont systemFontOfSize:16];
        [sure setTitle:@"确认" forState:UIControlStateNormal];
        [sure setTitleColor:SYSTEM_RED_COLOR forState:UIControlStateNormal];
        [sure addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:sure];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 49, DEVICE_WIDTH, 1)];
        lineView.backgroundColor = HEX_COLOR(0xf2f2f2);
        [_headerView addSubview:lineView];
    }
    return _headerView;
}

- (void)cancelButtonClick:(id)sender {
    if (self.cancelButtonClick) {
        self.cancelButtonClick();
    }
}
- (void)sureButtonClick:(id)sender {
    if (self.sureButtonClick) {
        self.sureButtonClick(self.index);
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"IJSD_SelectCampusAndExamPromptTableViewCell" bundle:nil] forCellReuseIdentifier:@"IJSD_SelectCampusAndExamPromptTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
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

#pragma mark - TableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IJSD_SelectCampusAndExamPromptTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IJSD_SelectCampusAndExamPromptTableViewCell"];
    
    cell.titleLabel.text = [self.dataList objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectCell) {
        self.selectCell.selected = NO;
    }
    
    IJSD_SelectCampusAndExamPromptTableViewCell *cell = (IJSD_SelectCampusAndExamPromptTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    self.selectCell = cell;
    cell.selected = YES;
    
    self.index = indexPath;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
