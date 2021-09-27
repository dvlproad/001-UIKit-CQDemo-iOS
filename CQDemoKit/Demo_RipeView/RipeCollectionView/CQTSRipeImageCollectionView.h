//
//  CQTSRipeImageCollectionView.h
//  CJUIKitDemo
//
//  Created by ciyouzen on 8/10/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//
//  为了快速构建完整 Demo 工程提供的成熟的CollectionView(已含内容和事件)

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQTSRipeImageCollectionView : UICollectionView {
    
}
@property (nullable, nonatomic, copy) void(^cellConfigBlock)(UICollectionViewCell *bCell); /**< cell的UI定制（有时候需要cell和其所在列表的背景色为透明） */

#pragma mark - Init
/*
 *  初始化 竖直滚动的CollectionView
 *
 *  @param sectionRowCounts     每个section的itemCount个数(数组有多少个就多少个section，数组里的元素值为该section的row行数)
 *  @param perRowMaxShowCount   每行最大显示的item个数
 *
 *  @return 竖直滚动的CollectionView
 */
- (instancetype)initWithVerticalSectionRowCounts:(NSArray<NSNumber *> *)sectionRowCounts
                            perRowMaxColumnCount:(NSInteger)perRowMaxColumnCount;

/*
 *  初始化 水平滚动的CollectionView
 *
 *  @param sectionRowCounts     每个section的itemCount个数(数组有多少个就多少个section，数组里的元素值为该section的row行数)
 *  @param perColumnMaxRowCount 每列最大显示的item个数
 *
 *  @return 水平滚动的CollectionView
 */
- (instancetype)initWithHorizontalSectionRowCounts:(NSArray<NSNumber *> *)sectionRowCounts
                              perColumnMaxRowCount:(NSInteger)perColumnMaxRowCount;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

/* 初始化示例
CQTSRipeImageCollectionView *collectionView = [[CQTSRipeImageCollectionView alloc] initWithVerticalSectionRowCounts:@[@1, @3, @6, @8] perRowMaxColumnCount:3];
//CQTSRipeImageCollectionView *collectionView = [[CQTSRipeImageCollectionView alloc] initWithHorizontalSectionRowCounts:@[@1, @3, @6, @8] perColumnMaxRowCount:3];
collectionView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
collectionView.cellConfigBlock = ^(UICollectionViewCell * _Nonnull bCell) {
    bCell.contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    bCell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
};
*/

@end

NS_ASSUME_NONNULL_END
