//
//  IJSD_TeachingReportListView.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IJSD_TeachingReportListView : UIView
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, copy) void (^cellDidSelectAtIndexPath)(NSIndexPath *index);
@end
