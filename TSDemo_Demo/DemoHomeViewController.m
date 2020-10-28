//
//  DemoHomeViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "DemoHomeViewController.h"
#import <CQDemoKit/CJUIKitToastUtil.h>
#import <CQDemoKit/CJUIKitAlertUtil.h>

#import "TSResourceViewController.h"
#import "TSResourceCollectionViewController.h"

#import "TSButtonHomeViewController.h"
#import "TSContainerViewController.h"
#import "TSSwitchViewController.h"

@interface DemoHomeViewController () {
    
}

@end

@implementation DemoHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"Demo首页", nil); //知识点:使得tabBar中的title可以和显示在顶部的title保持各自
    

    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    // Overlay
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 Overlay 等";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Toast";
            module.actionBlock = ^{
                [CJUIKitToastUtil showMessage:@"展示信息"];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Alert(我知道了)";
            module.actionBlock = ^{
                [CJUIKitAlertUtil showIKnowAlertInViewController:self withTitle:@"最多选择9张" iKnowBlock:^{
                    [CJUIKitToastUtil showMessage:@"点击我知道了"];
                }];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Alert(取消+确认)";
            module.actionBlock = ^{
                [CJUIKitAlertUtil showCancleOKAlertInViewController:self withTitle:@"提示" message:@"选择比努力更重要" cancleBlock:^{
                    [CJUIKitToastUtil showMessage:@"点击取消"];
                } okBlock:^{
                    [CJUIKitToastUtil showMessage:@"点击确认"];
                }];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"ActionSheet";
            module.actionBlock = ^{
                [CJUIKitAlertUtil showActionSheetInViewController:self withTitle:@"提示" message:@"选择比努力更重要" itemTitles:@[@"从相册选择", @"拍摄"] cancleBlock:^{
                    [CJUIKitToastUtil showMessage:@"点击取消"];
                } itemClickBlock:^(NSInteger index) {
                    NSString *message = [NSString stringWithFormat:@"点击index=%zd", index];
                    [CJUIKitToastUtil showMessage:message];
                }];
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // Resources
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试 Resources 等";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Resources";
            module.classEntry = [TSResourceViewController class];
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"Resources All";
            module.classEntry = [TSResourceCollectionViewController class];
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
            module.title = @"Switch";
            module.classEntry = [TSSwitchViewController class];
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
