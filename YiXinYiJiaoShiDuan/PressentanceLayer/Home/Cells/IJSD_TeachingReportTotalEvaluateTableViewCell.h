//
//  IJSD_TeachingReportTotalEvaluateTableViewCell.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

@interface IJSD_TeachingReportTotalEvaluateTableViewCell : IJSD_BasicTableViewCell
@property (copy, nonatomic) void (^textFieldDidChange)(UITextField *textfield);
@end
