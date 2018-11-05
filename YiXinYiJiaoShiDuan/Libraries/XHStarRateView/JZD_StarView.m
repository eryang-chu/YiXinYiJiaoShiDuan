//
//  JZD_StarView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_StarView.h"
#define starWidth (DEVICE_WIDTH / 2.f - 80 - 8 * 4 ) / 5.f
@interface JZD_StarView ()
@property (nonatomic, assign) CGFloat starWidths;
@end

@implementation JZD_StarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
    }
    return self;
}

- (void)setScore:(NSInteger)score {
    for (int i = 0; i < 5; i ++) {
        UIImageView *grayImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.starWidths + 8) * i, 0, self.starWidths, self.frame.size.height)];
        grayImage.image = [UIImage imageNamed:@"ic_services"];
        grayImage.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:grayImage];
    }
    for (NSInteger i = 0; i < score; i ++) {
        UIImageView *redImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.starWidths + 8) * i, 0, self.starWidths, self.frame.size.height)];
        redImage.image = [UIImage imageNamed:@"ic_servicese"];
        redImage.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:redImage];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.starWidths = (self.bounds.size.width - 8 * 4) / 5.f;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
