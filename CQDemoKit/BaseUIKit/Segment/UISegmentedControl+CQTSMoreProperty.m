//
//  UISegmentedControl+CQTSMoreProperty.m
//  CQDemoKit
//
//  Created by ciyouzen on 2026/8/13.
//  Copyright © 2026 dvlproad. All rights reserved.
//

#import "UISegmentedControl+CQTSMoreProperty.h"
#import <objc/runtime.h>

static NSString * const cqts_segmentValueChangedBlockKey = @"cqts_segmentValueChangedBlockKey";

@implementation UISegmentedControl (CQTSMoreProperty)

#pragma mark - runtime

// cqtsValueChangedBlock
- (void (^)(UISegmentedControl *))cqtsValueChangedBlock {
    return objc_getAssociatedObject(self, (__bridge const void *)(cqts_segmentValueChangedBlockKey));
}

- (void)setCqtsValueChangedBlock:(void (^)(UISegmentedControl *))cqtsValueChangedBlock {
    objc_setAssociatedObject(self, (__bridge const void *)(cqts_segmentValueChangedBlockKey), cqtsValueChangedBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    //设置的时候，就给他添加方法，省得再多个接口处理
    [self addTarget:self action:@selector(__cqtsSegmentValueChanged:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Private Method
// 选中值变化
- (void)__cqtsSegmentValueChanged:(UISegmentedControl *)segment {
    if (self.cqtsValueChangedBlock) {
        self.cqtsValueChangedBlock(segment);
    }
}

@end
