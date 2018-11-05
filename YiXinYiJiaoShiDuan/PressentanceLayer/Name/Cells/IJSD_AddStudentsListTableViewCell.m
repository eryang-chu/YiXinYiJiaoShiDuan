//
//  IJSD_AddStudentsListTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/3.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_AddStudentsListTableViewCell.h"

@interface IJSD_AddStudentsListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *selectImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end

@implementation IJSD_AddStudentsListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        [self.selectImage setImage:[UIImage imageNamed:@"ic_zhixuanzhong"]];
    } else {
        [self.selectImage setImage:[UIImage imageNamed:@"ic_zhiweixuan"]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
