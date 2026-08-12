//
//  CQTSActionButtonsBuilder.h
//  CJUIKitDemo
//
//  Created by ciyouzen on 2026/8/13.
//  Copyright © 2026 dvlproad. All rights reserved.
//
//  创建一排普通功能按钮（每个按钮独立 actionBlock，非单选）的便捷封装

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQTSActionButtonsBuilder : NSObject

/// 创建一排普通功能按钮（每个按钮独立 actionBlock，非单选）
///
/// @param block 在 block 中配置 axisType/fixedSpacing 并逐个 addButtonWithTitle:actionBlock:
///
/// @return containerView（内部按钮等宽/等高均分排列，间距为 fixedSpacing）
+ (UIView *)makeButtonsViewUsingBlock:(void(^ _Nonnull)(CQTSActionButtonsBuilder *make))block;

/// 按钮排列方向（默认 MASAxisTypeVertical）
@property (nonatomic, assign) MASAxisType axisType;
/// 按钮间距（默认 10）
@property (nonatomic, assign) CGFloat fixedSpacing;

/// 添加一个按钮（默认 themeBGButton 样式）
- (void)addButtonWithTitle:(NSString *)title
               actionBlock:(void(^ _Nullable)(UIButton *bButton))actionBlock;

@end

NS_ASSUME_NONNULL_END
