//
//  IJSD_DynamicSelectClassTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/3.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_DynamicSelectClassTableViewCell.h"

@interface IJSD_DynamicSelectClassTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UIImageView *selectImage;
@end

@implementation IJSD_DynamicSelectClassTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectButton.selected = NO;
    // Initialization code
}
- (IBAction)selectButtonClick:(id)sender {
    if (self.selectButton.selected) {
        self.selectButton.selected = NO;
        [self.selectImage setImage:[UIImage imageNamed:@"ic_zhiweixuan"]];
    } else {
        self.selectButton.selected = YES;
        [self.selectImage setImage:[UIImage imageNamed:@"ic_zhixuanzhong"]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
