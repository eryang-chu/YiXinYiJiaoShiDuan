//
//  JZD_HomeCourseCollectionView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeCourseCollectionViewCell.h"
#import "JZD_HomeCourseCollectionView.h"

#define itemWidth 80
#define itemHeight 100
@interface JZD_HomeCourseCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;

@end

@implementation JZD_HomeCourseCollectionView

- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumInteritemSpacing = 10;
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
        
        [_collectionView registerNib:[UINib nibWithNibName:@"JZD_HomeCourseCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"JZD_HomeCourseCollectionViewCell"];
    }
    
    return _collectionView;
}

- (void)setCoursesList:(NSArray *)coursesList {
    _coursesList = coursesList;
    
    [self.collectionView reloadData];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.collectionView];
    [self addCollectionViewConstraints];
}

- (void)addCollectionViewConstraints{
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeTop          relatedBy:
                         NSLayoutRelationEqual
                                                        toItem:self.collectionView attribute:NSLayoutAttributeTop multiplier:1 constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeTrailing          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeTrailing multiplier:1 constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeLeading          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeLeading multiplier:1 constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeBottom          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeBottom multiplier:1 constant:10]];
}

#pragma mark - collectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.coursesList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JZD_HomeCourseCollectionViewCell * collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JZD_HomeCourseCollectionViewCell" forIndexPath:indexPath];
    NSDictionary *dict = [self.coursesList objectAtIndex:indexPath.row];
//    [collectionViewCell.courseImage sd_setImageWithURL:[NSURL URLWithString:[dict null_objectForKey:@"ImgUrl"]] placeholderImage:[UIImage imageNamed:@"ic_yuwen"]];
    collectionViewCell.courseImage.image = [UIImage imageNamed:[dict null_objectForKey:@"image"]];
//    collectionViewCell.courseName.text = dict[@"Name"];
    collectionViewCell.courseName.text = dict[@"name"];
    return collectionViewCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(itemWidth, itemHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
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
