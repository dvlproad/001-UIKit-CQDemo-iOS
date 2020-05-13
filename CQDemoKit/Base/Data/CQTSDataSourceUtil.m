//
//  CQTSDataSourceUtil.m
//  CJComplexUIKitDemo
//
//  Created by lcQian on 2020/4/7.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQTSDataSourceUtil.h"
#import <CQDemoKit/CJUIKitResoucesUtil.h>

@implementation CQTSDataSourceUtil

/// 获取测试用的数据
+ (NSMutableArray<CQTSDataModel *> *)__getTestDataModels {
    NSMutableArray<CQTSDataModel *> *dataModels = [[NSMutableArray alloc] init];
    {
        CQTSDataModel *dataModel = [[CQTSDataModel alloc] init];
        dataModel.name = @"1X透社";
        dataModel.imageUrl = [CJUIKitResoucesUtil cjts_iconImageUrl1];
        dataModel.badgeCount = 0;
        [dataModels addObject:dataModel];
    }
    {
        CQTSDataModel *dataModel = [[CQTSDataModel alloc] init];
        dataModel.name = @"2新鲜事";
        dataModel.imageUrl = [CJUIKitResoucesUtil cjts_iconImageUrl2];
        dataModel.badgeCount = 1;
        [dataModels addObject:dataModel];
    }
    {
        CQTSDataModel *dataModel = [[CQTSDataModel alloc] init];
        dataModel.name = @"3XX信";
        dataModel.imageUrl = [CJUIKitResoucesUtil cjts_iconImageUrl3];
        [dataModels addObject:dataModel];
    }
    {
        CQTSDataModel *dataModel = [[CQTSDataModel alloc] init];
        dataModel.name = @"4X角信";
        dataModel.badgeCount = 9;
        dataModel.imageUrl = [CJUIKitResoucesUtil cjts_iconImageUrl4];
        [dataModels addObject:dataModel];
    }
    {
        CQTSDataModel *dataModel = [[CQTSDataModel alloc] init];
        dataModel.name = @"5蓝精灵";
        dataModel.imageUrl = [CJUIKitResoucesUtil cjts_iconImageUrl5];
        dataModel.badgeCount = 10;
        [dataModels addObject:dataModel];
    }
    {
        CQTSDataModel *dataModel = [[CQTSDataModel alloc] init];
        dataModel.name = @"6年轻范";
        dataModel.badgeCount = 99;
        dataModel.imageUrl = [CJUIKitResoucesUtil cjts_iconImageUrl6];
        [dataModels addObject:dataModel];
    }
    {
        CQTSDataModel *dataModel = [[CQTSDataModel alloc] init];
        dataModel.name = @"7XX福";
        dataModel.imageUrl = [CJUIKitResoucesUtil cjts_iconImageUrl7];
        [dataModels addObject:dataModel];
    }
    {
        CQTSDataModel *dataModel = [[CQTSDataModel alloc] init];
        dataModel.name = @"8X之语";
        dataModel.badgeCount = 888;
        dataModel.imageUrl = [CJUIKitResoucesUtil cjts_iconImageUrl8];
        [dataModels addObject:dataModel];
    }
    {
        CQTSDataModel *dataModel = [[CQTSDataModel alloc] init];
        dataModel.name = @"我是6个字";
        dataModel.badgeCount = 888;
        dataModel.imageUrl = [CJUIKitResoucesUtil cjts_iconImageUrl8];
        [dataModels addObject:dataModel];
    }
    
    return dataModels;
}

@end
