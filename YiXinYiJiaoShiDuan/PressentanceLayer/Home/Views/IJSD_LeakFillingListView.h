//
//  IJSD_LeakFillingListView.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IJSD_LeakFillingListView : UIView
@property (nonatomic, copy) void (^ignoreButtonClickAtIndexPath)(NSIndexPath *index);
@property (nonatomic, copy) void (^callButtonClickAtIndexPath)(NSIndexPath *index);
@end
