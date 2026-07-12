//
//  TSDemo_Demo_Util.h
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CQDemoKit/UIImageView+CQTSBaseUtil.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSDemo_Demo_Util : NSObject {
    
}

+ (nullable NSBundle *)resourceBundle;

+ (nullable UIImage *)imageNamed:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
