//
//  JZD_ServeCalendarCollectionViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/13.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, JZD_ServeCalendarCollectionViewCellType) {
    JZD_ServeCalendarCollectionViewCellTypeNormal, //
    JZD_ServeCalendarCollectionViewCellTypeToday, //今天
    JZD_ServeCalendarCollectionViewCellTypecampus,//有课
    JZD_ServeCalendarCollectionViewCellTypeLeave,//缺勤
};

@interface JZD_ServeCalendarCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (nonatomic, assign) JZD_ServeCalendarCollectionViewCellType cellType;
@end
