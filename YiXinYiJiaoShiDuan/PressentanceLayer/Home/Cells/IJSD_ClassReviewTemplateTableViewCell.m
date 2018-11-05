//
//  IJSD_ClassReviewTemplateTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_ClassReviewTemplateTableViewCell.h"

@implementation IJSD_ClassReviewTemplateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.templateView layerCornerRadius:@8 borderWidth:@.6 borderColor:HEX_COLOR(0xffffff)];
    // Initialization code
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        [self.templateView layerCornerRadius:nil borderWidth:nil borderColor:SYSTEM_RED_COLOR];
    } else {
        [self.templateView layerCornerRadius:nil borderWidth:nil borderColor:HEX_COLOR(0xffffff)];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
