//
//  CQTSQuickPopupUtil.m
//  CQDemoKit
//
//  Created by ciyouzen on 2026/08/04.
//

#import "CQTSQuickPopupUtil.h"

#import "CQTSQuickPopupView.h"

@implementation CQTSQuickPopupUtil

+ (nullable CQTSQuickPopupView *)showWindowBottomClearView:(UIView *)contentView
                                                    height:(CGFloat)popupViewHeight
                                          tapBlankComplete:(void(^ _Nullable)(CQTSQuickPopupView *bBlankView))tapBlankComplete
{
    if (contentView == nil) {
        return nil;
    }
    CQTSQuickPopupView *blankView = [[CQTSQuickPopupView alloc] initWithPopupView:contentView
                                                                 popupViewHeight:popupViewHeight
                                                                 tapBlankComplete:tapBlankComplete];
    [blankView showBlankViewInView:nil complete:nil];
    return blankView;
}

@end
