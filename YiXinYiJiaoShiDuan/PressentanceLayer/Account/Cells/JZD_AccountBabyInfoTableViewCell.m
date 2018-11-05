//
//  JZD_AccountBabyInfoTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountBabyInfoTableViewCell.h"

@interface JZD_AccountBabyInfoTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UIImageView *nextImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLabelRightSpace;
@end
@implementation JZD_AccountBabyInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.headerImage layerCornerRadius:@21 borderWidth:nil borderColor:nil];
    // Initialization code
}

- (void)setCellType:(JZD_AccountBabyInfoTableViewCellType)cellType {
    _cellType = cellType;
    switch (_cellType) {
        case JZD_AccountBabyInfoTableViewCellTypeImage:
            self.headerImage.hidden = NO;
            self.nextImage.hidden = YES;
            self.contentLabel.hidden = YES;
            self.contentLabelRightSpace.constant = 28;
            break;
        case JZD_AccountBabyInfoTableViewCellTypeNextWithLabel:
            self.headerImage.hidden = YES;
            self.nextImage.hidden = NO;
            self.contentLabel.hidden = NO;
            self.contentLabelRightSpace.constant = 28;
            break;
        case JZD_AccountBabyInfoTableViewCellTypeNextNoLabel:
            self.headerImage.hidden = YES;
            self.nextImage.hidden = NO;
            self.contentLabel.hidden = YES;
            self.contentLabelRightSpace.constant = 28;
            break;
        case JZD_AccountBabyInfoTableViewCellTypeAccountSet:
            self.headerImage.hidden = YES;
            self.nextImage.hidden = YES;
            self.contentLabel.hidden = NO;
            self.contentLabelRightSpace.constant = 10;
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
