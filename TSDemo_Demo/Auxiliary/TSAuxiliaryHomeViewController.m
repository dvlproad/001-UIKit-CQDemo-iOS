//
//  TSAuxiliaryHomeViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSAuxiliaryHomeViewController.h"
#import "TSAuxiliaryViewController.h"
#import "TSCopyMainBunldeFileViewController.h"

@interface TSAuxiliaryHomeViewController () {
    
}

@end

@implementation TSAuxiliaryHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"Auxiliary首页", nil); //知识点:使得tabBar中的title可以和显示在顶部的title保持各自
    

    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    // Auxiliary
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 Auxiliary 等";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Auxiliary";
            module.classEntry = [TSAuxiliaryViewController class];
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 沙盒文件 等";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"CopyMainBunldeFile";
            module.classEntry = [TSCopyMainBunldeFileViewController class];
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
