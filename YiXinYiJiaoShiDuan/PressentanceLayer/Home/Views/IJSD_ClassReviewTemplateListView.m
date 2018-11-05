//
//  IJSD_ClassReviewTemplateListView.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_ClassReviewTemplateTableViewCell.h"
#import "IJSD_ClassReviewTemplateListView.h"

@interface IJSD_ClassReviewTemplateListView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) IJSD_ClassReviewTemplateTableViewCell *selectCell;
@end

@implementation IJSD_ClassReviewTemplateListView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"IJSD_ClassReviewTemplateTableViewCell" bundle:nil] forCellReuseIdentifier:@"IJSD_ClassReviewTemplateTableViewCell"];
        
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *content = [self.dataList objectAtIndex:indexPath.row];
    CGFloat height = [content labelHeightWithFont:[UIFont systemFontOfSize:16] labelWidth:DEVICE_WIDTH - 40] + 8 * 2 +6 * 2;
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IJSD_ClassReviewTemplateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IJSD_ClassReviewTemplateTableViewCell"];
    
    cell.contentLabel.text = [self.dataList objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    IJSD_ClassReviewTemplateTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (self.selectCell) {
        self.selectCell.selected = NO;
    }
    self.selectCell = cell;
    self.selectCell.selected = YES;
    
    if (self.cellDidSelectAtIndexPath) {
        self.cellDidSelectAtIndexPath(indexPath);
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
