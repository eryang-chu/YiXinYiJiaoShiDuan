//
//  IJXF_AdvertisingView.h
//  新项目
//
//  Created by 陶洋 on 2017/10/19.
//  Copyright © 2017年 陶洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IJXF_AdvertisingView;

@protocol advertisingViewDelegate <NSObject>

- (void)advertisingView:(IJXF_AdvertisingView *)view clickImageIndex:(NSInteger)index;
- (void)didScrollEnd:(IJXF_AdvertisingView *)view clickImageIndex:(NSInteger)index;

@end

@interface IJXF_AdvertisingView : UIScrollView<UIScrollViewDelegate>{
    
    NSTimer *_Timer;//动画定时器
    UIPageControl *_pageControl;//分页
    NSMutableArray *_dataArray;//图片数组
    NSMutableArray *_imageViewArray;
    NSInteger _index;
    UILabel *_tips;
    UILabel *_title;//描述
    UIView  *_bottomBg;
    int currentPageIndex;
    
}
@property (nonatomic,strong) NSArray *textArray;

@property (nonatomic,strong) UIPageControl *pageControl;

//加载图片
-(void)_loadDataWithImageArray:(NSArray *)array targetView:(UIView *)view;
//加载网上图片
-(void)_loadDataWithUrlArray:(NSArray *)array targetView:(UIView *)view;
//开始动画
-(void)_startAnimation;
//停止动画
-(void)_stopAnimation;

@property(weak,nonatomic) id <advertisingViewDelegate> myDelegate;
@end
