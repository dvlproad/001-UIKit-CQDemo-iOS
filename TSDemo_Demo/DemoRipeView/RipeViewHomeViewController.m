//
//  RipeViewHomeViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "RipeViewHomeViewController.h"

// DemoRipeResource
#import "TSResourceViewController.h"
#import "TSResourceCollectionViewController.h"

// DemoRipeView
#import "TSRipeButtonViewController.h"
#import "TSRipeTableViewController.h"

@interface RipeViewHomeViewController () {
    
}

@end

@implementation RipeViewHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"RipeView首页", nil);
    

    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    // 为了快速构建完整Demo工程提供的一些成熟资源 RipeResource
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"成熟资源 RipeResource";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Resources";
            module.classEntry = [TSResourceViewController class];
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Resources All--Collection样式";
            module.classEntry = [TSResourceCollectionViewController class];
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
