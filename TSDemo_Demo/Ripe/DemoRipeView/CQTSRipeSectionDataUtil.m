//
//  CQTSRipeSectionDataUtil.m
//  CJComplexUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "CQTSRipeSectionDataUtil.h"
#import <CQDemoKit/UIImageView+CQTSBaseUtil.h>
#import <CQDemoResource/CQTSAssetModelGetter.h>

@implementation CQTSRipeSectionDataUtil

#pragma mark - Init
/*
 *  获取 sectionModels
 *
 *  @param fileExtensions               要获取哪些文件后缀的文件
 *  @param sectionRowCounts             每个section的rowCount个数(数组有多少个就多少个section，数组里的元素值为该section的row行数)
 *  @param selectedIndexPaths           选中的indexPath数组
 *
 *  @return sectionModels
 */
+ (NSMutableArray<CQDMSectionDataModel *> *)sectionModelsWithExtensions:(NSArray<NSString *> *)fileExtensions
                                                       sectionRowCounts:(NSArray<NSNumber *> *)sectionRowCounts
                                                    selectedIndexPaths:(nullable NSArray<NSIndexPath *> *)selectedIndexPaths
{
    NSMutableArray<CQDMSectionDataModel *> *sectionDataModels = [[NSMutableArray alloc] init];
    for (int section = 0; section < sectionRowCounts.count; section++) {
        NSNumber *nRowCount = [sectionRowCounts objectAtIndex:section];
        NSInteger iRowCount = [nRowCount integerValue];
        
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = [NSString stringWithFormat:@"section %d", section];
        sectionDataModel.values = [CQTSAssetModelGetter localFileModelsWithCount:iRowCount randomOrder:NO fileExtensions:fileExtensions];
        for (int item = 0; item < iRowCount; item++) {
            CQTSLocImageDataModel *module = [sectionDataModel.values objectAtIndex:item];
            module.name = [NSString stringWithFormat:@"%d-%02zd", section, item];
            
            BOOL isSelected = [selectedIndexPaths containsObject:[NSIndexPath indexPathForItem:item inSection:section]];
            module.selected = isSelected;
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
//    NSMutableArray<CQDMSectionDataModel *> *sectionDataModels = [self sectionModelsWithCounts:sectionRowCounts selectedIndexPaths:selectedIndexPaths sectionValuesGetter:^NSArray<id> *(NSInteger section, NSInteger valueCount) {
//        NSArray *values = [CQTSAssetModelGetter localFileModelsWithCount:valueCount randomOrder:NO fileExtensions:fileExtensions];
//        return values;
//    }];
        
    return sectionDataModels;
}


/*
 *  获取 sectionModels
 *
 *  @param buttonTitles                 按钮的标题数组
 *
 *  @return sectionModels
 */
+ (NSMutableArray<CQDMSectionDataModel *> *)sectionModelsWithTitles:(NSArray<NSString *> *)buttonTitles
{
    NSArray<NSString *> *imageExtensions = @[@"png", @"jpg"];
    
    NSNumber *number = [NSNumber numberWithInteger:buttonTitles.count];
    NSArray<NSNumber *> *sectionRowCounts = @[number];
    
    return [self sectionModelsWithExtensions:imageExtensions sectionRowCounts:sectionRowCounts selectedIndexPaths:nil];
}

/*
 *  获取 sectionModels
 *
 *  @param fileExtensions               要获取哪些文件后缀的文件
 *  @param sectionRowCounts             每个section的rowCount个数(数组有多少个就多少个section，数组里的元素值为该section的row行数)
 *  @param sectionValuesGetter          section 要返回 valueCount 个 value 的 values获取方法
 *
 *  @return sectionModels
 */
+ (NSMutableArray<CQDMSectionDataModel *> *)sectionModelsWithCounts:(NSArray<NSNumber *> *)sectionRowCounts
                                                 selectedIndexPaths:(nullable NSArray<NSIndexPath *> *)selectedIndexPaths
                                                sectionValuesGetter:(NSArray<id> *(^)(NSInteger section, NSInteger valueCount))sectionValuesGetter
{
    NSMutableArray<CQDMSectionDataModel *> *sectionDataModels = [[NSMutableArray alloc] init];
    for (int section = 0; section < sectionRowCounts.count; section++) {
        NSNumber *nRowCount = [sectionRowCounts objectAtIndex:section];
        NSInteger iRowCount = [nRowCount integerValue];
        
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = [NSString stringWithFormat:@"section %d", section];
        sectionDataModel.values = sectionValuesGetter(section, iRowCount);
        for (int item = 0; item < iRowCount; item++) {
            CQTSLocImageDataModel *module = [sectionDataModel.values objectAtIndex:item];   // 需要处理后，此方法才能使用
            module.name = [NSString stringWithFormat:@"%d-%02zd", section, item];
            
            BOOL isSelected = [selectedIndexPaths containsObject:[NSIndexPath indexPathForItem:item inSection:section]];
            module.selected = isSelected;
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    return sectionDataModels;
}

@end
