//
//  IJSD_ClassReviewListTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_ClassReviewListTableViewCell.h"

@interface IJSD_ClassReviewListTableViewCell ()
@end

@implementation IJSD_ClassReviewListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.numberLabel layerCornerRadius:@15 borderWidth:@.6 borderColor:SYSTEM_RED_COLOR];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
