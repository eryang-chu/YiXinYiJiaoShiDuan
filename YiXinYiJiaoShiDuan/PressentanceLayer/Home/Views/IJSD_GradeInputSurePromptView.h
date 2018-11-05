//
//  IJSD_GradeInputSurePromptView.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/31.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IJSD_GradeInputSurePromptView : UIView
@property (nonatomic, copy) void (^sureButtonClick)(void);
@property (nonatomic, copy) void (^cancelButtonClick)(void);
@end
