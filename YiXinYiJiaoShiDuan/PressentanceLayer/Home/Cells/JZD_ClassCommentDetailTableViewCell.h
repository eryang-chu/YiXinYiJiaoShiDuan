//
//  JZD_ClassCommentDetailTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_BasicTableViewCell.h"

@interface JZD_ClassCommentDetailTableViewCell : IJSD_BasicTableViewCell
@property (nonatomic, copy) void (^contentButtonClick)(void);

@property (weak, nonatomic) IBOutlet UILabel *studentLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *teacherLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
