//
//  UIImage+CQDemoResource.h
//  CQDemoResource
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

@interface UIImage (CQDemoResource)

//+ (nullable UIImage *)cqdemokit_imageNamed:(NSString *)name __attribute((deprecated("已废弃，请使用doraemon_xcassetImageNamed")));

+ (nullable UIImage *)cqresource_imageNamed:(NSString *)name;
+ (nullable UIImage *)cqresource_cache_imageNamed:(NSString *)name;

@end



@interface NSBundle (CQDemoResource)

+ (nullable NSBundle *)cqdemo_framework_resourceBundle;

@end

NS_ASSUME_NONNULL_END
