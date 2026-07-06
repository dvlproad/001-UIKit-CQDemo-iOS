//
//  CQTSGitUtil.m
//  CQDemoKit
//
//  Created by lcQian on 2020/4/7.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQTSGitUtil.h"

@implementation CQTSGitUtil

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
                                         imageNames:(NSArray<NSString *> *)imageNames
                                           {
    if (!imageNames || imageNames.count == 0) {
        NSLog(@"警告：图片名称数组为空");
        return @[];
    }
    
    if (!folderName || folderName.length == 0) {
        NSLog(@"警告：文件夹名称为空");
        return @[];
    }
    
    if (!githubUrl || githubUrl.length == 0) {
        NSLog(@"警告：GitHub URL 为空");
        return @[];
    }
    
    // 自动将 blob 地址转换为 raw 地址
    NSString *baseRawURL = [self _convertBlobToRawUrl:githubUrl];
    
    NSMutableArray<NSString *> *imageURLs = [NSMutableArray arrayWithCapacity:imageNames.count];
    
    for (NSString *imageName in imageNames) {
        // 完全保留原始图片名，不添加任何后缀
        NSString *fullURL = [NSString stringWithFormat:@"%@/%@/%@",
                             baseRawURL,
                             folderName,
                             imageName];
        [imageURLs addObject:fullURL];
    }
    
    //NSLog(@"成功生成 %lu 个图片 URL", (unsigned long)imageURLs.count);
    //NSLog(@"使用的基础地址: %@", baseRawURL);
    return [imageURLs copy];
}

/**
 * 将 GitHub blob 地址转换为 raw 地址
 *
 * @param githubUrl GitHub 的 blob 地址，例如: https://github.com/dvlproad/001-UIKit-CQDemo-iOS/blob/master/CQDemoResource/LocDataModel/Resources
 *
 * @return 转换后的 raw 地址，例如: https://raw.githubusercontent.com/dvlproad/001-UIKit-CQDemo-iOS/master/CQDemoResource/LocDataModel/Resources
 */
+ (NSString *)_convertBlobToRawUrl:(NSString *)githubUrl {
    if (!githubUrl || githubUrl.length == 0) {
        return githubUrl;
    }
    
    // 如果已经是 raw 地址，直接返回
    if ([githubUrl containsString:@"raw.githubusercontent.com"]) {
        return githubUrl;
    }
    
    // 如果不是 github.com 的地址，直接返回
    if (![githubUrl containsString:@"github.com"]) {
        return githubUrl;
    }
    
    // 直接替换整个前缀
    // https://github.com/.../blob/... -> https://raw.githubusercontent.com/.../...
    NSString *rawURL = [githubUrl stringByReplacingOccurrencesOfString:@"https://github.com"
                                                            withString:@"https://raw.githubusercontent.com"];
    rawURL = [rawURL stringByReplacingOccurrencesOfString:@"/blob/"
                                                withString:@"/"];
    
    return rawURL;
}


@end
