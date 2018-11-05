//
//  NSString+FWEB_Extension.h
//  fuwuEbao
//
//  Created by Jiao on 2018/8/8.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

extern NSString *phoneRegex;

@interface NSString (FWEB_Extension)
/**
 动态计算label高度
 
 @param font label字体
 @param labelWidth label宽度
 @return label高度
 */
- (CGFloat)labelHeightWithFont:(UIFont *)font labelWidth:(CGFloat)labelWidth;
- (CGFloat)labelHeightWithFont:(UIFont *)font labelMaxHeight:(CGFloat)labelMaxHeight labelWidth:(CGFloat)labelWidth;

/**
 动态计算label宽度
 
 @param font  label字体
 @param labelHeight label高度
 @return label宽度
 */
- (CGFloat)labelWidthWithFont:(UIFont *)font labelHeight:(CGFloat)labelHeight;
- (CGFloat)labelWidthWithFont:(UIFont *)font labelMaxWidth:(CGFloat)labeMaxWidth labelHeight:(CGFloat)labelHeight;
/**
 时间字符串转date
 
 @param format 格式
 @return data
 */
- (NSDate *)dateWithFormat:(NSString *)format;

+ (NSString *)timeStringWithFormat:(NSString *)format date:(NSDate *)date;

//  时间字符串
//  format          格式
//  timeInteral     时间戳
//  multiple        倍数 -- timeInteral 单位为毫秒 multiple则为1000， timeInteral 单位为秒 multiple则为1
+ (NSString *)timeStringWithFormat:(NSString *)format timeInteral:(NSTimeInterval)timeInteral multiple:(NSUInteger)multiple;

//  字符串移除首尾空格
- (NSString *)removeHeaderAndFooterWhiteSpeace;

/**
 *  截取小数点位数,最多保留digit位,且小数点后多余的0将被去掉.
 *
 *  @param digit 小数点后最多保留位数
 *
 *  @return 返回一个截取后的小数字符串对象
 */
- (NSString *)floatStringTruncateWithMaxReservedDecimalPointDigit:(NSInteger)digit;

//  字符串md5加密
//  signString: 加密使用的字符串
- (NSString *)MD5;

//  校验字符串组合是否符合相应的规则
//  regex: 字符串规则的正则表达式
- (BOOL)checkStringWithRegex:(NSString *)regex;


/**
 检查是否包含表情
 
 @return yes 包含表情 no 不包含
 */
- (BOOL)stringContainsEmoji;

- (NSURL *)toUrl;

- (id)jsonstringToObject;

/**
 检查是否符合金额格式（保留两位小数，不需要多位小数）
 
 @param range 输入String的Range
 @param string 输入String
 */
-(BOOL)isConformMoneyFormatWithChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;


/**
 label 每行包含的文字
 
 @param font font
 @param lableWidth lableWidth
 */
- (NSArray *)getLinesArrayOfStringFont:(UIFont *)font andLableWidth:(CGFloat)lableWidth;

//返回 /Date(1445340103367)/ 时间，转换成 2015-10-20这种格式
+ (NSString *)interceptTimeStampFromStr:(NSString *)string;
@end
