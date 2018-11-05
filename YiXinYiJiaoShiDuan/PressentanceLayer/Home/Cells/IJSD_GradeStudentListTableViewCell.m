//
//  IJSD_GradeStudentListTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_GradeStudentListTableViewCell.h"

@interface IJSD_GradeStudentListTableViewCell () <UITextFieldDelegate>
@end

@implementation IJSD_GradeStudentListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.gradeTextField.delegate = self;
    self.gradeTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
    // Initialization code
}

- (void)setCellType:(IJSD_GradeStudentListTableViewCellType)cellType {
    _cellType = cellType;
    switch (cellType) {
        case IJSD_GradeStudentListTableViewCellTypeInput:
            self.gradeTextField.hidden = NO;
            self.scoreLabel.hidden = YES;
            break;
        case IJSD_GradeStudentListTableViewCellTypeLook:
            self.gradeTextField.hidden = YES;
            self.scoreLabel.hidden = NO;
            break;
            
        default:
            break;
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)textFieldChange:(id)sender {
    if (self.textFieldDidChange) {
        self.textFieldDidChange(self.gradeTextField);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
