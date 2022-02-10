//
//  TSResourceCollectionViewController.h
//  TSDemo_Demo
//
//  Created by ciyouzen on 8/10/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import <CQDemoKit/CJUIKitBaseCollectionHomeViewController.h>
#import "TSResourceEnum.h"

@interface TSResourceCollectionViewController : CJUIKitBaseCollectionHomeViewController {
    
}
- (instancetype)initWithRipeImageSource:(CQTSRipeImageSource)ripeImageSource NS_DESIGNATED_INITIALIZER;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end
