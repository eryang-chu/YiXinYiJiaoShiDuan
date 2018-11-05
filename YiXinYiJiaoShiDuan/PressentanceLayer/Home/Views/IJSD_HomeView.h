//
//  IJSD_HomeView.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IJSD_HomeView : UIView
@property (nonatomic, strong) NSArray *courseList;
@property (nonatomic, strong) NSArray *bannerList;
@property (nonatomic, copy) void (^courseCellDidSelectedAtIndexPath)(NSIndexPath *index);
@property (nonatomic, copy) void (^advertisingDidSelectAtIndexPath)(NSInteger index);
@end
