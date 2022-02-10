//
//  TSRipeCollectionViewController.h
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//
//  测试 为了快速构建完整 Demo 工程提供的一些DemoView之CQTSRipeTableView

#import "CJUIKitBaseViewController.h"
#import "CQTSRipeImageCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TSRipeCollectionViewController : CJUIKitBaseViewController {
    
}
- (instancetype)initWithRipeImageSource:(CQTSRipeImageSource)ripeImageSource NS_DESIGNATED_INITIALIZER;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
