//
//  JZD_GroupChatMemberNoticeTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_GroupChatMemberNoticeTableViewCell.h"

@interface JZD_GroupChatMemberNoticeTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *groupChatNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupNoticeLabel;
@end

@implementation JZD_GroupChatMemberNoticeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)noticeButtonClick:(id)sender {
    if (self.noticeButtonClick) {
        self.noticeButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
