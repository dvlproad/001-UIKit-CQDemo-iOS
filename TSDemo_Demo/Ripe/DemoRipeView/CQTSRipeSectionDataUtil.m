//
//  CQTSRipeSectionDataUtil.m
//  CJComplexUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "CQTSRipeSectionDataUtil.h"
#import <CQDemoResource/CQTSAssetModelGetter.h>

@implementation CQTSRipeSectionDataUtil

#pragma mark - Init
/*
 *  获取 sectionModels
 *
 *  @param sectionRowCounts             每个section的rowCount个数(数组有多少个就多少个section，数组里的元素值为该section的row行数)
 *  @param selectedIndexPaths           选中的indexPath数组
 *  @param folderNames                  要获取哪些文件夹下的文件
 *
 *  @return sectionModels
 */
+ (NSMutableArray<CQDMSectionDataModel *> *)sectionModelsWithCounts:(NSArray<NSNumber *> *)sectionRowCounts
                                                 selectedIndexPaths:(nullable NSArray<NSIndexPath *> *)selectedIndexPaths
                                                        folderNames:(NSArray<NSString *> *)folderNames
{
    NSMutableArray<CQDMSectionDataModel *> *sectionDataModels = [[NSMutableArray alloc] init];
    for (int section = 0; section < sectionRowCounts.count; section++) {
        NSNumber *nRowCount = [sectionRowCounts objectAtIndex:section];
        NSInteger iRowCount = [nRowCount integerValue];
        NSArray *iSectionValues = [CQTSAssetModelGetter localFileModelsWithCount:iRowCount randomOrder:NO folderNames:folderNames];
        
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = [NSString stringWithFormat:@"section %d", section];
        sectionDataModel.values = iSectionValues;
        for (int item = 0; item < iRowCount; item++) {
            CQTSLocImageDataModel *module = [iSectionValues objectAtIndex:item];   // 需要处理后，此方法才能使用
            module.name = [NSString stringWithFormat:@"%d-%02zd", section, item];
            
            BOOL isSelected = [selectedIndexPaths containsObject:[NSIndexPath indexPathForItem:item inSection:section]];
            module.selected = isSelected;
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    return sectionDataModels;
}

@end
