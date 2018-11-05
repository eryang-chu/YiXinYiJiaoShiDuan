//
//  JZD_LoginHeaderView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_LoginHeaderView.h"

@interface JZD_LoginHeaderView ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *pwdButton;
@property (weak, nonatomic) IBOutlet UIButton *codeButton;
@end
@implementation JZD_LoginHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        JZD_LoginHeaderView *promptView = [[NSBundle mainBundle] loadNibNamed:@"JZD_LoginHeaderView" owner:nil options:nil].lastObject;
        promptView.frame = frame;
        return promptView;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.backButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.pwdButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    [self.codeButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    self.pwdButton.selected = YES;
    self.pwdButton.selected = NO;
}

- (IBAction)pwdLoginButtonClick:(id)sender {
    if (!self.pwdButton.selected) {
        if (self.pwdLoginButtonClick) {
            self.pwdLoginButtonClick();
        }
    }
    if (!self.pwdButton.selected) {
        [self.pwdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.pwdButton.backgroundColor = SYSTEM_RED_COLOR;
        
        [self.codeButton setTitleColor:SYSTEM_RED_COLOR forState:UIControlStateNormal];
        self.codeButton.backgroundColor = [UIColor whiteColor];
        
        self.codeButton.selected = NO;
        self.pwdButton.selected = YES;
    }
}
- (IBAction)codeLoginButtonClick:(id)sender {
    if (!self.codeButton.selected) {
        if (self.codeLoginButtonClick) {
            self.codeLoginButtonClick();
        }
    }
    
    if (!self.codeButton.selected) {
        [self.codeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.codeButton.backgroundColor = SYSTEM_RED_COLOR;
        
        [self.pwdButton setTitleColor:SYSTEM_RED_COLOR forState:UIControlStateNormal];
        self.pwdButton.backgroundColor = [UIColor whiteColor];
        
        self.codeButton.selected = YES;
        self.pwdButton.selected = NO;
    }
}
- (IBAction)backButtonClick:(id)sender {
    if (self.backButtonClick) {
        self.backButtonClick();
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
