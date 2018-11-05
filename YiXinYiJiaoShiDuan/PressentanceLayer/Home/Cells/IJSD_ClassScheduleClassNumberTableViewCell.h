//
//  IJSD_ClassScheduleClassNumberTableViewCell.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

@interface IJSD_ClassScheduleClassNumberTableViewCell : IJSD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *chuqinImage;
@property (weak, nonatomic) IBOutlet UIImageView *jifeiImage;

@property (nonatomic, copy) void (^phoneButtonClick)(void);
@end
