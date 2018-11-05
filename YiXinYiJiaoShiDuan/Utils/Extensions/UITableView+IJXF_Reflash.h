//
//  UITableView+IJXF_Reflash.h
//  JiXingFeng
//
//  Created by anmin on 2017/10/27.
//  Copyright © 2017年 puhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (IJXF_Reflash)
// 下拉刷新
- (void)headerReflashBlock:(NoParamsBlock)reflashBlock;
//  上拉加载更多
- (void)footerLoadMoreBlock:(NoParamsBlock)loadMoreBlock;

//  开始刷新
- (void)beginRefalsh;
//  结束刷新
- (void)endRefalsh;
@end
