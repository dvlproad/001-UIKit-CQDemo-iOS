//
//  UIImage+CQTSInFramework.h
//  CQDemoKit
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//
/*
import Foundation
import CJBaseUtil_Swift

@objc public extension UIImage {
    @objc public static func cqdemo_framework_imageNamed(_ imageName: String) -> UIImage? {
        if let bundle = Bundle.cqdemo_framework_resourceBundle() {
            let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
            return image
        }
        return nil
    }
}

@objc public extension Bundle {
    @objc public static func cqdemo_framework_resourceBundle() -> Bundle? {
        return Bundle.frameworkResourceBundle("CQDemoResource", ocClassName: "CQTSLocImagesUtil")
        
    }
}
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 没使用 use_frameworks! 时候，资源的获取方式
@interface UIImage (CQTSInFramework)

+ (nullable UIImage *)cqts_imageNamed:(nullable NSString *)name
                            withCache:(BOOL)shouldCache
                             inBundle:(nullable NSBundle *)imageBundle;

@end




#pragma mark - 使用 use_frameworks! 时候，资源的获取方式

@interface NSBundle (CQTSInFramework)

+ (nullable NSBundle *)cqts_framework_resourceBundle:(NSString *)bundleName
                                         ocClassName:(NSString *)ocClassName;

@end

NS_ASSUME_NONNULL_END
