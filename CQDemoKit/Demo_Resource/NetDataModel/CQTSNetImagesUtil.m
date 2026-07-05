//
//  CQTSNetImagesUtil.m
//  CJComplexUIKitDemo
//
//  Created by lcQian on 2020/4/7.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQTSNetImagesUtil.h"

@implementation CQTSNetImagesUtil

/// 获取测试用的数据(image为网络图片地址)
///
/// @param count        图片个数
/// @param randomOrder  顺序是否随机
///
/// @return 返回图片数据
+ (NSMutableArray<CQTSNetImageDataModel *> *)__getTestNetImageDataModelsWithCount:(NSInteger)count randomOrder:(BOOL)randomOrder {
    NSArray<NSString *> *selStrings = [self __cjts_imageUrlSelStrings];
    
    NSMutableArray<CQTSNetImageDataModel *> *dataModels = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < count; i++) {
        CQTSNetImageDataModel *dataModel = [[CQTSNetImageDataModel alloc] init];
        
        NSInteger maySelIndex = randomOrder ? random() : i;
        NSInteger lastSelIndex = maySelIndex%selStrings.count;
        
        NSString *selString = [selStrings objectAtIndex:lastSelIndex];
        SEL sel = NSSelectorFromString(selString);
        dataModel.imageUrl = [CQTSNetImagesUtil performSelector:sel];
        //dataModel.imageUrl = self.cjts_imageUrls[selIndex];
        dataModel.name = [NSString stringWithFormat:@"%zd:%@", i, selString];
        dataModel.badgeCount = i;
        
        [dataModels addObject:dataModel];
    }
    
    return dataModels;
}
   


/// 获取测试用的数据(image为网络图片)
+ (NSMutableArray<CQTSNetImageDataModel *> *)__getTestNetImageDataModels {
    NSMutableArray<CQTSNetImageDataModel *> *dataModels = [[NSMutableArray alloc] init];
    {
        CQTSNetImageDataModel *dataModel = [[CQTSNetImageDataModel alloc] init];
        dataModel.name = @"1X透社";
        dataModel.imageUrl =  self.cjts_imageUrls[0];
        dataModel.badgeCount = 0;
        [dataModels addObject:dataModel];
    }
    {
        CQTSNetImageDataModel *dataModel = [[CQTSNetImageDataModel alloc] init];
        dataModel.name = @"2新鲜事";
        dataModel.imageUrl = self.cjts_imageUrls[1];
        dataModel.badgeCount = 1;
        [dataModels addObject:dataModel];
    }
    {
        CQTSNetImageDataModel *dataModel = [[CQTSNetImageDataModel alloc] init];
        dataModel.name = @"3XX信";
        dataModel.imageUrl = self.cjts_imageUrls[2];
        dataModel.badgeCount = 0;
        [dataModels addObject:dataModel];
    }
    {
        CQTSNetImageDataModel *dataModel = [[CQTSNetImageDataModel alloc] init];
        dataModel.name = @"4X角信";
        dataModel.badgeCount = 9;
        dataModel.imageUrl = self.cjts_imageUrls[3];
        [dataModels addObject:dataModel];
    }
    {
        CQTSNetImageDataModel *dataModel = [[CQTSNetImageDataModel alloc] init];
        dataModel.name = @"5蓝精灵";
        dataModel.imageUrl = self.cjts_imageUrls[4];
        dataModel.badgeCount = 10;
        [dataModels addObject:dataModel];
    }
    {
        CQTSNetImageDataModel *dataModel = [[CQTSNetImageDataModel alloc] init];
        dataModel.name = @"6年轻范";
        dataModel.badgeCount = 99;
        dataModel.imageUrl = self.cjts_imageUrls[5];
        [dataModels addObject:dataModel];
    }
    {
        CQTSNetImageDataModel *dataModel = [[CQTSNetImageDataModel alloc] init];
        dataModel.name = @"7XX福";
        dataModel.imageUrl = self.cjts_imageUrls[6];
        dataModel.badgeCount = 1;
        [dataModels addObject:dataModel];
    }
    {
        CQTSNetImageDataModel *dataModel = [[CQTSNetImageDataModel alloc] init];
        dataModel.name = @"8X之语";
        dataModel.badgeCount = 888;
        dataModel.imageUrl = self.cjts_imageUrls[7];
        [dataModels addObject:dataModel];
    }
    {
        CQTSNetImageDataModel *dataModel = [[CQTSNetImageDataModel alloc] init];
        dataModel.name = @"我是6个字";
        dataModel.badgeCount = 888;
        dataModel.imageUrl = self.cjts_imageUrls[8];
        [dataModels addObject:dataModel];
    }
    
    return dataModels;
}

#pragma mark network Github ImageUrl
/// 我自己 github 上的 JPG 图片
+ (NSArray<NSString *> *)cjts_imageURLs_github {
    NSString *githubUrl = @"https://github.com/dvlproad/001-UIKit-CQDemo-iOS/blob/master/CQDemoResource/LocDataModel/Resources";
    NSString *githubFolderName = @"jpg";
    NSArray<NSString *> *githubImagesNames = @[
        @"cqts_1.jpg",
        @"cqts_2.jpg",
        @"cqts_3.jpg",
        @"cqts_4.jpg",
        @"cqts_5.jpg",
        @"cqts_6.jpg",
        @"cqts_7.jpg",
        @"cqts_8.jpg",
        @"cqts_9.jpg",
        @"cqts_10.jpg",
        @"cqts_long_horizontal_1.jpg",
        @"cqts_long_vertical_1.jpg",
        @"cqts_bgCar@2x.jpg",
        @"cqts_bgSky@2x.jpg",
        @"cqts_big_15M.jpg",
        @"cqts_big_22M.jpg",
    ];
    NSArray<NSString *> *imageUrls_github = [self cjts_imageURLsFromGithubURL:githubUrl folderName:githubFolderName imageNames:githubImagesNames];
    return imageUrls_github;
}

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
+ (NSArray<NSString *> *)cjts_imageURLsFromGithubURL:(NSString *)githubUrl
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

#pragma mark network ImageUrl
/// 所有的网络测试图片地址
+ (NSArray<NSString *> *)cjts_imageUrls {
    NSMutableArray *imageUrls = [[NSMutableArray alloc] init];
    [imageUrls addObjectsFromArray:[self cjts_imageURLs_github]];
    [imageUrls addObjectsFromArray:@[
        #pragma mark 以下网络图片从 https://stock.tuchong.com 中获取
        @"https://cdn6-banquan.ituchong.com/weili/l/1113166746308968471.jpeg",
        @"https://cdn6-banquan.ituchong.com/weili/l/966827220441759777.jpeg",
        @"https://cdn6-banquan.ituchong.com/weili/l/919795258271596547.jpeg",
        
        @"https://cdn6-banquan.ituchong.com/weili/l/57461353849430061.jpeg",
        @"https://cdn6-banquan.ituchong.com/weili/l/1017308169985458197.jpeg",
        #pragma mark 以下网络图片从 https://www.droitstock.com/ 中获取
        @"https://img1.droitstock.com/middleW/0a/3c/373880000.jpg",
        @"https://img1.droitstock.com/middleW/76/d4/324995286.jpg",
        @"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1892357736,3979425284&fm=26&gp=0.jpg",
        @"https://img1.droitstock.com/middleW/bd/f0/241894345.jpg",
        @"https://img1.droitstock.com/middleW/41/4f/134317211.jpg",
        
        @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3155622504,3922873140&fm=26&gp=0.jpg",
        @"https://img1.droitstock.com/middleW/5b/9c/824812856.jpg",
        @"https://img1.droitstock.com/middleW/5a/8d/381503287.jpg",
        @"https://img1.droitstock.com/middleW/b6/22/164126642.jpg",
        @"https://img1.droitstock.com/middleW/df/26/271782228.jpg",
        
        #pragma mark 以下网络图片从 https://www.veer.com 中获取
        @"https://alifei04.cfp.cn/creative/vcg/veer/800water/veer-163722653.jpg",
        @"https://alifei01.cfp.cn/creative/vcg/veer/800water/veer-132426620.jpg"
    ]];
    
    return imageUrls;
}

/// 随机的网络测试图片地址
+ (NSString *)cjts_imageUrlRandom {
    NSArray<NSString *> *imageUrls = [self cjts_imageUrls];
    NSInteger selIndex = random()%imageUrls.count;
    NSString *imageUrl = [imageUrls objectAtIndex:selIndex];
    
    return imageUrl;
}

/// 获取指定位置的图片(为了cell显示的图片不会一直变化)
+ (NSString *)cjts_imageUrlAtIndex:(NSInteger)selIndex {
    NSArray<NSString *> *imageUrls = [self cjts_imageUrls];
    if (selIndex >= imageUrls.count) {  //位置太大的时候，固定使用第一张图片
        selIndex = 0;
    }
    NSString *imageUrl = [imageUrls objectAtIndex:selIndex];
    
    return imageUrl;
}


/// 所有的网络测试图片地址
+ (NSArray<NSString *> *)__cjts_imageUrlSelStrings {
    NSArray *selStrings = @[NSStringFromSelector(@selector(cjts_imageUrl1)),
                            NSStringFromSelector(@selector(cjts_imageUrl2)),
                            NSStringFromSelector(@selector(cjts_imageUrl3)),
                            NSStringFromSelector(@selector(cjts_imageUrl4)),
                            NSStringFromSelector(@selector(cjts_imageUrl5)),
                            NSStringFromSelector(@selector(cjts_imageUrl6)),
                            NSStringFromSelector(@selector(cjts_imageUrl7)),
                            NSStringFromSelector(@selector(cjts_imageUrl8)),
                            NSStringFromSelector(@selector(cjts_imageUrl9)),
                            NSStringFromSelector(@selector(cjts_imageUrl10)),
                            NSStringFromSelector(@selector(cjts_imageUrl11)),
                            NSStringFromSelector(@selector(cjts_imageUrl12)),
                            NSStringFromSelector(@selector(cjts_imageUrl13)),
                            NSStringFromSelector(@selector(cjts_imageUrl14)),
                            NSStringFromSelector(@selector(cjts_imageUrl15)),
                            NSStringFromSelector(@selector(cjts_imageUrl16)),
                            NSStringFromSelector(@selector(cjts_imageUrl17)),
                            NSStringFromSelector(@selector(cjts_imageUrl18)),
                            NSStringFromSelector(@selector(cjts_imageUrl19)),
                            NSStringFromSelector(@selector(cjts_imageUrl20)),
                            NSStringFromSelector(@selector(cjts_imageUrl21)),
                            NSStringFromSelector(@selector(cjts_imageUrl22)),
                            NSStringFromSelector(@selector(cjts_imageUrl23)),
                            NSStringFromSelector(@selector(cjts_imageUrl24)),
                            NSStringFromSelector(@selector(cjts_imageUrl25)),
    ];
    
    return selStrings;
}

+ (NSString *)cjts_imageUrl1 {
    return self.cjts_imageUrls[0];
}

+ (NSString *)cjts_imageUrl2 {
    return self.cjts_imageUrls[1];
}

+ (NSString *)cjts_imageUrl3 {
    return self.cjts_imageUrls[2];
}

+ (NSString *)cjts_imageUrl4 {
    return self.cjts_imageUrls[3];
}

+ (NSString *)cjts_imageUrl5 {
    return self.cjts_imageUrls[4];
}

+ (NSString *)cjts_imageUrl6 {
    return self.cjts_imageUrls[5];
}

+ (NSString *)cjts_imageUrl7 {
    return self.cjts_imageUrls[6];
}

+ (NSString *)cjts_imageUrl8 {
    return self.cjts_imageUrls[7];
}

+ (NSString *)cjts_imageUrl9 {
    return self.cjts_imageUrls[8];
}

+ (NSString *)cjts_imageUrl10 {
    return self.cjts_imageUrls[9];
}

+ (NSString *)cjts_imageUrl11 {
    return self.cjts_imageUrls[10];
}

+ (NSString *)cjts_imageUrl12 {
    return self.cjts_imageUrls[11];
}

+ (NSString *)cjts_imageUrl13 {
    return self.cjts_imageUrls[12];
}

+ (NSString *)cjts_imageUrl14 {
    return self.cjts_imageUrls[13];
}

+ (NSString *)cjts_imageUrl15 {
    return self.cjts_imageUrls[14];
}

+ (NSString *)cjts_imageUrl16 {
    return self.cjts_imageUrls[15];
}

+ (NSString *)cjts_imageUrl17 {
    return self.cjts_imageUrls[16];
}

+ (NSString *)cjts_imageUrl18 {
    return self.cjts_imageUrls[17];
}

+ (NSString *)cjts_imageUrl19 {
    return self.cjts_imageUrls[18];
}

+ (NSString *)cjts_imageUrl20 {
    return self.cjts_imageUrls[19];
}

+ (NSString *)cjts_imageUrl21 {
    return self.cjts_imageUrls[20];
}

+ (NSString *)cjts_imageUrl22 {
    return self.cjts_imageUrls[21];
}

+ (NSString *)cjts_imageUrl23 {
    return self.cjts_imageUrls[22];
}

+ (NSString *)cjts_imageUrl24 {
    return self.cjts_imageUrls[23];
}

+ (NSString *)cjts_imageUrl25 {
    return self.cjts_imageUrls[24];
}

+ (NSString *)cjts_imageUrl26 {
    return self.cjts_imageUrls[25];
}

+ (NSString *)cjts_imageUrl27 {
    return self.cjts_imageUrls[26];
}

+ (NSString *)cjts_imageUrl28 {
    return @"https";
}


@end
