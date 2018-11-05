//
//  IJSD_ClassScheduleClassNumberListView.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IJSD_ClassScheduleClassNumberListView : UIView
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, copy) void (^phoneButtonClickAtIndexPath)(NSIndexPath *index);
@end
