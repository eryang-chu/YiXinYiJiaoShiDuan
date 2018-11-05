//
//  IJSD_ChaLouBuQueTableViewCell.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

@interface IJSD_ChaLouBuQueTableViewCell : IJSD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *describeLabel;
@property (nonatomic, copy) void (^hulueButtonClick)(void);
@property (nonatomic, copy) void (^dianmingButtonClick)(void);
@end
