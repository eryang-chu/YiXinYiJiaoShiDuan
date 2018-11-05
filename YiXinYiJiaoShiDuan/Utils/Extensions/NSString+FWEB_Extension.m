//
//  NSString+FWEB_Extension.m
//  fuwuEbao
//
//  Created by Jiao on 2018/8/8.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import <CoreText/CoreText.h>
#import "NSString+FWEB_Extension.h"

NSString *phoneRegex = @"^1\\d{10}";

@implementation NSString (FWEB_Extension)
- (id)jsonstringToObject {
    if (self == nil) {
        
        return nil;
        
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    id dic = [NSJSONSerialization JSONObjectWithData:jsonData
              
                                             options:NSJSONReadingMutableContainers
              
                                               error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
}

- (NSString *)removeHeaderAndFooterWhiteSpeace {
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (BOOL)checkStringWithRegex:(NSString *)regex {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

+ (NSString *)timeStringWithFormat:(NSString *)format date:(NSDate *)date {
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:format];
    return [dateformat stringFromDate:date];
}

+ (NSString *)timeStringWithFormat:(NSString *)format timeInteral:(NSTimeInterval)timeInteral multiple:(NSUInteger)multiple{
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:format];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInteral/multiple];
    return [dateformat stringFromDate:date];
}

- (NSDate *)dateWithFormat:(NSString *)format {
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:format];
    NSDate *date = [dateformat dateFromString:self];
    return date;
}

- (CGFloat)labelHeightWithFont:(UIFont *)font labelMaxHeight:(CGFloat)labelMaxHeight labelWidth:(CGFloat)labelWidth {
    CGFloat height = [self boundingRectWithSize:CGSizeMake(labelWidth, labelMaxHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.height;
    
    return height + 1;
    
}

- (CGFloat)labelHeightWithFont:(UIFont *)font labelWidth:(CGFloat)labelWidth {
    return [self labelHeightWithFont:font labelMaxHeight:CGFLOAT_MAX labelWidth:labelWidth];
}

- (CGFloat)labelWidthWithFont:(UIFont *)font labelHeight:(CGFloat)labelHeight {
    return [self labelWidthWithFont:font labelMaxWidth:CGFLOAT_MAX labelHeight:labelHeight];
}

- (CGFloat)labelWidthWithFont:(UIFont *)font labelMaxWidth:(CGFloat)labeMaxWidth labelHeight:(CGFloat)labelHeight {
    CGFloat width = [self boundingRectWithSize:CGSizeMake(labeMaxWidth, labelHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.width;
    return width + 1;
}

- (NSString *)floatStringTruncateWithMaxReservedDecimalPointDigit:(NSInteger)digit {
    if (self.length == 0) {
        return @"0";
    }
    if ([self rangeOfString:@"."].length == 0) {    //不是小数
        return self;
    }
    NSMutableString *formatString = [NSMutableString stringWithString:@"%.f"];
    [formatString insertString:[NSString stringWithFormat:@"%ld", (long)digit] atIndex:2];
    NSString *truncatedStr = [NSString stringWithFormat:formatString, self.doubleValue];
    NSString *rs = [NSString stringWithFormat:@"%@", @(truncatedStr.doubleValue)];
    return rs;
}

- (NSString *)MD5 {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}

- (NSURL *)toUrl {
    NSString *string = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    return [NSURL URLWithString:string];
}

- (BOOL)stringContainsEmoji {
    __block BOOL returnValue =NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800) {
            if (0xd800 <= hs && hs <= 0xdbff) {
                if (substring.length > 1) {
                    const unichar ls = [substring characterAtIndex:1];
                    const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                    if (0x1d000 <= uc && uc <= 0x1f77f) {
                        returnValue =YES;
                    }
                }
            }else if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                if (ls == 0x20e3) {
                    returnValue =YES;
                }
            }else {
                if (0x2B05 <= hs && hs <= 0x2b07) {
                    returnValue =YES;
                }else if (0x2934 <= hs && hs <= 0x2935) {
                    returnValue =YES;
                }else if (0x3297 <= hs && hs <= 0x3299) {
                    returnValue =YES;
                }else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                    returnValue =YES;
                }
            }
        }
    }];
    return returnValue;
}
-(BOOL)isConformMoneyFormatWithChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //      if (textField.text.length > 10) {
    //            return range.location < 11;
    //            }else{
    BOOL isHaveDian = YES;
    if ([self rangeOfString:@"."].location==NSNotFound) {
        isHaveDian=NO;
    }
    if ([string length]>0)
    {
        unichar single=[string characterAtIndex:0];//当前输入的字符
        
        if ((single >='0' && single<='9') || single=='.')//数据格式正确
        {
            //首字母不能为小数点
            if([self length]==0){
                if(single == '.'){
                    [self stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                    
                }
            }
            if([self length]==1 && [self isEqualToString:@"0"]){
                if(single != '.'){
                    [self stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                    
                }
            }
            if (single=='.')
            {
                if(!isHaveDian)//text中还没有小数点
                {
                    isHaveDian=YES;
                    return YES;
                }else
                {
                    [self stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            else
            {
                if (isHaveDian)//存在小数点
                {
                    //判断小数点的位数
                    NSRange ran=[self rangeOfString:@"."];
                    NSInteger tt=range.location-ran.location;
                    if (tt <= 2){
                        return YES;
                    }else{
                        return NO;
                    }
                }
                else
                {
                    return YES;
                }
            }
        }else{//输入的数据格式不正确
            [self stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    else
    {
        return YES;
    }
}

- (NSArray *)getLinesArrayOfStringFont:(UIFont *)font andLableWidth:(CGFloat)lableWidth {
    
    CTFontRef myFont = CTFontCreateWithName(( CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge  id)myFont range:NSMakeRange(0, attStr.length)];
    CFRelease(myFont);
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(( CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,lableWidth,100000));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef = (__bridge  CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [self substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithInt:0.0]));
        [linesArray addObject:lineString];
    }
    
    CGPathRelease(path);
    CFRelease( frame );
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}

//返回 /Date(1445340103367)/ 时间，转换成 2015-10-20 19:21 这种格式
+ (NSString *)interceptTimeStampFromStr:(NSString *)string{
    if (!string || [string length] == 0 ) // 传入时间戳为空 返回
    {
        return @"";
    }
    NSMutableString * mutableStr = [NSMutableString stringWithString:string];
    NSString * timeStampString = [NSString string];
    //  遍历取出括号内的时间戳
    for (int i = 0; i < string.length; i ++) {
        NSRange startRang = [mutableStr rangeOfString:@"("];
        NSRange endRang = [mutableStr rangeOfString:@")"];
        if (startRang.location != NSNotFound) {
            // 左边括号位置
            NSInteger leftLocation = startRang.location;
            // 右边括号距离左边括号的长度
            NSInteger rightLocation = endRang.location - startRang.location;
            // 截取括号时间戳内容
            timeStampString = [mutableStr substringWithRange:NSMakeRange(leftLocation + 1,rightLocation - 1)];
        }
    }
    
    // 把时间戳转化成时间
    NSTimeInterval interval=[timeStampString doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"yyyy-MM-dd"];//年月日时分秒
    NSString * timeStr = [NSString stringWithFormat:@"%@",[objDateformat stringFromDate: date]];
    return timeStr;
}

@end
