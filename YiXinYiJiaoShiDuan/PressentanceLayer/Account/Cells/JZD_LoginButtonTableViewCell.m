//
//  JZD_LoginButtonTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_LoginButtonTableViewCell.h"

@interface JZD_LoginButtonTableViewCell ()

@end
@implementation JZD_LoginButtonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.loginButton layerCornerRadius:@5 borderWidth:nil borderColor:nil];
    // Initialization code
}
- (IBAction)loginButtonClick:(id)sender {
    if (self.loginButtonClick) {
        self.loginButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
