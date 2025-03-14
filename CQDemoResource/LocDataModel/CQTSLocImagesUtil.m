//
//  CQTSLocImagesUtil.m
//  CJComplexUIKitDemo
//
//  Created by ciyouzen on 2020/4/7.
//  Copyright © 2020 dvlproad. All rights reserved.
//

#import "CQTSLocImagesUtil.h"

@implementation CQTSLocImagesUtil

#pragma mark - placeholder Image
+ (UIImage *)cjts_placeholderImage01 {
    return [UIImage cqdemokit_xcassetImageNamed:@"cqts_placeholder01.jpg"];
}

#pragma mark - local BGImage
+ (UIImage *)cjts_localImageBG1 {
    return [UIImage cqdemokit_xcassetImageNamed:@"cqts_bgSky.jpg"];
}

+ (UIImage *)cjts_localImageBG2 {
    return [UIImage cqdemokit_xcassetImageNamed:@"cqts_bgCar.jpg"];
}

#pragma mark - High Scale
/// 水平长图
+ (UIImage *)longHorizontal01 {
    return [UIImage cqdemokit_xcassetImageNamed:@"cqts_long_horizontal_1.jpg"];
}

/// 竖直长图
+ (UIImage *)longVertical01 {
    return [UIImage cqdemokit_xcassetImageNamed:@"cqts_long_vertical_1.jpg"];
}



#pragma mark - local Image

/// 所有的本地测试图片
+ (NSArray<UIImage *> *)cjts_localImages {
    NSMutableArray<UIImage *> *images = [[NSMutableArray alloc] init];
    
    NSArray<NSString *> *imageNames = [self cjts_localImageNames];
    NSInteger imageCount = [imageNames count];
    for (int i = 0; i < imageCount; i++) {
        NSString *imageName = [imageNames objectAtIndex:i];
        UIImage *image = [UIImage cqdemokit_xcassetImageNamed:imageName];
        if (image == nil) {
            image = [[UIImage alloc] init];
        }
        [images addObject:image];
    }
    
    return images;
}


/// 随机的本地测试图片
+ (UIImage *)cjts_localImageRandom {
    NSArray<NSString *> *imageNames = [self cjts_localImageNames];
    NSInteger selIndex = random()%imageNames.count;
    NSString *imageName = [imageNames objectAtIndex:selIndex];
    
    UIImage *image = [UIImage cqdemokit_xcassetImageNamed:imageName];
    return image;
}

/// 获取指定位置的图片(为了cell显示的图片不会一直变化)
+ (UIImage *)cjts_localImageAtIndex:(NSInteger)selIndex {
    NSArray<NSString *> *imageNames = [self cjts_localImageNames];
    if (selIndex >= imageNames.count) { //位置太大的时候，固定使用第一张图片
        selIndex = 0;
    }
    NSString *imageName = [imageNames objectAtIndex:selIndex];
    
    UIImage *image = [UIImage cqdemokit_xcassetImageNamed:imageName];
    return image;
}

+ (NSArray<NSString *> *)cjts_localImageNames {
    NSArray<NSString *> *imageExtensions = @[@"png", @"jpg", @"gif", @"webp", @"svg"];
    return [self cjts_localFileNames:imageExtensions];
}

#pragma mark - test Files
/// 获取测试用的数据
/// （为本地图片名时候，UIImage *image = [UIImage cqdemokit_xcassetImageNamed:imageName]; ）
///
/// @param fileExtensions                                    要获取哪些文件后缀的文件
/// @param count                                                        文件个数
/// @param randomOrder                                          顺序是否随机
/// @param changeImageNameToNetworkUrl      是否将本地图片名转为其所在的网络地址
///
/// @return 返回图片数据
+ (NSMutableArray<CQTSLocImageDataModel *> *)fileModelsWithExtensions:(NSArray<NSString *> *)fileExtensions
                                                                count:(NSInteger)count
                                                          randomOrder:(BOOL)randomOrder
                                          changeImageNameToNetworkUrl:(BOOL)changeImageNameToNetworkUrl
{
    NSArray<NSString *> *imageNames = [self cjts_localFileNames:fileExtensions];
    
    NSMutableArray<CQTSLocImageDataModel *> *dataModels = [[NSMutableArray alloc] init];
    NSArray<NSString *> *titles = @[@"X透社", @"新鲜事", @"XX信", @"X角信", @"蓝精灵", @"年轻范", @"XX福", @"X之语"];
    
    for (NSInteger i = 0; i < count; i++) {
        CQTSLocImageDataModel *dataModel = [[CQTSLocImageDataModel alloc] init];
        NSInteger maySelIndex = randomOrder ? random() : i;
        NSInteger lastImageSelIndex = maySelIndex%imageNames.count;
        NSInteger lastTitleSelIndex = maySelIndex%titles.count;
        
        NSString *imageName = [imageNames objectAtIndex:lastImageSelIndex];
        
        
        //        UIImage *image = [UIImage cqdemokit_xcassetImageNamed:imageName];
        //        if (image == nil) {
        //            image = [[UIImage alloc] init];
        //        }
        
        if (changeImageNameToNetworkUrl) {
            NSString *resourceDir = @"https://github.com/dvlproad/001-UIKit-CQDemo-iOS/blob/616ceb45522fd6c11d03237d5e2eb24a5d3a85d5/CQDemoKit/Demo_Resource/LocDataModel/Resources";
            NSString *fileExtension = [imageName pathExtension].lowercaseString;    // 获取文件扩展名
            if ([fileExtension isEqualToString:@"mp4"]) {
                resourceDir = [resourceDir stringByAppendingPathComponent:@"mp4"];
            } else if ([fileExtension isEqualToString:@"mov"]) {
                resourceDir = [resourceDir stringByAppendingPathComponent:@"mov"];
            } else if ([fileExtension isEqualToString:@"png"]) {
                resourceDir = [resourceDir stringByAppendingPathComponent:@"png"];
            } else if ([fileExtension isEqualToString:@"jpg"]) {
                resourceDir = [resourceDir stringByAppendingPathComponent:@"jpg"];
            } else if ([fileExtension isEqualToString:@"gif"]) {
                resourceDir = [resourceDir stringByAppendingPathComponent:@"GIF"];
            } else if ([fileExtension isEqualToString:@"webp"]) {
                resourceDir = [resourceDir stringByAppendingPathComponent:@"webp"];
            } else if ([fileExtension isEqualToString:@"heic"]) {
                resourceDir = [resourceDir stringByAppendingPathComponent:@"heic"];
            } else if ([fileExtension isEqualToString:@"svg"]) {
                resourceDir = [resourceDir stringByAppendingPathComponent:@"SVG"];
            } else {
                resourceDir = [resourceDir stringByAppendingPathComponent:@""];
            }
            NSString *imageUrl = [NSString stringWithFormat:@"%@/%@?raw=true", resourceDir, imageName];
            dataModel.name = [NSString stringWithFormat:@"%02zd %@", i+1, imageName];
            dataModel.imageName = imageUrl;
        } else {
            //NSString *title = [NSString stringWithFormat:@"%zd:第index=%zd张", i, lastImageSelIndex];
            NSString *title = [titles objectAtIndex:lastTitleSelIndex];
            dataModel.name = [NSString stringWithFormat:@"%02zd %@", i+1, title];
            dataModel.imageName = imageName;
        }
        
        [dataModels addObject:dataModel];
    }
    
    return dataModels;
}

+ (NSArray<NSString *> *)cjts_localFileNames:(NSArray<NSString *> *)fileExtensions {
    NSMutableArray *resultImagesNames = [[NSMutableArray alloc] init];
    if ([fileExtensions containsObject:@"jpg"]) {
        [resultImagesNames addObjectsFromArray:@[
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
        ]];
    }
    
    if ([fileExtensions containsObject:@"gif"]) {
        [resultImagesNames addObjectsFromArray:@[
            @"cqts_01.gif",
            @"cqts_02.gif",
            @"cqts_03.gif",
            @"cqts_04.gif",
        ]];
    }
    
    if ([fileExtensions containsObject:@"webp"]) {
        [resultImagesNames addObjectsFromArray:@[
            @"cqts_wp_1.webp",
        ]];
    }
    
    if ([fileExtensions containsObject:@"svg"]) {
        [resultImagesNames addObjectsFromArray:@[
            @"cqts_normal_svg_01.svg",
            @"cqts_normal_svg_02.svg",
            @"cqts_normal_animation_svg_01.svg",
            @"cqts_symbol_svg_01.svg",              // symbol 图标
        ]];
    }
    
    if ([fileExtensions containsObject:@"mp3"]) {
        [resultImagesNames addObjectsFromArray:@[
//            @"cqts_normal_audio_01.mp3",
//            @"cqts_normal_audio_02.mp3",
        ]];
    }
    
    if ([fileExtensions containsObject:@"mp4"]) {
        [resultImagesNames addObjectsFromArray:@[
//            @"cqts_normal_video_01.mp4",
//            @"cqts_normal_video_02.mp4",
        ]];
    }
    
    if ([fileExtensions containsObject:@"mp4"]) {
        [resultImagesNames addObjectsFromArray:@[
            @"cqts_vap_01.mp4",
        ]];
    }
    
    return resultImagesNames;
}

@end
