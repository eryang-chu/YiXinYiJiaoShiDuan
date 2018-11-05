//
//  IJSD_TeachingReportEditView.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, IJSD_TeachingReportEditViewType) {
    IJSD_TeachingReportEditViewTypeNormal, //
    IJSD_TeachingReportEditViewTypeEdit, //编辑
};

@interface IJSD_TeachingReportEditView : UIView
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, assign) IJSD_TeachingReportEditViewType viewType;

@property (nonatomic, copy) void (^deleteButtonAtIndexPath)(NSIndexPath *index);
@end
