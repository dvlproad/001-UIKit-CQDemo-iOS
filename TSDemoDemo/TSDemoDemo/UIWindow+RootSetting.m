//
//  UIWindow+RootSetting.m
//  CQShareDemo
//
//  Created by ciyouzen on 2018/4/12.
//  Copyright © 2018 dvlproad. All rights reserved.
//

#import "UIWindow+RootSetting.h"
#import <CQDemoKit/CQTSFPSView.h>
#import <TSDemo_Demo/TSTabBarViewController.h>
#import <TSDemo_Demo_Swift/TSDemo_Demo_Swift-Swift.h>

#import <CQDemoKit/CQDMModuleModel.h>
#import <InjectHotReload/InjectHotReload-Swift.h>
#import "TSDemoDemo-Swift.h"

#import "ViewController.h"

@implementation UIWindow (RootSetting)

- (void)settingRoot {
    [self setBackgroundColor:[UIColor whiteColor]];
    // 只直接测试某个页面
//    UIViewController *rootViewController = [[UINavigationController alloc] initWithRootViewController:UIViewController.new];
//    if (@available(iOS 15.0, *)) {
//        UIViewController *viewController = [[TSSFUIViewController alloc] init];
//        rootViewController = [[UINavigationController alloc] initWithRootViewController:viewController];
//        rootViewController = viewController;
//    }
//    UIViewController *viewController = [[NSClassFromString(@"BaseUIHomeViewController") alloc] init];
//    UIViewController *rootViewController = [[UINavigationController alloc] initWithRootViewController:viewController];
//    UIViewController *rootViewController = [[NSClassFromString(@"TSTabBarViewController") alloc] init];
    UIViewController *rootViewController = [[TSTabBarViewController alloc] init];
//    UIViewController *rootViewController = [[ViewController alloc] init];
    
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
//    [InjectHelper setupInjection];
    
    #if DEBUG
        [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
    #endif
    rootViewController.view.backgroundColor = [UIColor redColor];
    
//    rootViewController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    self.rootViewController = rootViewController;
    [self makeKeyAndVisible];
    
    [CQTSFPSView showInSuperView:self];
}

@end
