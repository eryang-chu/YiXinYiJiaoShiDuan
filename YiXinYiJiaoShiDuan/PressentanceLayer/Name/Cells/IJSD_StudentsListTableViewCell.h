//
//  IJSD_StudentsListTableViewCell.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

@interface IJSD_StudentsListTableViewCell : IJSD_BasicTableViewCell
@property (nonatomic, copy) void (^chuqinButtonClick)(void);
@property (nonatomic, copy) void (^jifeiButtonClick)(void);
@property (nonatomic, copy) void (^phoneButtonClick)(void);
@property (nonatomic, copy) void (^queqinButtonClick)(void);

@end
