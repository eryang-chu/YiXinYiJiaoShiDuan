//
//  IJSD_SelectCampusAndExamPromptTableViewCell.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

@interface IJSD_SelectCampusAndExamPromptTableViewCell : IJSD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, copy) void (^cancelButtonClick)(void);
@property (nonatomic, copy) void (^sureButtonClick)(void);
@end
