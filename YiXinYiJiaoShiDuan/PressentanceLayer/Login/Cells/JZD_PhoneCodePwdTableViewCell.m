//
//  JZD_PhoneCodePwdTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_PhoneCodePwdTableViewCell.h"

@interface JZD_PhoneCodePwdTableViewCell () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *forgetPwdButton;

@property (weak, nonatomic) IBOutlet UIButton *codeButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redLineBottom;
@property (weak, nonatomic) IBOutlet UIButton *eyeButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputTextFieldSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputTextFieldTrailSpace;

@property (assign, nonatomic) NSInteger secondsCountDown;//倒数计时
@property (strong, nonatomic) NSTimer *countDownTimer;
@end
@implementation JZD_PhoneCodePwdTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.inputTextField.delegate = self;
    [self.codeButton layerCornerRadius:@15 borderWidth:nil borderColor:nil];
    [self.codeButton setTitleColor:HEX_COLOR(0xffffff) forState:UIControlStateNormal];
    self.codeButton.backgroundColor = SYSTEM_RED_COLOR;
    
    self.eyeButton.selected = NO;
    [self.eyeButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
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

- (IBAction)forgetPwdButtonClick:(id)sender {
    if (self.forgetPwdButtonClick) {
        self.forgetPwdButtonClick();
    }
}
- (IBAction)codeButtonClick:(id)sender {
    if (self.codeButtonClick) {
        self.codeButtonClick(self);
    }
}
- (IBAction)eyeButtonClick:(UIButton *)sender {
    if (sender.selected) {
        self.eyeButton.selected = NO;
        self.inputTextField.secureTextEntry = YES;
        
    }else {
        self.eyeButton.selected = YES;
        self.inputTextField.secureTextEntry = NO;
    }
}

- (void)startTiming {
    [self countDownWithSeconds:60 selector:@selector(timeFireMethod)];
}

- (void)countDownWithSeconds:(NSInteger)seconds selector:(SEL)aSelector {
    
    self.codeButton.enabled = NO;
    
//    [self.codeButton setTitleColor:HEX_COLOR(0x808080) forState:UIControlStateNormal];
//    self.codeButton.backgroundColor = HEX_COLOR(0xf2f2f2);
    //设置倒计时总时长
    _secondsCountDown = seconds;
    [self.codeButton setTitle:[NSString stringWithFormat:@"%ld S",_secondsCountDown]  forState:UIControlStateDisabled];
    //开始倒计时
    _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:aSelector userInfo:nil repeats:YES]; //启动倒计时后会每秒钟调用一次方法 timeFireMethod
}

- (void)timeFireMethod {
    _secondsCountDown --;
    [self.codeButton setTitle:[NSString stringWithFormat:@"%ld S",_secondsCountDown] forState:UIControlStateDisabled];
    
    if (_secondsCountDown == 0) {
        [self stopTiming];
    }
}

- (void)stopTiming {
    [_countDownTimer invalidate];
//    [self.codeButton setTitleColor:HEX_COLOR(0xffffff) forState:UIControlStateNormal];
//    self.codeButton.backgroundColor = SYSTEM_RED_COLOR;
    self.codeButton.enabled = YES;
}

- (void)setCellType:(JZD_PhoneCodePwdTableViewCellType)cellType {
    _cellType = cellType;
    switch (_cellType) {
        case JZD_PhoneCodePwdTableViewCellTypePhone:
            self.leftImage.hidden = NO;
            self.leftImage.image = [UIImage imageNamed:@"ic_phone"];
            self.inputTextField.placeholder = @"请输入手机号";
            self.codeButton.hidden = YES;
            self.forgetPwdButton.hidden = YES;
            self.eyeButton.hidden = YES;
            self.titleLabel.hidden = YES;
            self.redLineBottom.constant = 0;
            self.titleLabelSpace.constant = -50;
            self.inputTextFieldSpace.constant = 5;
            self.inputTextFieldTrailSpace.constant = 5;
            break;
        case JZD_PhoneCodePwdTableViewCellTypeCode:
            self.leftImage.hidden = NO;
            self.leftImage.image = [UIImage imageNamed:@"ic_pass"];
            self.inputTextField.placeholder = @"请输入验证码";
            self.codeButton.hidden = NO;
            self.forgetPwdButton.hidden = YES;
            self.eyeButton.hidden = YES;
            self.titleLabel.hidden = YES;
            self.redLineBottom.constant = 0;
            self.titleLabelSpace.constant = -50;
            self.inputTextFieldSpace.constant = 5;
            self.inputTextFieldTrailSpace.constant = 85;
            break;
        case JZD_PhoneCodePwdTableViewCellTypePwd:
            self.leftImage.hidden = NO;
            self.leftImage.image = [UIImage imageNamed:@"ic_pass"];
            self.inputTextField.placeholder = @"请输入密码";
            self.codeButton.hidden = YES;
            self.forgetPwdButton.hidden = NO;
            self.eyeButton.hidden = NO;
            self.titleLabel.hidden = YES;
            self.redLineBottom.constant = 35;
            self.titleLabelSpace.constant = -50;
            self.inputTextFieldSpace.constant = 5;
            self.inputTextFieldTrailSpace.constant = 30;
            break;
        case JZD_PhoneCodePwdTableViewCellTypeModifyPhone:
            self.leftImage.hidden = YES;
            self.inputTextField.placeholder = @"请输入手机号";
            self.codeButton.hidden = YES;
            self.forgetPwdButton.hidden = YES;
            self.eyeButton.hidden = YES;
            self.titleLabel.hidden = NO;
            self.redLineBottom.constant = 0;
            self.titleLabelSpace.constant = 5;
            self.inputTextFieldSpace.constant = 60;
            self.inputTextFieldTrailSpace.constant = 5;
            break;
        case JZD_PhoneCodePwdTableViewCellTypeModifyPhoneCode:
            self.leftImage.hidden = YES;
            self.inputTextField.placeholder = @"请输入验证码";
            self.codeButton.hidden = NO;
            self.forgetPwdButton.hidden = YES;
            self.eyeButton.hidden = YES;
            self.titleLabel.hidden = NO;
            self.redLineBottom.constant = 0;
            self.titleLabelSpace.constant = 5;
            self.inputTextFieldSpace.constant = 60;
            self.inputTextFieldTrailSpace.constant = 85;
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
