//
//  CJUIKitRandomUtil.h
//  CQDemoKit
//
//  Created by 李超前 on 2020/11/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJUIKitRandomUtil : NSObject

#pragma mark - C函数

/*
 *  获取随机的颜色
 *
 *  @return 随机的颜色
 */
UIKIT_EXTERN UIColor *cqtsRandomColor();

/*
 *  获取随机的字符串
 *
 *  @param maxLength    随机字符串的最大长度
 *  @param fixMaxLength 是否固定为最大长度
 *
 *  @return 随机的字符串
 */
UIKIT_EXTERN NSString *cqtsRandomString(NSInteger maxLength, BOOL fixMaxLength);

@end

NS_ASSUME_NONNULL_END
