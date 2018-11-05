//
//  JZD_FirstLoginHeaderView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_FirstLoginHeaderView.h"

@interface JZD_FirstLoginHeaderView ()
@end

@implementation JZD_FirstLoginHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.backButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        JZD_FirstLoginHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"JZD_FirstLoginHeaderView" owner:nil options:nil].lastObject;
        headerView.frame = frame;
        return headerView;
    }
    return self;
}

- (IBAction)returnButtonClick:(id)sender {
    if (self.returnButtonClick) {
        self.returnButtonClick();
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
