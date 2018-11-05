//
//  IJSD_GradeInputSurePromptView.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_GradeInputSurePromptView.h"

@interface IJSD_GradeInputSurePromptView ()
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@end

@implementation IJSD_GradeInputSurePromptView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.cancelButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    [self.sureButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        IJSD_GradeInputSurePromptView *promptView = [[NSBundle mainBundle] loadNibNamed:@"IJSD_GradeInputSurePromptView" owner:nil options:nil].lastObject;
        promptView.frame = frame;
        return promptView;
    }
    return self;
}

- (IBAction)sureButtonClick:(id)sender {
    if (self.sureButtonClick) {
        self.sureButtonClick();
    }
}

- (IBAction)cancelButtonClick:(id)sender {
    if (self.cancelButtonClick) {
        self.cancelButtonClick();
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
