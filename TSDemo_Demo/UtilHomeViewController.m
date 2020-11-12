//
//  UtilHomeViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "UtilHomeViewController.h"
#import <CQDemoKit/CJUIKitRandomUtil.h>
#import <CQDemoKit/CJUIKitToastUtil.h>
#import <CQDemoKit/CJUIKitAlertUtil.h>

@interface UtilHomeViewController () {
    
}

@end

@implementation UtilHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"Util首页", nil);
    

    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    // Random
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试随机Random等";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"随机颜色";
            module.actionBlock = ^{
                self.tableView.backgroundColor = cqtsRandomColor();
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"随机字符串";
            module.actionBlock = ^{
                NSString *randomString = cqtsRandomString(40, NO);
                NSString *message = [NSString stringWithFormat:@"随机字符串为：%@", randomString];
                [CJUIKitToastUtil showMessage:message];
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
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
