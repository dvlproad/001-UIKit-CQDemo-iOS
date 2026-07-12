//
//  TSDemo_Demo_Util.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSDemo_Demo_Util.h"
#import <CQDemoKit/UIImage+CQTSInFramework.h>

@implementation TSDemo_Demo_Util

+ (nullable NSBundle *)resourceBundle {
    NSString *bundleName = @"TSDemo_Demo";
    return [NSBundle cqts_framework_resourceBundle:bundleName ocClassName:NSStringFromClass([self class])];
}

+ (nullable UIImage *)imageNamed:(NSString *)name {
    NSBundle *resourceBundle = [self resourceBundle];
    UIImage *image = [UIImage imageNamed:name inBundle:resourceBundle withConfiguration:nil];
    return image;
}

@end
