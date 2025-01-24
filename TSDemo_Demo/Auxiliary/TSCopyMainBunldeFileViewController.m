//
//  TSCopyMainBunldeFileViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSCopyMainBunldeFileViewController.h"
#import <CQDemoKit/CQTSResourceUtil.h>
#import <CQDemoKit/CQTSSandboxUtil.h>
#import <CQDemoKit/CQTSSandboxSimulateUtil.h>
#import <SSZipArchive/SSZipArchive.h>

@interface TSCopyMainBunldeFileViewController () {
    
}
@property (nonatomic, copy, nullable) NSString *downloadBundleRelativePath;
@property (nonatomic, copy, nullable) NSString *downloadZipRelativePath;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TSCopyMainBunldeFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"Copy MainBundle File首页", nil); //知识点:使得tabBar中的title可以和显示在顶部的title保持各自
    

    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    __weak typeof(self) weakSelf = self;
    // Copy .gif
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 Copy .png/.jpg/.gif 等";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Copy .jpg";
            module.actionBlock = ^{
                NSString *copyFile = @"cqts_mainbundle_jpg_01.jpg";
                NSURL *toDirectoryURL = [NSURL fileURLWithPath:[CQTSSandboxUtil documentsDirectory]];
                NSDictionary *dict = [CQTSSandboxSimulateUtil copyFile:copyFile inBundle:[NSBundle mainBundle]
                                                         toSandboxType:CQTSSandboxTypeDocuments subDirectory:nil];
                NSString *absoluteFilePath = dict[@"absoluteFilePath"];
                NSString *relativeFilePath = dict[@"relativeFilePath"];
                
                UIImage *image = [[UIImage alloc] initWithContentsOfFile:absoluteFilePath];
                weakSelf.imageView.image = image;
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Copy .gif";
            module.content = @"动画显示需接三方 FLAnimatedImage 库";
            module.actionBlock = ^{
                NSString *copyFile = @"cqts_mainbundle_gif_01.gif";
                NSURL *toDirectoryURL = [NSURL fileURLWithPath:[CQTSSandboxUtil documentsDirectory]];
                NSDictionary *dict = [CQTSSandboxSimulateUtil copyFile:copyFile inBundle:[NSBundle mainBundle]
                                                         toSandboxType:CQTSSandboxTypeDocuments subDirectory:nil];
                NSString *absoluteFilePath = dict[@"absoluteFilePath"];
                NSString *relativeFilePath = dict[@"relativeFilePath"];
                
                UIImage *image = [[UIImage alloc] initWithContentsOfFile:absoluteFilePath];
                weakSelf.imageView.image = image;
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // Copy .bundle
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 Copy .bundle 等";
        {
            // [iOS生成Bundle包及使用](https://www.cnblogs.com/huangzs/p/8037642.html)
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Copy .bundle";
            module.content = @"请先点击，以模拟下载 .bundle 到沙盒中";
            module.actionBlock = ^{
                NSString *copyFile = @"DownloadBundle.bundle";
                NSURL *toDirectoryURL = [NSURL fileURLWithPath:[CQTSSandboxUtil documentsDirectory]];
                
                NSDictionary *dict = [CQTSSandboxSimulateUtil copyFile:copyFile inBundle:[NSBundle mainBundle]
                                                         toSandboxType:CQTSSandboxTypeDocuments
                                                          subDirectory:@"downloadBundle"];
                NSString *absoluteFilePath = dict[@"absoluteFilePath"];
                NSString *relativeFilePath = dict[@"relativeFilePath"];
                weakSelf.downloadBundleRelativePath = relativeFilePath;
                
                [weakSelf updateAllBundleModelContent];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"读取 .bundle 中内容";
            module.content = @"请先模拟下载 .bundle 到沙盒中";
            module.actionBlock = ^{
                NSString *copyFile = @"DownloadBundle.bundle";
                NSString *absoluteFilePath = [CQTSSandboxUtil makeupAbsoluteFilePath:weakSelf.downloadBundleRelativePath
                                                                       toSandboxType:CQTSSandboxTypeDocuments
                                                                        checkIfExist:YES];
                NSBundle *downloadBundle = [[NSBundle alloc] initWithPath:absoluteFilePath];
                if (downloadBundle != nil) {
                    UIImage *image = [UIImage imageNamed:@"icon_control_katong_5" inBundle:downloadBundle compatibleWithTraitCollection:nil];
                    weakSelf.imageView.image = image;
                }
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    
    // Copy .zip
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 Copy .zip 等";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Copy .zip";
            module.content = @"请先点击，以模拟下载 .zip 到沙盒中";
            module.actionBlock = ^{
                NSString *copyFile = @"DownloadBundle.zip";
                NSURL *toDirectoryURL = [NSURL fileURLWithPath:[CQTSSandboxUtil documentsDirectory]];
                
                NSDictionary *dict = [CQTSSandboxSimulateUtil copyFile:copyFile inBundle:[NSBundle mainBundle]
                                                         toSandboxType:CQTSSandboxTypeDocuments
                                                          subDirectory:@"downloadZip"];
                NSString *absoluteFilePath = dict[@"absoluteFilePath"];
                NSString *relativeFilePath = dict[@"relativeFilePath"];
                weakSelf.downloadZipRelativePath = relativeFilePath;
                
                [weakSelf updateAllZipModelContent];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"读取 .zip 中内容";
            module.content = @"请先模拟下载 .zip 到沙盒中";
            module.actionBlock = ^{
                NSString *copyFile = @"DownloadBundle.zip";
                NSString *absoluteFilePath = [CQTSSandboxUtil makeupAbsoluteFilePath:weakSelf.downloadZipRelativePath
                                                                       toSandboxType:CQTSSandboxTypeDocuments
                                                                        checkIfExist:YES];
                // Unzip
                NSString *zipPath = absoluteFilePath;
                NSString *unzipPath = [absoluteFilePath stringByDeletingLastPathComponent];
                [SSZipArchive unzipFileAtPath:zipPath toDestination:unzipPath];
                NSString *unzipBundlePath = [unzipPath stringByAppendingPathComponent:@"DownloadBundle.bundle"];
                
                NSBundle *downloadBundle = [[NSBundle alloc] initWithPath:unzipBundlePath];
                if (downloadBundle != nil) {
                    UIImage *image = [UIImage imageNamed:@"icon_control_katong_6" inBundle:downloadBundle compatibleWithTraitCollection:nil];
                    weakSelf.imageView.image = image;
                }
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    self.sectionDataModels = sectionDataModels;
    
    // 导航栏右边按钮
    [self tsGoOtherViewControllerByRightBarButtonItem];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop).mas_offset(420);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(144);
    }];
    self.imageView = imageView;
    
}

/// 更新所有测试模拟下载 .bundle 的 model 的 content
- (void)updateAllBundleModelContent {
    NSMutableArray *values = self.sectionDataModels[1].values;
    for (int index = 0; index < values.count; index++) {
        CQDMModuleModel *module = values[index];
        if (index == 0) {
            if (self.downloadBundleRelativePath != nil) {
                module.content = @"已模拟下载 .bundle 到沙盒中";
            } else {
                module.content = @"请先点击，以模拟下载 .bundle 到沙盒中";
            }
        } else {
            if (self.downloadBundleRelativePath != nil) {
                module.content = @"已模拟下载 .bundle 到沙盒中，可点击直接读取";
            } else {
                module.content = @"请先模拟下载 .bundle 到沙盒中";
            }
        }
    }
    [self.tableView reloadData];
}

/// 更新所有测试模拟下载 .zip 的 model 的 content
- (void)updateAllZipModelContent {
    NSMutableArray *values = self.sectionDataModels[2].values;
    for (int index = 0; index < values.count; index++) {
        CQDMModuleModel *module = values[index];
        if (index == 0) {
            if (self.downloadZipRelativePath != nil) {
                module.content = @"已模拟下载 .zip 到沙盒中";
            } else {
                module.content = @"请先点击，以模拟下载 .zip 到沙盒中";
            }
        } else {
            if (self.downloadZipRelativePath != nil) {
                module.content = @"已模拟下载 .zip 到沙盒中，可点击直接读取";
            } else {
                module.content = @"请先模拟下载 .zip 到沙盒中";
            }
        }
    }
    [self.tableView reloadData];
}


#pragma mark - Touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
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
