//
//  CQTSRipeImageCollectionView.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 8/10/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import "CQTSRipeImageCollectionView.h"
#import "CQTSRipeImageCollectionViewCell.h"
#import <CQDemoKit/CQTSLocImagesUtil.h>

@interface CQTSRipeImageCollectionView () <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource> {
    
}
@property (nonatomic, strong) NSArray<NSNumber *> *sectionRowCounts;    /**< 每个section的rowCount个数 */
@property (nonatomic, assign, readonly) CGFloat perMaxCount;   /**< 每行/每列个数 */

@end


@implementation CQTSRipeImageCollectionView

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
                            perRowMaxColumnCount:(NSInteger)perRowMaxColumnCount
{
    return [self initWithSectionRowCounts:sectionRowCounts perMaxCount:perRowMaxColumnCount scrollDirection:UICollectionViewScrollDirectionVertical];
}

/*
 *  初始化 水平滚动的CollectionView
 *
 *  @param sectionRowCounts     每个section的itemCount个数(数组有多少个就多少个section，数组里的元素值为该section的row行数)
 *  @param perColumnMaxRowCount 每列最大显示的item个数
 *
 *  @return 水平滚动的CollectionView
 */
- (instancetype)initWithHorizontalSectionRowCounts:(NSArray<NSNumber *> *)sectionRowCounts
                              perColumnMaxRowCount:(NSInteger)perColumnMaxRowCount
{
    return [self initWithSectionRowCounts:sectionRowCounts perMaxCount:perColumnMaxRowCount scrollDirection:UICollectionViewScrollDirectionHorizontal];
}

/*
 *  初始化 CollectionView
 *
 *  @param sectionRowCounts     每个section的rowCount个数(数组有多少个就多少个section，数组里的元素值为该section的row行数)
 *  @param perMaxCount          当滚动方向为①水平时,每列显示几个；②竖直时,每行显示几个；
 *  @param scrollDirection      集合视图的滚动方向
 *
 *  @return CollectionView
 */
- (instancetype)initWithSectionRowCounts:(NSArray<NSNumber *> *)sectionRowCounts
                             perMaxCount:(NSInteger)perMaxCount
                         scrollDirection:(UICollectionViewScrollDirection)scrollDirection
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = scrollDirection;
    self = [super initWithFrame:CGRectZero collectionViewLayout:layout];
    if (self) {
        _perMaxCount = perMaxCount;
        
        [self registerClass:[CQTSRipeImageCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        self.dataSource = self;
        self.delegate = self;
        
        self.sectionRowCounts = sectionRowCounts;
    }
    return self;
}




#pragma mark - UICollectionViewDelegateFlowLayout
// 此部分已在父类中实现
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat collectionViewCellWidth = 0;
    CGFloat collectionViewCellHeight = 0;
    
    UICollectionViewFlowLayout *flowLayout = collectionViewLayout;
    BOOL isScrollHorizontal = flowLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal;
    if (isScrollHorizontal) {   // 按水平方向滚动时，按个数计算cell的高
        NSInteger perColumnMaxRowCount = self.perMaxCount;
        
        UIEdgeInsets sectionInset = [self collectionView:collectionView
                                                  layout:collectionViewLayout
                                  insetForSectionAtIndex:indexPath.section];;
        CGFloat rowSpacing = [self collectionView:collectionView
                                           layout:collectionViewLayout
         minimumInteritemSpacingForSectionAtIndex:indexPath.section];
        
        CGFloat height = CGRectGetHeight(collectionView.frame);
        CGFloat validHeight = height - sectionInset.top - sectionInset.bottom - rowSpacing*(perColumnMaxRowCount-1);
        collectionViewCellHeight = floorf(validHeight/perColumnMaxRowCount);
        collectionViewCellWidth = collectionViewCellHeight;
        
    } else {                    // 按竖直方向滚动时，按个数计算cell的宽
        NSInteger perRowMaxColumnCount = self.perMaxCount;
        
        UIEdgeInsets sectionInset = [self collectionView:collectionView
                                                  layout:collectionViewLayout
                                  insetForSectionAtIndex:indexPath.section];
        CGFloat columnSpacing = [self collectionView:collectionView
                                              layout:collectionViewLayout
            minimumInteritemSpacingForSectionAtIndex:indexPath.section];
        
        CGFloat width = CGRectGetWidth(collectionView.frame);
        CGFloat validWith = width - sectionInset.left - sectionInset.right - columnSpacing*(perRowMaxColumnCount-1);
        collectionViewCellWidth = floorf(validWith/perRowMaxColumnCount);
        collectionViewCellHeight = collectionViewCellWidth;
    }
    
    
    return CGSizeMake(collectionViewCellWidth, collectionViewCellHeight);
}

#pragma mark - UICollectionViewDelegate
////“点到”item时候执行的时间(allowsMultipleSelection为默认的NO的时候，只有选中，而为YES的时候有选中和取消选中两种操作)
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}



#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sectionRowCounts.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSNumber *nRowCount = [self.sectionRowCounts objectAtIndex:section];
    NSInteger iRowCount = [nRowCount integerValue];
    
    return iRowCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CQTSRipeImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *title = [NSString stringWithFormat:@"%zd", indexPath.row];
    cell.titleNameLabel.text = title;
    
   //UIImage *image = [CQTSLocImagesUtil cjts_localImageRandom];
    UIImage *image = [CQTSLocImagesUtil cjts_localImageAtIndex:indexPath.item];
    cell.iconImageView.image = image;
    
    !self.cellConfigBlock ?: self.cellConfigBlock(cell);
    
    return cell;
}


@end
