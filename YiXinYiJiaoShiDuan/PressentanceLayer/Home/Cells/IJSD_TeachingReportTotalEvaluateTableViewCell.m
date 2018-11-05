//
//  IJSD_TeachingReportTotalEvaluateTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_TeachingReportTotalEvaluateTableViewCell.h"

@interface IJSD_TeachingReportTotalEvaluateTableViewCell () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *evaluateTextField;
@end

@implementation IJSD_TeachingReportTotalEvaluateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.evaluateTextField.delegate = self;
    self.evaluateTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
    // Initialization code
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)textFieldChange:(id)sender {
    if (self.textFieldDidChange) {
        self.textFieldDidChange(_evaluateTextField);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
