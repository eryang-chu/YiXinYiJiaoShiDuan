//
//  IJSD_StudentsListView.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IJSD_StudentsListView : UIView
@property (nonatomic, copy) void (^chuqinButtonClickAtIndexPath)(NSIndexPath *index);
@property (nonatomic, copy) void (^jifeiButtonClickAtIndexPath)(NSIndexPath *index);
@property (nonatomic, copy) void (^phoneButtonClickAtIndexPath)(NSIndexPath *index);
@property (nonatomic, copy) void (^queqinButtonClickAtIndexPath)(NSIndexPath *index);
@end
