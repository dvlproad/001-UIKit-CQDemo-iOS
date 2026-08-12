//
//  UIColor+CQTS.m
//  CQDemoKit
//
//  Created by ciyouzen on 2026/8/13.
//  Copyright © 2026 dvlproad. All rights reserved.
//

#import "UIColor+CQTS.h"

@implementation UIColor (CQTS)

+ (UIColor *)cqts_hex:(NSString *)hexString alpha:(CGFloat)alpha {
    unsigned int r, g, b;
    BOOL isValid = [self __cqtsParseHexString:hexString length:6 r:&r g:&g b:&b a:NULL];
    if (!isValid) {
        return nil;
    }
    
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)cqts_hex:(NSString *)hexStringAlpha {
    unsigned int r, g, b, a;
    BOOL isValid = [self __cqtsParseHexString:hexStringAlpha length:8 r:&r g:&g b:&b a:&a];
    if (!isValid) {
        return nil;
    }
    
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:((float)a / 255.0f)];
}

+ (UIColor *)cqts_randomWithAlpha:(CGFloat)alpha {
    return [UIColor colorWithRed:arc4random_uniform(256) / 255.0f
                           green:arc4random_uniform(256) / 255.0f
                            blue:arc4random_uniform(256) / 255.0f
                           alpha:alpha];
}

#pragma mark - Private Method
/**
 *  解析十六进制颜色字符串(去掉#、0X、0x前缀后，长度应为6位或8位)
 *
 *  @param hexString    颜色字符串(支持@"#123456"、@"0X123456"、@"123456"及带透明度的8位格式)
 *  @param length       期望长度(6:不带透明度; 8:带透明度)
 *  @param r            返回红色分量
 *  @param g            返回绿色分量
 *  @param b            返回蓝色分量
 *  @param a            返回透明度分量(不解析时传NULL)
 *
 *  return  是否解析成功
 */
+ (BOOL)__cqtsParseHexString:(NSString *)hexString
                      length:(NSUInteger)length
                           r:(unsigned int *)r
                           g:(unsigned int *)g
                           b:(unsigned int *)b
                           a:(unsigned int *)a
{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // 去掉前缀(去掉#、0X、0x)
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    // 字符串长度应为6位或8位(如@"123456"或@"123456FF")，不足则直接返回
    if (cString.length != length) {
        return NO;
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int parsedR, parsedG, parsedB;
    [[NSScanner scannerWithString:rString] scanHexInt:&parsedR];
    [[NSScanner scannerWithString:gString] scanHexInt:&parsedG];
    [[NSScanner scannerWithString:bString] scanHexInt:&parsedB];
    *r = parsedR;
    *g = parsedG;
    *b = parsedB;
    
    if (a) {
        NSString *aString = [cString substringWithRange:NSMakeRange(6, 2)];
        unsigned int parsedA;
        [[NSScanner scannerWithString:aString] scanHexInt:&parsedA];
        *a = parsedA;
    }
    
    return YES;
}

@end
