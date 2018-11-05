//
//  IJSD_BasicViewController.h
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/10/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "ViewController.h"

@interface IJSD_BasicViewController : ViewController

- (void)pushToViewControllerWithStoryBoardName:(NSString *)storyBoardName controllerId:(NSString *)controllerId;
- (void)popViewController;

- (void)showNormalBlankLoadingView;//纯色背景loading
- (void)showNormalBlankLoadingInView:(UIView *)view;
- (void)showClearColorBlankLoadingView;//透明背景loading
- (void)showClearColorBlankLoadingInView:(UIView *)view;//透明背景loading
- (void)hideBlankLoadingView;//隐藏loading

@end
