//
//  IJSD_ChaLouBuQueTableViewCell.m
//  YiXinYiJiaoShiDuan
//
//  Created by 楚二洋 on 2018/11/2.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "IJSD_ChaLouBuQueTableViewCell.h"

@interface IJSD_ChaLouBuQueTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *detailsView;
@property (weak, nonatomic) IBOutlet UIButton *huLueButton;
@property (weak, nonatomic) IBOutlet UIButton *dianMingButton;
@end

@implementation IJSD_ChaLouBuQueTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.huLueButton layerCornerRadius:@8 borderWidth:@.6 borderColor:SYSTEM_RED_COLOR];
    [self.dianMingButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.detailsView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    // Initialization code
}
- (IBAction)hulueButtonClick:(id)sender {
    if (self.hulueButtonClick) {
        self.hulueButtonClick();
    }
}
- (IBAction)dianmingButtonClick:(id)sender {
    if (self.dianmingButtonClick) {
        self.dianmingButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
