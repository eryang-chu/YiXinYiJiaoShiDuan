//
//  JZD_ServeClassCommentDetailEvaluateContentTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeClassCommentDetailEvaluateContentTableViewCell.h"

@interface JZD_ServeClassCommentDetailEvaluateContentTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleImageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@end

@implementation JZD_ServeClassCommentDetailEvaluateContentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCellType:(JZD_ServeClassCommentDetailEvaluateContentTableViewCellType)cellType {
    switch (cellType) {
        case JZD_ServeClassCommentDetailEvaluateContentTableViewCellTypeNormal:
            self.titleLabel.hidden = YES;
            self.titleImage.hidden = NO;
            self.titleImageLabel.hidden = NO;
            break;
        case JZD_ServeClassCommentDetailEvaluateContentTableViewCellTypeContent:
            self.titleImage.hidden = YES;
            self.titleImageLabel.hidden = YES;
            self.titleLabel.hidden = NO;
            break;
            
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
