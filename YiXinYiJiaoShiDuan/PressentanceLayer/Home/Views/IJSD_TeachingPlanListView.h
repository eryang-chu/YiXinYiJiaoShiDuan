//
//  IJSD_TeachingPlanListView.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IJSD_TeachingPlanListView : UIView
@property (nonatomic, copy) void (^downloadButtonClickAtIndexPath)(NSIndexPath *index);
@property (nonatomic, strong) NSArray *dataList;
@end
