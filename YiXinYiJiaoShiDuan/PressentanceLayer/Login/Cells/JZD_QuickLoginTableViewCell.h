//
//  JZD_QuickLoginTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

@interface JZD_QuickLoginTableViewCell : IJSD_BasicTableViewCell
@property (nonatomic, copy) void (^quickButtonClick)(void);
@end
