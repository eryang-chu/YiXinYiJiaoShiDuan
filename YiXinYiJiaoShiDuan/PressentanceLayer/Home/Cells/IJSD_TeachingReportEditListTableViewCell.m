//
//  IJSD_TeachingReportEditListTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_StarView.h"
#import "IJSD_TeachingReportEditListTableViewCell.h"

@interface IJSD_TeachingReportEditListTableViewCell () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@end

@implementation IJSD_TeachingReportEditListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.editTextField.delegate = self;
    self.editTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.editButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.deleteButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
    // Initialization code
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)textFieldChange:(id)sender {
    if (self.textFieldDidChange) {
        self.textFieldDidChange(_editTextField);
    }
}

- (void)setCellType:(IJSD_TeachingReportEditListTableViewCellType)cellType {
    _cellType = cellType;
    switch (cellType) {
        case IJSD_TeachingReportEditListTableViewCellTypeNormal:
            self.contentLabel.hidden = NO;
            self.editTextField.hidden = YES;
            self.editButton.hidden = YES;
            self.deleteButton.hidden = YES;
            break;
        case IJSD_TeachingReportEditListTableViewCellTypeEdit:
            self.contentLabel.hidden = NO;
            self.editTextField.hidden = YES;
            self.editButton.hidden = NO;
            self.deleteButton.hidden = NO;
            break;
        case IJSD_TeachingReportEditListTableViewCellTypeEditing:
            self.contentLabel.hidden = YES;
            self.editTextField.hidden = NO;
            self.editButton.hidden = NO;
            self.deleteButton.hidden = NO;
            break;
            
        default:
            break;
    }
}

- (IBAction)deleteButtonClick:(id)sender {
    if (self.deleteButtonClick) {
        self.deleteButtonClick();
    }
}
- (IBAction)editButtonClick:(id)sender {
    if (self.editButtonClick) {
        self.editButtonClick();
    }
    self.cellType = IJSD_TeachingReportEditListTableViewCellTypeEditing;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
