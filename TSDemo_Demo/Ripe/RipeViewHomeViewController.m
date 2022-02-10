//
//  RipeViewHomeViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "RipeViewHomeViewController.h"

// DemoRipeString
#import <CQDemoKit/CJUIKitRandomUtil.h>
#import <CQDemoKit/CJUIKitToastUtil.h>

// DemoRipeResource
#import "TSResourceViewController.h"
#import "TSResourceCollectionViewController.h"

// DemoRipeView
#import "TSRipeButtonViewController.h"
#import "TSRipeTableViewController.h"
#import "TSRipeCollectionViewController.h"
#import "TSRipeButtonCollectionViewController.h"

@interface RipeViewHomeViewController () {
    
}

@end

@implementation RipeViewHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"Ripe首页", nil);
    

    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    // 为了快速构建完整Demo工程提供的一些成熟资源 RipeString
    // Random
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试随机颜色等";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"随机颜色";
            module.actionBlock = ^{
                self.tableView.backgroundColor = cqtsRandomColor();
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // Random
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试随机字符串等";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"随机字符串(中文+英文+数字 任意组合)";
            module.actionBlock = ^{
                NSString *randomString = cqtsRandomString(1, 40, CQRipeStringTypeNone);
                NSString *message = [NSString stringWithFormat:@"随机字符串为：%@", randomString];
                [CJUIKitToastUtil showMessage:message];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"随机字符串(数字)";
            module.actionBlock = ^{
                NSString *randomString = cqtsRandomString(1, 40, CQRipeStringTypeNumber);
                NSString *message = [NSString stringWithFormat:@"随机字符串为：%@", randomString];
                [CJUIKitToastUtil showMessage:message];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"随机字符串(英文)";
            module.actionBlock = ^{
                NSString *randomString = cqtsRandomString(1, 40, CQRipeStringTypeEnglish);
                NSString *message = [NSString stringWithFormat:@"随机字符串为：%@", randomString];
                [CJUIKitToastUtil showMessage:message];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"随机字符串(中文)";
            module.actionBlock = ^{
                NSString *randomString = cqtsRandomString(1, 40, CQRipeStringTypeChinese);
                NSString *message = [NSString stringWithFormat:@"随机字符串为：%@", randomString];
                [CJUIKitToastUtil showMessage:message];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"随机名字(中文)";
            module.actionBlock = ^{
                NSString *randomString = cqtsRandomName(2, 6);
                NSString *message = [NSString stringWithFormat:@"随机名字为：%@", randomString];
                [CJUIKitToastUtil showMessage:message];
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // 为了快速构建完整Demo工程提供的一些成熟资源 RipeResource
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"成熟资源 RipeResource";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Resources 单张测试图片(本地/网络)";
            module.classEntry = [TSResourceViewController class];
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Resources 所有测试图片(网络图片)";
            module.actionBlock = ^{
                UIViewController *viewController = [[TSResourceCollectionViewController alloc] initWithRipeImageSource:CQTSRipeImageSourceImageNetwork];
                [self.navigationController pushViewController:viewController animated:YES];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Resources 所有测试图片(本地图片)";
            module.actionBlock = ^{
                UIViewController *viewController = [[TSResourceCollectionViewController alloc] initWithRipeImageSource:CQTSRipeImageSourceImageLocal];
                [self.navigationController pushViewController:viewController animated:YES];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Resources 所有测试图片(网络icon)";
            module.actionBlock = ^{
                UIViewController *viewController = [[TSResourceCollectionViewController alloc] initWithRipeImageSource:CQTSRipeImageSourceIconNetwork];
                [self.navigationController pushViewController:viewController animated:YES];
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // 为了快速构建完整Demo工程提供的一些成熟视图 RipeView
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"成熟视图 RipeView";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Demo RipeButton";
            module.classEntry = [TSRipeButtonViewController class];
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Demo RipeTableView";
            module.classEntry = [TSRipeTableViewController class];
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Demo RipeCollectionView";
            module.classEntry = [TSRipeCollectionViewController class];
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Demo RipeCollectionView:Button";
            module.classEntry = [TSRipeButtonCollectionViewController class];
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    self.sectionDataModels = sectionDataModels;
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
