//
//  IJSD_PublicListTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_PublicListTableViewCell.h"

@implementation IJSD_PublicListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.noticeView layerCornerRadius:@2.5 borderWidth:nil borderColor:nil];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
