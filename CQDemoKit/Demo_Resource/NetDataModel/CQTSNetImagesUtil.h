//
//  CQTSNetImagesUtil.h
//  CJComplexUIKitDemo
//
//  Created by lcQian on 2020/4/7.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CQTSNetImageDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CQTSNetImagesUtil : NSObject

/// 获取测试用的数据(image为网络图片)
+ (NSMutableArray<CQTSNetImageDataModel *> *)__getTestNetImageDataModels;

/// 获取测试用的数据(image为网络图片地址)
///
/// @param count        图片个数
/// @param randomOrder  顺序是否随机
///
/// @return 返回图片数据
+ (NSMutableArray<CQTSNetImageDataModel *> *)__getTestNetImageDataModelsWithCount:(NSInteger)count randomOrder:(BOOL)randomOrder;


#pragma mark network Github ImageUrl
/// 我自己 github 上的 JPG 图片
+ (NSArray<NSString *> *)cjts_imageURLs_github;

//https://github.com/dvlproad/001-UIKit-CQDemo-iOS/blob/master/CQDemoResource/LocDataModel/Resources/jpg/cqts_1.jpg
//转成
//https://raw.githubusercontent.com/dvlproad/001-UIKit-CQDemo-iOS/master/CQDemoResource/LocDataModel/Resources/jpg/cqts_1.jpg
/**
 * 从Github中获取指定文件夹下的指定图片名数组的图片 RAW URL 数组
 *
 * @param githubURL GitHub 仓库的基础 URL，可以是 blob 或 raw 地址
 *                  例如: @"https://github.com/dvlproad/001-UIKit-CQDemo-iOS/blob/master/CQDemoResource/LocDataModel/Resources"
 * @param folderName 图片所在文件夹名称，例如: @"jpg"
 * @param imageNames 图片名称数组，例如: @[@"cqts_1.jpg", @"cqts_2", @"cqts_3.png"]
 *                   如果带后缀则保留，不带后缀则不加
 *
 * @return 完整的图片 URL 字符串数组
 */
+ (NSArray<NSString *> *)cjts_imageURLsFromGithubURL:(NSString *)githubURL
                                          folderName:(NSString *)folderName
                                          imageNames:(NSArray<NSString *> *)imageNames;

#pragma mark network ImageUrl
/// 所有的网络测试图片地址
+ (NSArray<NSString *> *)cjts_imageUrls;

/// 随机的网络测试图片地址
+ (NSString *)cjts_imageUrlRandom;

/// 获取指定位置的图片(为了cell显示的图片不会一直变化)
+ (NSString *)cjts_imageUrlAtIndex:(NSInteger)selIndex;

+ (NSString *)cjts_imageUrl1;

+ (NSString *)cjts_imageUrl2;

+ (NSString *)cjts_imageUrl3;

+ (NSString *)cjts_imageUrl4;

+ (NSString *)cjts_imageUrl5;

+ (NSString *)cjts_imageUrl6;

+ (NSString *)cjts_imageUrl7;

+ (NSString *)cjts_imageUrl8;

+ (NSString *)cjts_imageUrl9;

+ (NSString *)cjts_imageUrl10;

+ (NSString *)cjts_imageUrl11;

+ (NSString *)cjts_imageUrl12;

+ (NSString *)cjts_imageUrl13;

+ (NSString *)cjts_imageUrl14;

+ (NSString *)cjts_imageUrl15;

+ (NSString *)cjts_imageUrl16;

+ (NSString *)cjts_imageUrl17;

+ (NSString *)cjts_imageUrl18;

+ (NSString *)cjts_imageUrl19;

+ (NSString *)cjts_imageUrl20;

+ (NSString *)cjts_imageUrl21;

+ (NSString *)cjts_imageUrl22;

+ (NSString *)cjts_imageUrl23;

+ (NSString *)cjts_imageUrl24;

+ (NSString *)cjts_imageUrl25;

@end

NS_ASSUME_NONNULL_END
