//
//  UIView+CQAuxiliaryTitle.m
//  CQDemoKit
//
//  Created by ciyouzen on 2026/8/13.
//  Copyright © 2026 dvlproad. All rights reserved.
//

#import "UIView+CQAuxiliaryTitle.h"
#import <Masonry/Masonry.h>

@implementation UIView (CQAuxiliaryTitle)

- (UIView *)cqts_withLeftTitle:(NSString *)title {
    UIView *titleView = [[UIView alloc] init];
    
    [titleView addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(titleView).mas_offset(-4);
        make.centerY.mas_equalTo(titleView);
    }];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentRight;
    [titleView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleView).mas_offset(4);
        make.right.mas_equalTo(self.mas_left).mas_offset(-4);
        make.centerY.mas_equalTo(titleView);
    }];
    
    label.text = title;
    return titleView;
}

- (UIView *)cqts_withTopTitle:(NSString *)title {
    UIView *titleView = [[UIView alloc] init];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentLeft;
    [titleView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleView).mas_offset(4);
        make.right.mas_equalTo(titleView).mas_offset(-4);
        make.top.mas_equalTo(titleView);
        make.height.mas_equalTo(20);
    }];
    
    [titleView addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleView).mas_offset(4);
        make.right.mas_equalTo(titleView).mas_offset(-4);
        make.top.mas_equalTo(label.mas_bottom).mas_offset(4);
    }];
    
    label.text = title;
    return titleView;
}

@end
