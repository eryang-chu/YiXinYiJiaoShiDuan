//
//  JZD_AccountSetPromptView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_AccountSetPromptView : UIView

@property (weak, nonatomic) IBOutlet UILabel *promptLabel;
- (id)initWithFrame:(CGRect)frame;
@property (nonatomic, copy) void (^cancelButtonClick)(void);
@property (nonatomic, copy) void (^sureButtonClick)(void);
@end
