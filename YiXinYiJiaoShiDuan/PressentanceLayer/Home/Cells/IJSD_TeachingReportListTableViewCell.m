//
//  IJSD_TeachingReportListTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_TeachingReportListTableViewCell.h"

@interface IJSD_TeachingReportListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation IJSD_TeachingReportListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.headImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    
    self.selectButton.selected = NO;
    // Initialization code
}
- (IBAction)selectButtonClick:(id)sender {
    if (self.selectButton.selected) {
        self.selectButton.selected = NO;
    } else {
        self.selectButton.selected = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
