//
//  JZD_FirstLoginPromptView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_FirstLoginPromptView.h"

@interface JZD_FirstLoginPromptView () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *modifyPwdLabel;
@property (weak, nonatomic) IBOutlet UIButton *noModifyPwdButton;
@property (weak, nonatomic) IBOutlet UIButton *modifyPwdButton;

@property (weak, nonatomic) IBOutlet UILabel *relationshipLabel;
@property (weak, nonatomic) IBOutlet UIView *relationshipView;
@property (weak, nonatomic) IBOutlet UITextField *relationshipTextField;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;

@property (weak, nonatomic) IBOutlet UIButton *servicerButton;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (weak, nonatomic) IBOutlet UILabel *errorLabelTwo;

@end
@implementation JZD_FirstLoginPromptView
- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.servicerButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.noModifyPwdButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    [self.modifyPwdButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.sureButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.relationshipView layerCornerRadius:@8 borderWidth:@1 borderColor:HEX_COLOR(0x333333)];
    
    self.relationshipTextField.delegate = self;
    self.relationshipTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)textFieldChange:(id)sender {
    if (self.textFieldDidChange) {
        self.textFieldDidChange(_relationshipTextField);
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        JZD_FirstLoginPromptView *promptView = [[NSBundle mainBundle] loadNibNamed:@"JZD_FirstLoginPromptView" owner:nil options:nil].lastObject;
        promptView.frame = frame;
        return promptView;
    }
    return self;
}
- (IBAction)modifyPwdButtonClick:(id)sender {
    if (self.modifyPwdButtonClick) {
        self.modifyPwdButtonClick();
    }
}
- (IBAction)noModifyPwdButton:(id)sender {
    if (self.noModifyPwdButtonClick) {
        self.noModifyPwdButtonClick();
    }
}
- (IBAction)sureButtonClick:(id)sender {
    if (self.sureButtonClick) {
        self.sureButtonClick();
    }
}
- (IBAction)servicerButtonClick:(id)sender {
    if (self.servicerButtonClick) {
        self.servicerButtonClick();
    }
}

- (void)setViewType:(JZD_FirstLoginPromptViewType)viewType {
    _viewType = viewType;
    switch (_viewType) {
        case JZD_FirstLoginPromptViewTypeModifyPwd:
            self.modifyPwdLabel.hidden = NO;
            self.noModifyPwdButton.hidden = NO;
            self.modifyPwdButton.hidden = NO;
            self.relationshipLabel.hidden = YES;
            self.relationshipView.hidden = YES;
            self.relationshipTextField.hidden = YES;
            self.sureButton.hidden = YES;
            self.servicerButton.hidden = YES;
            self.errorLabel.hidden = YES;
            self.errorLabelTwo.hidden = YES;
            self.tipLabel.hidden = YES;
            break;
        case JZD_FirstLoginPromptViewTypeRelationship:
            self.modifyPwdLabel.hidden = YES;
            self.noModifyPwdButton.hidden = YES;
            self.modifyPwdButton.hidden = YES;
            self.relationshipLabel.hidden = NO;
            self.relationshipView.hidden = NO;
            self.relationshipTextField.hidden = NO;
            self.sureButton.hidden = NO;
            self.servicerButton.hidden = YES;
            self.errorLabel.hidden = YES;
            self.errorLabelTwo.hidden = YES;
            self.tipLabel.hidden = YES;
            break;
        case JZD_FirstLoginPromptViewTypeError:
            self.modifyPwdLabel.hidden = YES;
            self.noModifyPwdButton.hidden = YES;
            self.modifyPwdButton.hidden = YES;
            self.relationshipLabel.hidden = YES;
            self.relationshipView.hidden = YES;
            self.relationshipTextField.hidden = YES;
            self.sureButton.hidden = YES;
            self.servicerButton.hidden = NO;
            self.errorLabel.hidden = NO;
            self.errorLabelTwo.hidden = NO;
            self.tipLabel.hidden = YES;
            break;
        case JZD_FirstLoginPromptViewTypeTip:
            self.modifyPwdLabel.hidden = YES;
            self.noModifyPwdButton.hidden = YES;
            self.modifyPwdButton.hidden = YES;
            self.relationshipLabel.hidden = YES;
            self.relationshipView.hidden = YES;
            self.relationshipTextField.hidden = YES;
            self.sureButton.hidden = YES;
            self.servicerButton.hidden = YES;
            self.errorLabel.hidden = YES;
            self.errorLabelTwo.hidden = YES;
            self.tipLabel.hidden = NO;
            break;
        case JZD_FirstLoginPromptViewTypeAccountInputBabyName:
            self.modifyPwdLabel.hidden = YES;
            self.noModifyPwdButton.hidden = YES;
            self.modifyPwdButton.hidden = YES;
            self.relationshipLabel.hidden = YES;
            self.relationshipView.hidden = NO;
            self.relationshipTextField.hidden = NO;
            self.sureButton.hidden = NO;
            self.servicerButton.hidden = YES;
            self.errorLabel.hidden = YES;
            self.errorLabelTwo.hidden = YES;
            self.tipLabel.hidden = YES;
            self.relationshipTextField.placeholder = @"请输入宝贝姓名";
            break;
            
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
