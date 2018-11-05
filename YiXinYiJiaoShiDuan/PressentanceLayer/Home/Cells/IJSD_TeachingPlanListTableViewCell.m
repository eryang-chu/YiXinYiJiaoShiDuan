//
//  IJSD_TeachingPlanListTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_TeachingPlanListTableViewCell.h"

@implementation IJSD_TeachingPlanListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.downLoadButton layerCornerRadius:@8 borderWidth:@.6 borderColor:SYSTEM_RED_COLOR];
    // Initialization code
}


- (IBAction)downLoadButtonClick:(id)sender {
    if (self.downloadButtonClick) {
        self.downloadButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
