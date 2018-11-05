//
//  JZD_GroupChatMemberAndNoticeView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_GroupChatMemberAndNoticeView : UIView
@property (nonatomic, copy) void (^noticeButtonClick)(void);
@property (nonatomic, copy) void (^moreButtonClick)(void);
@property (nonatomic, copy) void (^memberDidSelectAtIndexPath)(NSIndexPath *index);
@end
