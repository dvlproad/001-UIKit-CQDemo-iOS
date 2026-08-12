//
//  UIColor+CQTS.h
//  CQDemoKit
//
//  Created by ciyouzen on 2026/8/13.
//  Copyright © 2026 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (CQTS)

/**
 *  从十六进制字符串获取颜色
 *
 *  @param hexString    颜色的值(支持@"#123456"、@"0X123456"、@"123456"三种格式)
 *  @param alpha    alpha
 *
 *  return  颜色
 */
+ (nullable UIColor *)cqts_hex:(NSString *)hexString alpha:(CGFloat)alpha NS_SWIFT_NAME(init(cqts_hex:alpha:));

/**
 *  从十六进制字符串获取颜色(字符串中已包含透明度)
 *
 *  @param hexStringAlpha    颜色和透明度的值(支持@"#123456FF"、@"0X123456FF"、@"123456FF"三种格式)
 *
 *  return  颜色
 */
+ (nullable UIColor *)cqts_hex:(NSString *)hexStringAlpha NS_SWIFT_NAME(init(cqts_hex:));

/**
 *  生成一个随机颜色
 *
 *  @param alpha    alpha
 *
 *  return  随机颜色
 */
+ (UIColor *)cqts_randomWithAlpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
