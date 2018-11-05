//
//  IJSD_SelectCampusAndExamPromptTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_SelectCampusAndExamPromptTableViewCell.h"

@interface IJSD_SelectCampusAndExamPromptTableViewCell ()

@end

@implementation IJSD_SelectCampusAndExamPromptTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        self.titleLabel.textColor = SYSTEM_RED_COLOR;
    } else {
        self.titleLabel.textColor = SYSTEM_BLACK_COLOR;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
