//
//  JZD_GroupChatMemberNoticeTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

@interface JZD_GroupChatMemberNoticeTableViewCell : IJSD_BasicTableViewCell
@property (nonatomic, copy) void (^noticeButtonClick)(void);
@end
