//
//  CQTSActionButtonsBuilder.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2026/8/13.
//  Copyright © 2026 dvlproad. All rights reserved.
//

#import "CQTSActionButtonsBuilder.h"
#import "CQTSButtonFactory.h"

@interface CQTSActionButtonsBuilder ()

@property (nonatomic, strong, nonnull) NSMutableArray<UIButton *> *buttons;

@end

@implementation CQTSActionButtonsBuilder

- (instancetype)init {
    self = [super init];
    if (self) {
        _axisType = MASAxisTypeVertical;
        _fixedSpacing = 10;
        _buttons = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addButtonWithTitle:(NSString *)title
               actionBlock:(void(^)(UIButton *bButton))actionBlock {
    UIButton *button = [CQTSButtonFactory themeBGButtonWithTitle:title actionBlock:actionBlock];
    [self.buttons addObject:button];
}

+ (UIView *)makeButtonsViewUsingBlock:(void(^)(CQTSActionButtonsBuilder *make))block {
    CQTSActionButtonsBuilder *make = [[CQTSActionButtonsBuilder alloc] init];
    !block ?: block(make);
    
    NSArray<UIView *> *subviews = make.buttons;
    NSAssert(subviews.count >= 0, @"视图个数不能为空");
    if (subviews.count == 1) {
        UIView *view = subviews[0];
        return view;
    }
    
    UIView *containerView = [[UIView alloc] init];
    for (UIView *view in subviews) {
        [containerView addSubview:view];
    }
    
    if (make.axisType == MASAxisTypeHorizontal) {
        [subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:make.fixedSpacing leadSpacing:0 tailSpacing:0];
        [subviews mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(containerView);
        }];
        
    } else {
        [subviews mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:make.fixedSpacing leadSpacing:0 tailSpacing:0];
        [subviews mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(containerView);
        }];
    }
    
    return containerView;
}

@end
