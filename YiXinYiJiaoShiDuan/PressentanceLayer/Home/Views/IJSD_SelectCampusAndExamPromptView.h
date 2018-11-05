//
//  IJSD_SelectCampusAndExamPromptView.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IJSD_SelectCampusAndExamPromptView : UIView
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, copy) void (^cancelButtonClick)(void);
@property (nonatomic, copy) void (^sureButtonClick)(NSIndexPath *index);
@end
