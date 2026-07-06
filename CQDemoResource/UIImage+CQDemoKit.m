//
//  UIImage+CQDemoKit.m
//  TSDemoDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "UIImage+CQDemoKit.h"

#pragma mark - 没使用 use_frameworks! 时候，资源的获取方式
@implementation UIImage (CQDemoKit)

+ (nullable UIImage *)cqdemokit_imageNamed:(NSString *)name {
    NSString *imageName = [NSString stringWithFormat:@"CQDemoKit.bundle/%@", name];
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}

+ (nullable UIImage *)cqdemokit_xcassetImageNamed:(NSString *)name {
    return [self cqdemokit_xcassetImageNamed:name withCache:YES];
}

+ (nullable UIImage *)cqdemokit_xcassetImageNamed:(NSString *)name withCache:(BOOL)shouldCache {
    if(name == nil || [name isEqualToString:@""]) {
        return nil;
    }
    
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
    
    // image
    UIImage *image;
    if (!shouldCache) {
        NSString *fileExtension = [name pathExtension];
        NSString *fileNameWithoutExtension = [[name lastPathComponent] stringByDeletingPathExtension];
        NSString *imagePath = [imageBundle pathForResource:fileNameWithoutExtension ofType:fileExtension];
        image = [UIImage imageWithContentsOfFile:imagePath];
    } else {
        image = [UIImage imageNamed:name inBundle:imageBundle compatibleWithTraitCollection:nil];
    }
    return image;
}

@end




#pragma mark - 使用 use_frameworks! 时候，资源的获取方式
@implementation UIImage (CQDemoKitFramework)

+ (nullable UIImage *)cqdemo_framework_imageNamed:(NSString *)imageName {
    if (!imageName || imageName.length == 0) {
        NSLog(@"[CQDemo] 警告：图片名称为空");
        return nil;
    }
    
    NSBundle *bundle = [NSBundle cqdemo_framework_resourceBundle];
    return [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
}

@end


@implementation NSBundle (CQDemoKitFramework)

+ (nullable NSBundle *)cqdemo_framework_resourceBundle {
    return [NSBundle cqdemo_framework_resourceBundle:@"CQDemoResource" ocClassName:@"CQTSLocImagesUtil"];
}

// 从指定OC类所在的 framework 中取出 resource bundle (来源: CJBaseUtil-Swift 的 Bundle+InFramework.swift)
+ (nullable NSBundle *)cqdemo_framework_resourceBundle:(NSString *)bundleName
                                           ocClassName:(NSString *)ocClassName {
    // 1. 参数校验
    if (!bundleName || bundleName.length == 0) {
        NSLog(@"[CQDemo] 警告：bundleName 为空");
        return nil;
    }
    
    if (!ocClassName || ocClassName.length == 0) {
        NSLog(@"[CQDemo] 警告：ocClassName 为空");
        return nil;
    }
    
    // 2. 通过 OC 类名获取 Class
    Class frameworkClass = NSClassFromString(ocClassName);
    if (!frameworkClass) {
        NSLog(@"[CQDemo] 警告：未找到类 %@", ocClassName);
        return nil;
    }
    
    // 3. 获取类所在的 Framework Bundle
    NSBundle *frameworkBundle = [NSBundle bundleForClass:frameworkClass];
    if (!frameworkBundle) {
        NSLog(@"[CQDemo] 警告：无法获取 framework bundle");
        return nil;
    }
    
    // 4. 从 Framework Bundle 中查找资源 bundle 的 URL
    NSURL *bundleURL = [frameworkBundle URLForResource:bundleName withExtension:@"bundle"];
    if (!bundleURL) {
        NSLog(@"[CQDemo] 警告：未找到 %@.bundle", bundleName);
        return nil;
    }
    
    // 5. 加载资源 bundle
    NSBundle *resourceBundle = [NSBundle bundleWithURL:bundleURL];
    if (!resourceBundle) {
        NSLog(@"[CQDemo] 警告：无法加载 %@.bundle", bundleName);
        return nil;
    }
    
    return resourceBundle;
}

@end
