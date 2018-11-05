//
//  JZD_MessageListTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_MessageListTableViewCell.h"

@interface JZD_MessageListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *badgeLabel;
@end

@implementation JZD_MessageListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.headImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    [self.badgeLabel layerCornerRadius:@8.5 borderWidth:nil borderColor:nil];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
