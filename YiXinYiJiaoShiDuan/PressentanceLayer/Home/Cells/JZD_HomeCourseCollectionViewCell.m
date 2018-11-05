//
//  JZD_HomeCourseCollectionViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeCourseCollectionViewCell.h"

@implementation JZD_HomeCourseCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.courseImage layerCornerRadius:@25 borderWidth:nil borderColor:nil];
    // Initialization code
}

@end
