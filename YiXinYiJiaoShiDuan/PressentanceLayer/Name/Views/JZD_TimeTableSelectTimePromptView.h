//
//  JZD_TimeTableSelectTimePromptView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/12.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_TimeTableSelectTimePromptView : UIView
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, copy) void (^cellDidSelectAtIndexPath)(NSIndexPath *index);
@end
