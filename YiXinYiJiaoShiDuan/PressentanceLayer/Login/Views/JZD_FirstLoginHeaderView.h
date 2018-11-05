//
//  JZD_FirstLoginHeaderView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_FirstLoginHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIButton *backButton;
- (id)initWithFrame:(CGRect)frame;
@property (nonatomic, copy) void (^returnButtonClick)(void);
@end
