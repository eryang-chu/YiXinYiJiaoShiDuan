//
//  JZD_HomeCourseTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//
#import "IJSD_BasicTableViewCell.h"

@interface JZD_HomeCourseTableViewCell : IJSD_BasicTableViewCell
@property (nonatomic, strong) NSArray *subjectList;

@property (nonatomic, copy) void (^cellDidSelectedAtIndex)(NSIndexPath *index);

@end
