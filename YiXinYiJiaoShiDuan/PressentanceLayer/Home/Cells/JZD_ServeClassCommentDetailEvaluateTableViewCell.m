//
//  JZD_ServeClassCommentDetailEvaluateTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_StarView.h"
#import "JZD_ServeClassCommentDetailEvaluateTableViewCell.h"

@interface JZD_ServeClassCommentDetailEvaluateTableViewCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *workStarWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *classStarWidth;
@property (weak, nonatomic) IBOutlet JZD_StarView *classStarView;
@property (weak, nonatomic) IBOutlet JZD_StarView *workStarView;
@end

@implementation JZD_ServeClassCommentDetailEvaluateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    self.classStarWidth.constant = DEVICE_WIDTH / 2.f - 80;
//    self.workStarWidth.constant = DEVICE_WIDTH / 2.f - 80;
    // Initialization code
}

- (void)setWorkScore:(NSInteger)workScore {
    self.workStarView.score = workScore;
}
- (void)setClassScore:(NSInteger)classScore {
    self.classStarView.score = classScore;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
