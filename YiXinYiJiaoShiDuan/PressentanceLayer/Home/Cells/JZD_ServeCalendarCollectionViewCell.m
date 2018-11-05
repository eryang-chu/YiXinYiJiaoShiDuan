//
//  JZD_ServeCalendarCollectionViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/13.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeCalendarCollectionViewCell.h"

@interface JZD_ServeCalendarCollectionViewCell ()

@end

@implementation JZD_ServeCalendarCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    // Initialization code
}

- (void)setCellType:(JZD_ServeCalendarCollectionViewCellType)cellType {
    switch (cellType) {
        case JZD_ServeCalendarCollectionViewCellTypeNormal:
            self.contentLabel.textColor = HEX_COLOR(0x333333);
            self.contentLabel.backgroundColor = [UIColor whiteColor];
            [self.contentLabel layerCornerRadius:@12.5 borderWidth:nil borderColor:nil];
            break;
        case JZD_ServeCalendarCollectionViewCellTypeToday:
            self.contentLabel.textColor = HEX_COLOR(0x333333);
            self.contentLabel.backgroundColor = [UIColor whiteColor];
            [self.contentLabel layerCornerRadius:@12.5 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
            break;
        case JZD_ServeCalendarCollectionViewCellTypecampus:
            self.contentLabel.textColor = HEX_COLOR(0x333333);
            self.contentLabel.backgroundColor = HEX_COLOR(0xf9e9eb);
            [self.contentLabel layerCornerRadius:@12.5 borderWidth:nil borderColor:nil];
            break;
        case JZD_ServeCalendarCollectionViewCellTypeLeave:
            self.contentLabel.textColor = HEX_COLOR(0xffffff);
            self.contentLabel.backgroundColor = SYSTEM_RED_COLOR;
            [self.contentLabel layerCornerRadius:@12.5 borderWidth:nil borderColor:nil];
            break;
            
        default:
            break;
    }
}

@end
