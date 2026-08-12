//
//  UISegmentedControl+CQTSMoreProperty.h
//  CQDemoKit
//
//  Created by ciyouzen on 2026/8/13.
//  Copyright © 2026 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISegmentedControl (CQTSMoreProperty)

@property (nonatomic, copy) void (^cqtsValueChangedBlock)(UISegmentedControl *segment);   /**< 设置选中值变化的事件 */

@end

NS_ASSUME_NONNULL_END
