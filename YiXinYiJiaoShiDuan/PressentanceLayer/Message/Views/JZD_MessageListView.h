//
//  JZD_MessageListView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_MessageListView : UIView
@property (nonatomic, copy) void (^messageDidSelectAtIndexPath)(NSIndexPath *index);
@end
