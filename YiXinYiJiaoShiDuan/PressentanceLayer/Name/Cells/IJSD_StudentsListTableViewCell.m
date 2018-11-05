//
//  IJSD_StudentsListTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_StudentsListTableViewCell.h"

@interface IJSD_StudentsListTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *noticeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *chuqinImage;
@property (weak, nonatomic) IBOutlet UILabel *jifeiLabel;
@property (weak, nonatomic) IBOutlet UIImageView *jifeiImage;
@property (weak, nonatomic) IBOutlet UIImageView *queqinImage;
@property (weak, nonatomic) IBOutlet UIView *popupView;
@property (weak, nonatomic) IBOutlet UILabel *popupLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *popupViewHeight;

@property (weak, nonatomic) IBOutlet UIButton *chuqinButton;
@property (weak, nonatomic) IBOutlet UIButton *jifeiButton;
@property (weak, nonatomic) IBOutlet UIButton *absenceButton;

@end

@implementation IJSD_StudentsListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.noticeLabel layerCornerRadius:@7.5 borderWidth:nil borderColor:nil];
    self.chuqinButton.selected = NO;
    self.jifeiButton.selected = NO;
    self.absenceButton.selected = NO;
    
    // Initialization code
}

#pragma mark - 出勤
- (IBAction)chuqinButtonClick:(id)sender {
    if (self.chuqinButton.selected) {
        self.chuqinButton.selected = NO;
        [self.chuqinImage setImage:[UIImage imageNamed:@"ic_weixuan"]];
    } else {
        self.chuqinButton.selected = YES;
        [self.chuqinImage setImage:[UIImage imageNamed:@"ic_xuan.png"]];
    }
    if (self.chuqinButtonClick) {
        self.chuqinButtonClick();
    }
}

#pragma mark - 计费
- (IBAction)jifeiButtonClick:(id)sender {
    if (self.jifeiButton.selected) {
        self.jifeiButton.selected = NO;
        [self.jifeiImage setImage:[UIImage imageNamed:@"ic_weixuan"]];
    } else {
        self.jifeiButton.selected = YES;
        [self.jifeiImage setImage:[UIImage imageNamed:@"ic_xuan.png"]];
    }
    if (self.jifeiButtonClick) {
        self.jifeiButtonClick();
    }
}

#pragma mark - 缺勤
- (IBAction)queqinButtonClick:(id)sender {
//    if (self.absenceButton.selected) {
//        self.absenceButton.selected = NO;
//        self.popupView.hidden = YES;
//        self.popupViewHeight.constant = 0;
//    } else {
//        self.absenceButton.selected = YES;
//        self.popupView.hidden = NO;
//        self.popupViewHeight.constant = 50;
//    }
    if (self.queqinButtonClick) {
        self.queqinButtonClick();
    }
}

#pragma mark - 打电话
- (IBAction)phoneButtonClick:(id)sender {
    if (self.phoneButtonClick) {
        self.phoneButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
