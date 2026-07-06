//
//  CQTSGitUtil.h
//  CQDemoKit
//
//  Created by lcQian on 2020/4/7.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQTSGitUtil : NSObject

//https://github.com/dvlproad/001-UIKit-CQDemo-iOS/blob/master/CQDemoResource/LocDataModel/Resources/jpg/cqts_1.jpg
//转成
//https://raw.githubusercontent.com/dvlproad/001-UIKit-CQDemo-iOS/master/CQDemoResource/LocDataModel/Resources/jpg/cqts_1.jpg
/**
 * 从Github中获取指定文件夹下的指定图片名数组的图片 RAW URL 数组
 *
 * @param githubUrl GitHub 仓库的基础 URL，可以是 blob 或 raw 地址
 *                  例如: @"https://github.com/dvlproad/001-UIKit-CQDemo-iOS/blob/master/CQDemoResource/LocDataModel/Resources"
 * @param folderName 图片所在文件夹名称，例如: @"jpg"
 * @param imageNames 图片名称数组，例如: @[@"cqts_1.jpg", @"cqts_2", @"cqts_3.png"]
 *                   如果带后缀则保留，不带后缀则不加
 *
 * @return 完整的图片 URL 字符串数组
 */
+ (NSArray<NSString *> *)githubImageURLsFromBaseUrl:(NSString *)githubUrl
                                         folderName:(NSString *)folderName
                                         imageNames:(NSArray<NSString *> *)imageNames;

@end

NS_ASSUME_NONNULL_END
