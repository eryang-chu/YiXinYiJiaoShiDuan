//
//  JZD_ServeClassCommentDetailEvaluateTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

@interface JZD_ServeClassCommentDetailEvaluateTableViewCell : IJSD_BasicTableViewCell
@property (nonatomic, assign) NSInteger classScore;
@property (nonatomic, assign) NSInteger workScore;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *workLabel;
@end

