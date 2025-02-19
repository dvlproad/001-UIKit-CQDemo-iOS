//
//  TSCopyMainBunldeFileViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSCopyMainBunldeFileViewController.h"
#import <CQDemoKit/CJUIKitToastUtil.h>
#import <CQDemoKit/CJUIKitAlertUtil.h>
#import <CQDemoKit/CQTSSandboxPathUtil.h>
#import <CQDemoKit/CQTSSandboxFileUtil.h>
#import <CQDemoKit/NSError+CQTSErrorString.h>
#import <CQDemoShareFramework_Swift/CQDemoShareFramework_Swift-Swift.h>
#import <SSZipArchive/SSZipArchive.h>

@interface TSCopyMainBunldeFileViewController () {
    
}
@property (nonatomic, copy, nullable) NSString *downloadBundleRelativePath;
@property (nonatomic, copy, nullable) NSString *downloadZipRelativePath;
@property (nonatomic, copy, nullable) NSString *realDownloadZipRelativePath;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TSCopyMainBunldeFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"Copy MainBundle File首页", nil); //知识点:使得tabBar中的title可以和显示在顶部的title保持各自
    

    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    __weak typeof(self) weakSelf = self;
    // Copy .gif 到 Sandbox
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 Copy .png/.jpg/.gif 等到 Sandbox";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Copy .jpg 到 Sandbox";
            module.actionBlock = ^{
                NSString *copyFile = @"cqts_mainbundle_jpg_01.jpg";
                
                NSString *sandboxPath = [CQTSSandboxPathUtil sandboxPath:CQTSSandboxTypeDocuments];
                NSURL *sandboxURL = [NSURL fileURLWithPath:sandboxPath];
                NSDictionary *dict = [CQTSSandboxFileUtil copyFile:copyFile inBundle:[NSBundle mainBundle]
                                                      toSandboxURL:sandboxURL subDirectory:nil];
                NSString *absoluteFilePath = dict[@"absoluteFilePath"];
                NSString *relativeFilePath = dict[@"relativeFilePath"];
                
                UIImage *image = [[UIImage alloc] initWithContentsOfFile:absoluteFilePath];
                weakSelf.imageView.image = image;
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Copy .gif 到 Sandbox";
            module.content = @"动画显示需接三方 FLAnimatedImage 库";
            module.actionBlock = ^{
                NSString *copyFile = @"cqts_mainbundle_gif_01.gif";
                NSString *sandboxPath = [CQTSSandboxPathUtil sandboxPath:CQTSSandboxTypeDocuments];
                NSURL *sandboxURL = [NSURL fileURLWithPath:sandboxPath];
                NSDictionary *dict = [CQTSSandboxFileUtil copyFile:copyFile inBundle:[NSBundle mainBundle]
                                                      toSandboxURL:sandboxURL subDirectory:nil];
                NSString *absoluteFilePath = dict[@"absoluteFilePath"];
                NSString *relativeFilePath = dict[@"relativeFilePath"];
                
                UIImage *image = [[UIImage alloc] initWithContentsOfFile:absoluteFilePath];
                weakSelf.imageView.image = image;
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // Copy .bundle 到 Sandbox
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 Copy .bundle 到 Sandbox";
        {
            // [iOS生成Bundle包及使用](https://www.cnblogs.com/huangzs/p/8037642.html)
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Copy .bundle 到 Sandbox";
            module.content = @"请先点击，以模拟下载 .bundle 到沙盒中";
            module.actionBlock = ^{
                NSString *copyFile = @"DownloadBundle.bundle";
                NSString *sandboxPath = [CQTSSandboxPathUtil sandboxPath:CQTSSandboxTypeDocuments];
                NSURL *sandboxURL = [NSURL fileURLWithPath:sandboxPath];
                NSDictionary *dict = [CQTSSandboxFileUtil copyFile:copyFile inBundle:[NSBundle mainBundle]
                                                      toSandboxURL:sandboxURL
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
            module.title = @"读取 Sandbox 里 .bundle 中内容";
            module.content = @"请先模拟下载 .bundle 到沙盒中";
            module.actionBlock = ^{
                NSString *copyFile = @"DownloadBundle.bundle";
                NSString *absoluteFilePath = [CQTSSandboxPathUtil makeupAbsoluteFilePath:weakSelf.downloadBundleRelativePath
                                                                       toSandboxType:CQTSSandboxTypeDocuments
                                                                        checkIfExist:YES];
                NSBundle *downloadBundle = [[NSBundle alloc] initWithPath:absoluteFilePath];
                if (downloadBundle != nil) {
                    UIImage *image = [UIImage imageNamed:@"cqts_bundle_symbolsvg_1" inBundle:downloadBundle compatibleWithTraitCollection:nil];
                    weakSelf.imageView.image = image;
                }
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    
    // Copy .zip 到 AppGroup
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 Copy .zip 到 AppGroup";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Copy .zip 到 AppGroup";
            module.content = @"请先点击，以模拟下载 .zip 到沙盒中";
            module.actionBlock = ^{
                NSString *copyFile = @"DownloadBundle.bundle.zip";
//                NSString *sandboxPath = [CQTSSandboxPathUtil sandboxPath:CQTSSandboxTypeDocuments];
//                NSURL *sandboxURL = [NSURL fileURLWithPath:sandboxPath];
                NSURL *sandboxURL = [CQTSSandboxPathUtil sandboxURLWithAppGroupId:@"group.com.dvlproad.TSDemoDemo"];
                NSDictionary *dict = [CQTSSandboxFileUtil copyFile:copyFile inBundle:[NSBundle mainBundle]
                                                      toSandboxURL:sandboxURL
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
            module.title = @"读取 AppGroup 里 .zip 中内容";
            module.content = @"请先模拟下载 .zip 到沙盒中";
            module.actionBlock = ^{
                NSString *absoluteFilePath = [CQTSSandboxPathUtil makeupAbsoluteFilePath:weakSelf.downloadZipRelativePath
//                                                                       toSandboxType:CQTSSandboxTypeDocuments
                                                                            toAppGroupId:@"group.com.dvlproad.TSDemoDemo"
                                                                        checkIfExist:YES];
                // Unzip
                NSString *zipPath = absoluteFilePath;
                NSString *unzipPath = [absoluteFilePath stringByDeletingLastPathComponent];
                [SSZipArchive unzipFileAtPath:zipPath toDestination:unzipPath];
                //NSString *unzipFileName = [absoluteFilePath.lastPathComponent stringByDeletingPathExtension];
                NSString *unzipFileName = @"DownloadBundle.bundle";
                NSString *unzipBundlePath = [unzipPath stringByAppendingPathComponent:unzipFileName];
                
                NSString *unzipRelativePath = [weakSelf.downloadZipRelativePath stringByDeletingPathExtension];
                [TSWidgetExtensionDataUtil updateSymbolsBundleRelativePath:unzipRelativePath];
                
                NSBundle *downloadBundle = [[NSBundle alloc] initWithPath:unzipBundlePath];
                if (downloadBundle != nil) {
                    UIImage *image = [UIImage imageNamed:@"emoji9_FFA5BE" inBundle:downloadBundle compatibleWithTraitCollection:nil];
                    weakSelf.imageView.image = image;
                } else {
                    NSString *errorMessage = @"downloadBundle 获取失败";
                    [CJUIKitAlertUtil showIKnowAlertInViewController:weakSelf withTitle:errorMessage iKnowBlock:nil];
                }
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // Download .zip 到 Sandbox
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 Download .zip 到 Sandbox";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Download .zip 到 Sandbox";
            module.content = @"请先点击，以正式下载 .zip 到沙盒中";
            module.actionBlock = ^{
                NSString *Url = @"http://shs4ggs0e.hd-bkt.clouddn.com/symbol/TestDownloadBundle.bundle.zip";
                NSString *sandboxPath = [CQTSSandboxPathUtil sandboxPath:CQTSSandboxTypeDocuments];
                NSURL *sandboxURL = [NSURL fileURLWithPath:sandboxPath];
                [CQTSSandboxFileUtil downloadFileWithUrl:Url toSandboxURL:sandboxURL
                                                subDirectory:@"downloadZip" fileName:nil success:^(NSDictionary *dict) {
                    NSString *absoluteFilePath = dict[@"absoluteFilePath"];
                    NSString *relativeFilePath = dict[@"relativeFilePath"];
                    weakSelf.realDownloadZipRelativePath = relativeFilePath;
                    
                    [weakSelf updateAllRealZipModelContent];
                    
                } failure:^(NSString *errorMessage){
                    [CJUIKitAlertUtil showIKnowAlertInViewController:weakSelf withTitle:errorMessage iKnowBlock:nil];
                }];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"读取 Sandbox 里 .zip 中内容";
            module.content = @"请先正式下载 .zip 到沙盒中";
            module.actionBlock = ^{
                if (weakSelf.realDownloadZipRelativePath == nil) {
                    [CJUIKitAlertUtil showIKnowAlertInViewController:weakSelf withTitle:@"请先点击 Download .zip ，以正式下载 .zip 到沙盒中" iKnowBlock:nil];
                    return;
                }
                NSString *absoluteFilePath = [CQTSSandboxPathUtil makeupAbsoluteFilePath:weakSelf.realDownloadZipRelativePath
                                                                       toSandboxType:CQTSSandboxTypeDocuments
                                                                        checkIfExist:YES];
                // Unzip
                NSString *zipPath = absoluteFilePath;
                NSString *unzipDirectoryPath = [absoluteFilePath stringByDeletingLastPathComponent];
                [SSZipArchive unzipFileAtPath:zipPath toDestination:unzipDirectoryPath overwrite:YES password:nil progressHandler:^(NSString * _Nonnull entry, unz_file_info zipInfo, long entryNumber, long total) {
                    
                } completionHandler:^(NSString * _Nonnull path, BOOL succeeded, NSError * _Nullable error) {
                    if (succeeded != YES) {
                        NSString *errorMessage = error.cqtsErrorString;
                        [CJUIKitAlertUtil showIKnowAlertInViewController:weakSelf withTitle:errorMessage iKnowBlock:nil];
                        return;
                    }
                    
                    NSString *unzipFileName = [absoluteFilePath.lastPathComponent stringByDeletingPathExtension];
                    NSString *unzipBundlePath = [unzipDirectoryPath stringByAppendingPathComponent:unzipFileName];
                    
                    NSBundle *downloadBundle = [[NSBundle alloc] initWithPath:unzipBundlePath];
                    if (downloadBundle != nil) {
                        UIImage *image = [UIImage imageNamed:@"icon_control_katong_5" inBundle:downloadBundle compatibleWithTraitCollection:nil];
                        weakSelf.imageView.image = image;
                    } else {
                        NSString *errorMessage = @"downloadBundle 获取失败";
                        [CJUIKitAlertUtil showIKnowAlertInViewController:weakSelf withTitle:errorMessage iKnowBlock:nil];
                    }
                }];
                
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    
    // Download .zip 到 AppGroup
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 Download .zip 到 AppGroup";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Download .zip 到 AppGroup";
            module.content = @"请先点击，以正式下载 .zip 到沙盒中";
            module.actionBlock = ^{
                NSString *Url = @"http://shs4ggs0e.hd-bkt.clouddn.com/symbol/TestDownloadBundle.bundle.zip";
                NSString *zipFileName = [Url lastPathComponent];                        // xxx.bundle.zip
                NSString *unzipFileName = [zipFileName stringByDeletingPathExtension];  // xxx.bundle
                
                NSURL *directoryURL = [TSWidgetExtensionDataUtil getDownloadSymbolDirURL];
                [TSWidgetExtensionDataUtil downloadFileWithFileUrl:Url directoryURL:directoryURL saveWithFileName:zipFileName success:^(NSURL * _Nonnull cacheURL) {
                    NSString *zipPath = cacheURL.path;
                    NSString *unzipDirectoryPath = directoryURL.path;
                    [SSZipArchive unzipFileAtPath:zipPath toDestination:unzipDirectoryPath overwrite:YES password:nil progressHandler:^(NSString * _Nonnull entry, unz_file_info zipInfo, long entryNumber, long total) {
                        
                    } completionHandler:^(NSString * _Nonnull path, BOOL succeeded, NSError * _Nullable error) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            if (succeeded != YES) {
                                NSString *errorMessage = error.cqtsErrorString;
                                [CJUIKitAlertUtil showIKnowAlertInViewController:weakSelf withTitle:errorMessage iKnowBlock:nil];
                                return;
                            }
                            
                            [TSWidgetExtensionDataUtil updateSymbolsBundleRelativePath:unzipFileName];
                            [weakSelf updateAllRealZipModelContent_inAppGroup];
                        });
                    }];
                    
                } failure:^(NSString * _Nonnull errorMessage) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [CJUIKitAlertUtil showIKnowAlertInViewController:weakSelf withTitle:errorMessage iKnowBlock:nil];
                    });
                }];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"读取 AppGroup 里 .zip 中内容";
            module.content = @"请先正式下载 .zip 到沙盒中";
            module.actionBlock = ^{
                NSString *symbolsBundleRelativePath = [TSWidgetExtensionDataUtil getSymbolsBundleRelativePath];
                if (symbolsBundleRelativePath == nil) {
                    [CJUIKitAlertUtil showIKnowAlertInViewController:weakSelf withTitle:@"请先点击 Download .zip 到 AppGroup ，以正式下载 .zip 到沙盒中" iKnowBlock:nil];
                    return;
                }
                
                NSBundle *downloadBundle = [TSWidgetExtensionDataUtil getSymbolBundle];
                if (downloadBundle != nil) {
                    UIImage *image = [UIImage imageNamed:@"icon_control_katong_6" inBundle:downloadBundle compatibleWithTraitCollection:nil];
                    weakSelf.imageView.image = image;
                } else {
                    NSString *errorMessage = @"downloadBundle 获取失败";
                    [CJUIKitAlertUtil showIKnowAlertInViewController:weakSelf withTitle:errorMessage iKnowBlock:nil];
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
    
    // App Group
    [self updateAllZipModelContent];
    [self updateAllRealZipModelContent_inAppGroup];
    
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
    self.downloadZipRelativePath = [TSWidgetExtensionDataUtil getSymbolsBundleRelativePath];
    
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

/// 更新所有测试模拟下载 .zip 的 model 的 content
- (void)updateAllRealZipModelContent {
    NSMutableArray *values = self.sectionDataModels[3].values;
    for (int index = 0; index < values.count; index++) {
        CQDMModuleModel *module = values[index];
        if (index == 0) {
            if (self.realDownloadZipRelativePath != nil) {
                module.content = @"已正式下载 .zip 到沙盒中";
            } else {
                module.content = @"请先点击，以正式下载 .zip 到沙盒中";
            }
        } else {
            if (self.realDownloadZipRelativePath != nil) {
                module.content = @"已正式下载 .zip 到沙盒中，可点击直接读取";
            } else {
                module.content = @"请先正式下载 .zip 到沙盒中";
            }
        }
    }
    [self.tableView reloadData];
}

/// 更新所有测试模拟下载 .zip 的 model 的 content
- (void)updateAllRealZipModelContent_inAppGroup {
    NSMutableArray *values = self.sectionDataModels[4].values;
    for (int index = 0; index < values.count; index++) {
        CQDMModuleModel *module = values[index];
        NSString *symbolsBundleRelativePath = [TSWidgetExtensionDataUtil getSymbolsBundleRelativePath];
        if (index == 0) {
            if (symbolsBundleRelativePath != nil) {
                module.content = @"已正式下载 .zip 到沙盒中";
            } else {
                module.content = @"请先点击，以正式下载 .zip 到沙盒中";
            }
        } else {
            if (symbolsBundleRelativePath != nil) {
                module.content = @"已正式下载 .zip 到沙盒中，可点击直接读取";
            } else {
                module.content = @"请先正式下载 .zip 到沙盒中";
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
