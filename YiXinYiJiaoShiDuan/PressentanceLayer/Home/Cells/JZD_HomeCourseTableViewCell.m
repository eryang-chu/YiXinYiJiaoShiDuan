//
//  JZD_HomeCourseTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeCourseCollectionView.h"
#import "JZD_HomeCourseTableViewCell.h"

@interface JZD_HomeCourseTableViewCell ()
@property (weak, nonatomic) IBOutlet JZD_HomeCourseCollectionView *homeCourseCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeight;
@property (weak, nonatomic) IBOutlet UIView *rollView;
@end

@implementation JZD_HomeCourseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.collectionViewHeight.constant = 120;
    
    
    
    @weakify(self);
    self.homeCourseCollectionView.cellDidSelectedAtIndex = ^(NSIndexPath *index) {
        @strongify(self);
        if (self.cellDidSelectedAtIndex) {
            self.cellDidSelectedAtIndex(index);
        }
    };
    
    // Initialization code
}

- (void)setSubjectList:(NSArray *)subjectList {
    _subjectList = subjectList;
    if (subjectList.count > 4) {
        self.collectionViewHeight.constant = 100 *2 + 20;
    } else {
        self.collectionViewHeight.constant = 120;
    }
    
    self.homeCourseCollectionView.coursesList = subjectList;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
