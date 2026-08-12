//
//  BaseUIHomeViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "BaseUIHomeViewController.h"
#import <CQDemoKit/CJUIKitRandomUtil.h>

#import "TSButtonHomeViewController.h"
#import "TSContainerViewController.h"
#import "TSSegmentViewController.h"

// FrameworkResource 的测试
#import "TSFrameworkResourceViewController.h"

@interface BaseUIHomeViewController () {
    
}

@end

@implementation BaseUIHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"Demo首页", nil); //知识点:使得tabBar中的title可以和显示在顶部的title保持各自
    

    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    // SwiftUI 与 UI 互转as
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 SwiftUI 功能";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"SwiftUI 功能";
            module.content = @"1.SwiftUI首页 \n2.1SwiftUI as UIKit \n2.2UIKit as SwiftUI \n3.类型擦除";
            module.contentLines = 4;
            module.classEntry = NSClassFromString(@"TSDemo_Demo_Swift.TSSwiftUIFeatureHomeViewController");
            [sectionDataModel.values addObject:module];
        }
        
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // Button、Container、Switch
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 Button、Container、Switch 等";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Button";
            module.content = [@[
                @"主题按钮:themeBGButton \ themeBorderButton",
                @"状态按钮:submitButton",
                @"bug按钮:bugButton",
                @"单选按钮的组合:",
                @"-【单行或者单列】:CQTSRadioButtonsView",
                @"-【多行或者多列】:CQTSRipeButtonCollectionView",
            ] componentsJoinedByString:@"\n"];
            module.classEntry = [TSButtonHomeViewController class];
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Container";
            module.classEntry = [TSContainerViewController class];
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Segment";
            module.classEntry = [TSSegmentViewController class];
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // FrameworkResource 的测试
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"FrameworkResource 的测试";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"FrameworkResource 的测试";
            module.classEntry = [TSFrameworkResourceViewController class];
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    self.sectionDataModels = sectionDataModels;
    
    // 导航栏右边按钮
    [self tsGoOtherViewControllerByRightBarButtonItem];
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
