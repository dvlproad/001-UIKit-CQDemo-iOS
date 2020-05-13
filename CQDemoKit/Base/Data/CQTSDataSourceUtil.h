//
//  CQTSDataSourceUtil.h
//  CJComplexUIKitDemo
//
//  Created by lcQian on 2020/4/7.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CQTSDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CQTSDataSourceUtil : NSObject

/// 获取测试用的数据
+ (NSMutableArray<CQTSDataModel *> *)__getTestDataModels;

@end

NS_ASSUME_NONNULL_END
