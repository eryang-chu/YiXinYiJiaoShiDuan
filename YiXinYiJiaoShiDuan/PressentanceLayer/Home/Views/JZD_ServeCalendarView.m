//
//  JZD_ServeCalendarView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/13.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeCalendarCollectionViewCell.h"
#import "JZD_ServeCalendarView.h"

#define itemWidth DEVICE_WIDTH / 7.f
#define itemHeight 50

@interface JZD_ServeCalendarView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSMutableArray *dateListM;
//@property (nonatomic, assign) NSInteger currentDay;
@end

@implementation JZD_ServeCalendarView

- (NSMutableArray *)dateListM {
    if (!_dateListM) {
        _dateListM = [NSMutableArray arrayWithCapacity:0];
    }
    return _dateListM;
}

- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.userInteractionEnabled = YES;
        _collectionView.contentSize = CGSizeMake(_collectionView.frame.size.width, _collectionView.frame.size.height);
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"JZD_ServeCalendarCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"JZD_ServeCalendarCollectionViewCell"];
    }
    
    return _collectionView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self addSubview:self.collectionView];
    [self addCollectionViewConstraints];
}

- (void)setDataList:(NSArray *)dataList {
    _dataList = dataList;

    [self.dateListM removeAllObjects];
    
    for (int i = 0; i < self.firstday; i++) {
        [self.dateListM addObject:@""];
    }
    
    [self.dateListM addObjectsFromArray:dataList];

    [self.collectionView reloadData];
}

- (void)setTableList:(NSArray *)tableList {
    _tableList = tableList;
    
    [self.collectionView reloadData];
}

- (void)addCollectionViewConstraints{
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeTop          relatedBy:
                         NSLayoutRelationEqual
                                                        toItem:self.collectionView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeTrailing          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeLeading          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeBottom          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
}

#pragma mark - collectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.dateListM.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    JZD_ServeCalendarCollectionViewCell * collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JZD_ServeCalendarCollectionViewCell" forIndexPath:indexPath];
    
    NSDate *date = nil;
    if (indexPath.row < self.firstday) {
        collectionViewCell.hidden = YES;
    } else {
        collectionViewCell.hidden = NO;
        date = [self.dateListM objectAtIndex:indexPath.row];
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString * string = [formatter stringFromDate:date];
        if ([string isEqualToString:self.currentDate]) {
            collectionViewCell.cellType = JZD_ServeCalendarCollectionViewCellTypeToday;
        } else {
            collectionViewCell.cellType = JZD_ServeCalendarCollectionViewCellTypeNormal;
        }
        
        for (NSDictionary *dict in self.tableList) {
            NSString *tableString = [dict null_objectForKey:@"OpenDate"];
            NSArray *tableArray = [tableString componentsSeparatedByString:@" "];
            NSString *tableStr = [tableArray firstObject];
            if ([tableStr isEqualToString:string]) {
                NSNumber *status = [dict null_objectForKey:@"Status"];
                if (status.integerValue == 0) {
                    collectionViewCell.cellType = JZD_ServeCalendarCollectionViewCellTypecampus;
                } else if (status.integerValue == 3) {
                    collectionViewCell.cellType = JZD_ServeCalendarCollectionViewCellTypeLeave;
                }
            }
        }
        
        NSArray *arrar = [string componentsSeparatedByString:@"-"];
        collectionViewCell.contentLabel.text = [arrar objectAtIndex:2];
    }
    
    return collectionViewCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(itemWidth, itemHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDate *date = [self.dateListM objectAtIndex:indexPath.row];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString * string = [formatter stringFromDate:date];
    if (self.cellDidSelectedAtIndex) {
        self.cellDidSelectedAtIndex(string);
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
