//
//  UIImage+CQDemoResource.m
//  CQDemoResource
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "UIImage+CQDemoResource.h"
#import <CQDemoKit/UIImage+CQTSInFramework.h>

@implementation UIImage (CQDemoResource)
/*
+ (nullable UIImage *)cqdemokit_imageNamed:(NSString *)name {
    NSString *imageName = [NSString stringWithFormat:@"CQDemoKit.bundle/%@", name];
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}
*/
+ (nullable UIImage *)cqresource_imageNamed:(NSString *)name {
    return [self cqresource_imageNamed:name withCache:NO];
}

+ (nullable UIImage *)cqresource_cache_imageNamed:(NSString *)name {
    return [self cqresource_imageNamed:name withCache:YES];
}

+ (nullable UIImage *)cqresource_imageNamed:(NSString *)name withCache:(BOOL)shouldCache {
    // bundle 获取
    /*
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(@"CQTSLocImagesUtil")];
    if (bundle == nil) {
        return nil;
    }
    NSURL *url = [bundle URLForResource:@"CQDemoKit" withExtension:@"bundle"];
    if (url == nil) {
        return nil;
    }
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    */
    NSBundle *imageBundle = [NSBundle cqdemo_framework_resourceBundle];
    
    return [self cqts_imageNamed:name withCache:shouldCache inBundle:imageBundle];
}

@end



@implementation NSBundle (CQDemoResource)

+ (nullable NSBundle *)cqdemo_framework_resourceBundle {
    return [NSBundle cqts_framework_resourceBundle:@"CQDemoResource" ocClassName:@"CQTSLocImagesUtil"];
}

@end
