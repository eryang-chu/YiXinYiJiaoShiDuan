//
//  JZD_AccountSetModifyPwdTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountSetModifyPwdTableViewCell.h"

@interface JZD_AccountSetModifyPwdTableViewCell () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *pwdPromptView;
@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redLineBottomSpace;
@end
@implementation JZD_AccountSetModifyPwdTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.inputTextField.delegate = self;
    self.inputTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
    // Initialization code
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)textFieldChange:(id)sender {
    if (self.textFieldDidChange) {
        self.textFieldDidChange(_inputTextField);
    }
}

- (void)setCellType:(JZD_AccountSetModifyPwdTableViewCellType)cellType {
    _cellType = cellType;
    switch (_cellType) {
        case JZD_AccountSetModifyPwdTableViewCellTypeNormal:
            self.pwdPromptView.hidden = YES;
            self.redLineBottomSpace.constant = 0;
            break;
        case JZD_AccountSetModifyPwdTableViewCellTypePwdPrompt:
            self.pwdPromptView.hidden = NO;
            self.redLineBottomSpace.constant = 30;
            break;
            
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
