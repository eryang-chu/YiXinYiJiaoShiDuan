//
//  IJSD_CallNamesTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_CallNamesTableViewCell.h"

@implementation IJSD_CallNamesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.headImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
