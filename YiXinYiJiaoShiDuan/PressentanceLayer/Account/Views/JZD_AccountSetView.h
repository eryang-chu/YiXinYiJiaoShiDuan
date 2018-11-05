//
//  JZD_AccountSetView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_AccountSetView : UIView
@property (nonatomic, copy) void (^cellDidSelectedAtIndex)(NSIndexPath *index);
@end
