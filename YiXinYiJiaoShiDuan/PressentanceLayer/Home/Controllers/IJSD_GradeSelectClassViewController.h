//
//  IJSD_GradeSelectClassViewController.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicViewController.h"

typedef NS_ENUM(NSUInteger, IJSD_GradeSelectClassViewControllerType) {
    IJSD_GradeSelectClassViewControllerTypeInput, //成绩录入
    IJSD_GradeSelectClassViewControllerTypeLook, //成绩查看
};
@interface IJSD_GradeSelectClassViewController : IJSD_BasicViewController
@property (nonatomic, assign) IJSD_GradeSelectClassViewControllerType vcType;
@end
