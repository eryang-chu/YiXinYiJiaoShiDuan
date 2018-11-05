//
//  JZD_AccountSetPromptView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountSetPromptView.h"

@interface JZD_AccountSetPromptView ()
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;

@end

@implementation JZD_AccountSetPromptView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        JZD_AccountSetPromptView *promptView = [[NSBundle mainBundle] loadNibNamed:@"JZD_AccountSetPromptView" owner:nil options:nil].lastObject;
        promptView.frame = frame;
        return promptView;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.cancelButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    [self.sureButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
}

- (IBAction)cancelButtonClick:(id)sender {
    if (self.cancelButtonClick) {
        self.cancelButtonClick();
    }
}
- (IBAction)sureButtonClick:(id)sender {
    if (self.sureButtonClick) {
        self.sureButtonClick();
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
