//
//  JZD_ServeClassConditionListTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

@interface JZD_ServeClassConditionListTableViewCell : IJSD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalClasses;
@property (weak, nonatomic) IBOutlet UILabel *usedClasses;
@property (weak, nonatomic) IBOutlet UILabel *surplusClasses;
@end
