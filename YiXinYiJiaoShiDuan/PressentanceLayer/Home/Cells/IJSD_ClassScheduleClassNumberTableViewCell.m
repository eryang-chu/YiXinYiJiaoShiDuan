//
//  IJSD_ClassScheduleClassNumberTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_ClassScheduleClassNumberTableViewCell.h"

@implementation IJSD_ClassScheduleClassNumberTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)phoneButtonClick:(id)sender {
    if (self.phoneButtonClick) {
        self.phoneButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
