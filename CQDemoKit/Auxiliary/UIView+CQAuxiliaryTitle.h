//
//  UIView+CQAuxiliaryTitle.h
//  CQDemoKit
//
//  Created by ciyouzen on 2026/8/13.
//  Copyright © 2026 dvlproad. All rights reserved.
//
//  给任意视图添加title(左侧/顶部)（容器式，区别于叠加式的 UIView+CQAuxiliaryText）

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CQAuxiliaryTitle)

/// title 在左，返回容器（label + self），label 右对齐、垂直居中
- (UIView *)cqts_withLeftTitle:(NSString *)title;

/// title 在顶部，返回容器（label + self），label 左对齐
- (UIView *)cqts_withTopTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
