//
//  IJSD_CallNamesListView.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IJSD_CallNamesListView : UIView
@property (nonatomic, copy) void (^cellDidSelectedAtIndexPath)(NSIndexPath *index);
@end
