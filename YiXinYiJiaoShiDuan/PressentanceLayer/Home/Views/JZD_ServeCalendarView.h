//
//  JZD_ServeCalendarView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/13.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_ServeCalendarView : UIView
@property (nonatomic, copy) void (^cellDidSelectedAtIndex)(NSString *date);
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) NSString *currentDate;
@property (nonatomic, assign) NSInteger firstday;


@property (nonatomic, strong) NSArray *tableList;
@end
