//
//  IJSD_SelectClassInputGradeListView.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, IJSD_SelectClassInputGradeListViewType) {
    IJSD_SelectClassInputGradeListViewTypeInput, //成绩录入
    IJSD_SelectClassInputGradeListViewTypeLook, //成绩查看
};

@interface IJSD_SelectClassInputGradeListView : UIView
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, copy) void (^returnGradeWithIndexPath)(NSIndexPath *index, NSString *grade);
@property (nonatomic, assign) IJSD_SelectClassInputGradeListViewType viewType;
@end
