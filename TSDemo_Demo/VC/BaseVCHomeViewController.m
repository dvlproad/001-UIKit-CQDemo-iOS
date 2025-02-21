//
//  BaseVCHomeViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "BaseVCHomeViewController.h"
#import <CQDemoKit/UIView+CQAuxiliaryText.h>
#import <SwiftExtraCJHelper/SwiftExtraCJHelper-Swift.h>

#import "TSSingleLineTextViewController.h"
#import "TSMultilineTextViewController.h"
#import <TSDemo_Demo_Swift/TSDemo_Demo_Swift-Swift.h>

@interface BaseVCHomeViewController () {
    
}

@end

@implementation BaseVCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"VC首页", nil);

    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    // 文本列表控制器
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"文本列表控制器";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Cell视图【单行排列】";
            module.classEntry = [TSSingleLineTextViewController class];
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Cell视图【多行排列】";
            module.classEntry = [TSMultilineTextViewController class];
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 SwiftUI 的 View";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"测试 SwiftUI 的 View";
            module.viewGetterHandle = ^UIView * _Nonnull{
                Class tsClass = [NSClassFromStringCJHelper swiftClassFrom:@"TSSFUIView" nameSpace:@"TSDemo_Demo-Swift"];
                if (tsClass) {
                    UIView *tsview = [[tsClass alloc] init];
                    return tsview;
                } else {
                    UIView *tsview = [[UIView alloc] init];
                    [tsview cqdemo_addPromptText:@"❌: TSTSUIView 视图生成失败,请检查" layout:CQAuxiliaryAlignmentCenter];
                    return tsview;
                }
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"测试 CQDemoSwiftUIBaseUIView";
            module.content = @"将 SwiftUI 的视图转为 UIKit 的 UIView";
            module.viewGetterHandle = ^UIView * _Nonnull{
                return [[TSSFUIView alloc] init];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"测试 CQDemoSwiftUIBaseUIViewController";
            module.content = @"将 SwiftUI 的视图转为 UIKit 的 UIViewController";
            module.classEntry = [TSSFUIViewController class];
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
