//
//  JZD_ServeClassCommentDetailView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_ServeClassCommentDetailView : UIView
@property (nonatomic, copy) void (^contentButtonClick)(void);
@property (nonatomic, strong) NSDictionary *dataDict;
@end
