//
//  TSResourceCollectionViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 8/10/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import "TSResourceCollectionViewController.h"

#import <CQDemoKit/CQTSIconsUtil.h>
#import <CQDemoKit/CQTSLocImagesUtil.h>
#import <CQDemoKit/CQTSNetImagesUtil.h>


@interface TSResourceCollectionViewController () {
    
}
@property (nonatomic, assign) CQTSRipeImageSource ripeImageSource;

@end


@implementation TSResourceCollectionViewController

- (instancetype)initWithRipeImageSource:(CQTSRipeImageSource)ripeImageSource {
    self = [super init];
    if (self) {
        _ripeImageSource = ripeImageSource;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.navigationItem.title = NSLocalizedString(@"列出所有的测试图片(本地+网络)", nil);

    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    
    if (self.ripeImageSource == CQTSRipeImageSourceImageNetwork) {      // 网络图片
        self.navigationItem.title = NSLocalizedString(@"列出所有的测试图片(网络图片)", nil);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            CQDMSectionDataModel *sectionDataModel = [self imageNetworkSectionDataModel];
            [sectionDataModels addObject:sectionDataModel];
        });
    }
    
    if (self.ripeImageSource == CQTSRipeImageSourceImageLocal) { // 本地图片
        self.navigationItem.title = NSLocalizedString(@"列出所有的测试图片(本地图片)", nil);
        CQDMSectionDataModel *sectionDataModel = [self imageLocalSectionDataModel];
        [sectionDataModels addObject:sectionDataModel];
    }
    
    if (self.ripeImageSource == CQTSRipeImageSourceIconNetwork) { // 网络icon
        self.navigationItem.title = NSLocalizedString(@"列出所有的测试图片(网络icon)", nil);
        CQDMSectionDataModel *sectionDataModel = [self iconSectionDataModel];
        [sectionDataModels addObject:sectionDataModel];
    }
    

    self.sectionDataModels = sectionDataModels;
}

// 网络icon
- (CQDMSectionDataModel *)iconSectionDataModel {
    CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
    sectionDataModel.theme = @"网络icon";
    
    NSArray<NSString *> *imageUrls = [CQTSIconsUtil cjts_iconUrls];
    NSInteger imageCount = imageUrls.count;
    for (int i = 0; i < imageCount; i++) {
        CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
        module.title = [NSString stringWithFormat:@"网络icon%zd", i];
        NSString *imageUrl = imageUrls[i];
        module.imageUrl = imageUrl;
        
        [sectionDataModel.values addObject:module];
    }
    
    return sectionDataModel;
}

// 本地图片
- (CQDMSectionDataModel *)imageLocalSectionDataModel {
    CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
    sectionDataModel.theme = @"本地图片";
    
    NSArray<UIImage *> *images = [CQTSLocImagesUtil cjts_localImages];
    NSInteger imageCount = images.count;
    for (int i = 0; i < imageCount; i++) {
        CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
        module.title = [NSString stringWithFormat:@"本地图片%zd", i];
        module.normalImage = images[i];
        [sectionDataModel.values addObject:module];
    }
    
    return sectionDataModel;
}

// 网络图片
- (CQDMSectionDataModel *)imageNetworkSectionDataModel {
    CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
    sectionDataModel.theme = @"网络图片";
    
    NSArray<NSString *> *imageUrls = [CQTSNetImagesUtil cjts_imageUrls];
    NSInteger imageCount = imageUrls.count;
    for (int i = 0; i < imageCount; i++) {
        CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
        module.title = [NSString stringWithFormat:@"网络图片%zd", i];
        NSString *imageUrl = imageUrls[i];
        module.imageUrl = imageUrl;
        
        [sectionDataModel.values addObject:module];
    }
    
    return sectionDataModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
