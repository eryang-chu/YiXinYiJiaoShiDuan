//
//  UITableView+IJXF_Reflash.m
//  JiXingFeng
//
//  Created by anmin on 2017/10/27.
//  Copyright © 2017年 puhui. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>
#import "UITableView+IJXF_Reflash.h"

@implementation UITableView (IJXF_Reflash)
- (void)headerReflashBlock:(NoParamsBlock)reflashBlock {
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:reflashBlock];
}

- (void)footerLoadMoreBlock:(NoParamsBlock)loadMoreBlock {
    //    self.mj_footer [MJRefresh]
    self.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:loadMoreBlock];
}

- (void)beginRefalsh {
    [self.mj_header beginRefreshing];
}

- (void)endRefalsh {
    if (self.mj_header.isRefreshing) {
        [self.mj_header endRefreshing];
    }
    if (self.mj_footer.isRefreshing) {
        [self.mj_footer endRefreshing];
    }
}
@end
