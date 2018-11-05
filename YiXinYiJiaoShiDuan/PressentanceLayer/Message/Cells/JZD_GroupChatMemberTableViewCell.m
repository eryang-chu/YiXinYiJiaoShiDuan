//
//  JZD_GroupChatMemberTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_GroupChatMemberListView.h"
#import "JZD_GroupChatMemberTableViewCell.h"

@interface JZD_GroupChatMemberTableViewCell ()
@property (weak, nonatomic) IBOutlet JZD_GroupChatMemberListView *groupChatMemberListView;
@end

@implementation JZD_GroupChatMemberTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    @weakify(self);
    self.groupChatMemberListView.cellDidSelectedAtIndex = ^(NSIndexPath *index) {
        @strongify(self);
        if (self.cellDidSelectAtIndexPath) {
            self.cellDidSelectAtIndexPath(index);
        }
    };
    // Initialization code
}
- (IBAction)moreButtonClick:(id)sender {
    if (self.moreButtonClick) {
        self.moreButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
