//
//  CJUIKitBaseScrollViewController.h
//  CJUIKitDemo
//
//  Created by ciyouzen on 2015/12/23.
//  Copyright © 2015年 dvlproad. All rights reserved.
//

#import "CJUIKitBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CJUIKitBaseScrollViewController : CJUIKitBaseViewController {
    
}
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *containerView;

/**
 *  更新ScrollView的高（如果视图滚动异常，请检查你的视图是不是加在了self.view上了。而不是self.containerView上）
 *  @brief  ①如果没有lastBottomView来确认scrollView的高，那么高为根据父视图设置；
 ②如果有lastBottomView，则通过设置scrollView的containerView与lastBottomView的底部间隔来更新ScrollView的高
 *
 *  @param bottomInterval bottomInterval
 *  @param lastBottomView lastBottomView(可为nil)
 */
- (void)updateScrollHeightWithBottomInterval:(CGFloat)bottomInterval
                   accordingToLastBottomView:(UIView *)lastBottomView;

@end

NS_ASSUME_NONNULL_END
