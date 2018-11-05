//
//  JZD_HomeCourseCollectionView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_HomeCourseCollectionView : UIView
@property (nonatomic, strong) NSArray *coursesList;
@property (nonatomic, copy) void (^cellDidSelectedAtIndex)(NSIndexPath *index);
@end
