//
//  IJSD_ClassReviewTemplateListView.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/1.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IJSD_ClassReviewTemplateListView : UIView
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, copy) void (^cellDidSelectAtIndexPath)(NSIndexPath *index);
@end
