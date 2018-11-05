//
//  IJSD_TeachingReportEditListTableViewCell.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

@class JZD_StarView;

typedef NS_ENUM(NSUInteger, IJSD_TeachingReportEditListTableViewCellType) {
    IJSD_TeachingReportEditListTableViewCellTypeNormal, //不可编辑
    IJSD_TeachingReportEditListTableViewCellTypeEdit, //可编辑编辑
    IJSD_TeachingReportEditListTableViewCellTypeEditing, //正在编辑
};

@interface IJSD_TeachingReportEditListTableViewCell : IJSD_BasicTableViewCell
@property (nonatomic, assign) IJSD_TeachingReportEditListTableViewCellType cellType;
@property (copy, nonatomic) void (^textFieldDidChange)(UITextField *textfield);
@property (nonatomic, copy) void (^deleteButtonClick)(void);
@property (nonatomic, copy) void (^editButtonClick)(void);

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timesLabel;
@property (weak, nonatomic) IBOutlet JZD_StarView *classStarView;
@property (weak, nonatomic) IBOutlet JZD_StarView *workStarView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UITextField *editTextField;
@end
