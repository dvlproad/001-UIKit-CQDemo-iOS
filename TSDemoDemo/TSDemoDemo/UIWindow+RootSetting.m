//
//  UIWindow+RootSetting.m
//  CQShareDemo
//
//  Created by ciyouzen on 2018/4/12.
//  Copyright © 2018 dvlproad. All rights reserved.
//

#import "UIWindow+RootSetting.h"
#import <CQDemoKit/CQTSFPSView.h>

#import <CQDemoKit/CQDMModuleModel.h>
#import "TSDemoDemo-Swift.h"

@implementation UIWindow (RootSetting)

- (void)settingRoot {
    [self setBackgroundColor:[UIColor whiteColor]];
    // 只直接测试某个页面
//    UIViewController *rootViewController = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"BaseUIHomeViewController") alloc] init]];
    UIViewController *rootViewController = [[NSClassFromString(@"TSTabBarViewController") alloc] init];
    
//    UIViewController *rootViewController = [[TSPackViewController alloc] init];
    /*
    // 测试 SwiftUI
    UIViewController *swiftuiViewController;
    if (@available(iOS 15.0, *)) {
        UIView *tsView = [[TSTSUIView alloc] init];
        swiftuiViewController = [CQDMModuleModel viewControllWithTitle:@"测试SwiftUI" tsview:tsView];
    } else {
        swiftuiViewController = [[UIViewController alloc] init];
    }
    UIViewController *rootViewController = [[UINavigationController alloc] initWithRootViewController:swiftuiViewController];
    */
    
    self.rootViewController = rootViewController;
    [self makeKeyAndVisible];
    
    [CQTSFPSView showInSuperView:self];
}

@end
