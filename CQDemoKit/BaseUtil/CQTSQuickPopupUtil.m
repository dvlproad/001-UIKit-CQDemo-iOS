//
//  CQTSQuickPopupUtil.m
//  CQDemoKit
//
//  Created by ciyouzen on 2026/08/04.
//

#import "CQTSQuickPopupUtil.h"

#import "CQTSBottomBlankView.h"

@implementation CQTSQuickPopupUtil

+ (nullable CQTSBottomBlankView *)showWindowBottomClearView:(UIView *)contentView
                                                    height:(CGFloat)popupViewHeight
                                          tapBlankComplete:(void(^ _Nullable)(CQTSBottomBlankView *bBlankView))tapBlankComplete
{
    if (contentView == nil) {
        return nil;
    }
    CQTSBottomBlankView *blankView = [[CQTSBottomBlankView alloc] initWithPopupView:contentView
                                                                 popupViewHeight:popupViewHeight
                                                                 tapBlankComplete:tapBlankComplete];
    [blankView showBlankViewInView:nil complete:nil];
    return blankView;
}

@end
