//
//  UIView+FWEB_Extension.h
//  fuwuEbao
//
//  Created by Jiao on 2018/8/8.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FWEB_Extension)
//  left
@property (nonatomic) CGFloat left;
//  top
@property (nonatomic) CGFloat top;

//  left : x = left
@property (nonatomic) CGFloat x;
//  top : y = top
@property (nonatomic) CGFloat y;
//  right point.x
@property (nonatomic) CGFloat right;
//  botton point.y
@property (nonatomic) CGFloat bottom;
//  width
@property (nonatomic) CGFloat width;
//  height
@property (nonatomic) CGFloat height;
//  center.x
@property (nonatomic) CGFloat centerX;
//  center.y
@property (nonatomic) CGFloat centerY;
//  oright point    position
@property (nonatomic) CGPoint origin;
//  size point      size
@property (nonatomic) CGSize  size;

//  设置圆角、边框粗细、边框颜色
//  radius      圆角弧度 -- nil时不设置圆角
//  width       边框粗细 -- nil时不设置边框
//  color       边框颜色 -- nil时不设置边框颜色
- (void)layerCornerRadius:(NSNumber *)radius borderWidth:(NSNumber *)width borderColor:(UIColor *)color;

//  使用xib初始化view
//  nibName     xib的名字
- (instancetype)loadNibWithName:(NSString *)nibName;

- (void)showMBProgressHudAnimated:(BOOL)animated;

- (void)hideAllHuds;

- (UIViewController *)currentViewController;

/**
 *  通过 CAShapeLayer 方式绘制虚线
 *
 *  param lineLength:     虚线的宽度
 *  param lineSpacing:    虚线的间距
 *  param lineColor:      虚线的颜色
 *  param lineDirection   虚线的方向  YES 为水平方向， NO 为垂直方向
 **/
- (CAShapeLayer *)drawLineOfDashByCAShapeLayerLineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineDirection:(BOOL)isHorizonal;
@end
