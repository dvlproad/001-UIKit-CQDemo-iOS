//
//  TSResourceCollectionViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 8/10/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import "TSResourceCollectionViewController.h"

#import <CQDemoKit/CQTSLocImagesUtil.h>
#import <CQDemoKit/CQTSNetImagesUtil.h>

@interface TSResourceCollectionViewController ()

@end

@implementation TSResourceCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = NSLocalizedString(@"所有的测试图片(本地+网络)", nil);

    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    // 本地图片
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"本地图片";
        
        NSArray<UIImage *> *images = [CQTSLocImagesUtil cjts_localImages];
        NSInteger imageCount = images.count;
        for (int i = 0; i < imageCount; i++) {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = [NSString stringWithFormat:@"%zd", i];
            module.normalImage = images[i];
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // 网络图片
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
            sectionDataModel.theme = @"网络图片";
            
            NSArray<NSString *> *imageUrls = [CQTSNetImagesUtil cjts_imageUrls];
            NSInteger imageCount = imageUrls.count;
            for (int i = 0; i < imageCount; i++) {
                CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
                module.title = [NSString stringWithFormat:@"%zd", i];
                
                NSString *imageUrl = imageUrls[i];
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
                module.normalImage = image;
                
                [sectionDataModel.values addObject:module];
            }
            
            [sectionDataModels addObject:sectionDataModel];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
            
        });
    }
    

    self.sectionDataModels = sectionDataModels;
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
