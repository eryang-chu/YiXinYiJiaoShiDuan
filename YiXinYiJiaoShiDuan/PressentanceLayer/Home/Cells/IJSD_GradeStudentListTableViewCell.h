//
//  IJSD_GradeStudentListTableViewCell.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, IJSD_GradeStudentListTableViewCellType) {
    IJSD_GradeStudentListTableViewCellTypeInput, //成绩录入
    IJSD_GradeStudentListTableViewCellTypeLook, //成绩查看
};

@interface IJSD_GradeStudentListTableViewCell : IJSD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *gradeTextField;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic, assign) IJSD_GradeStudentListTableViewCellType cellType;
@property (copy, nonatomic) void (^textFieldDidChange)(UITextField *textfield);
@end
