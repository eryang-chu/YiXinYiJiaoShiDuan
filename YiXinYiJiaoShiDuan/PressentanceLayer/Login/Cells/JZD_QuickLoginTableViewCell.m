//
//  JZD_QuickLoginTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_QuickLoginTableViewCell.h"

@interface JZD_QuickLoginTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *quickButton;
@end
@implementation JZD_QuickLoginTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.quickButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    // Initialization code
}
- (IBAction)quickButtonClick:(id)sender {
    if (self.quickButtonClick) {
        self.quickButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
