//
//  UIUtilHomeViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "UIUtilHomeViewController.h"
#import <CQDemoKit/CJUIKitToastUtil.h>
#import <CQDemoKit/CJUIKitAlertUtil.h>
#import <CQDemoKit/CQTSQuickPopupUtil.h>
#import <CQDemoKit/CQTSBottomBlankView.h>

@interface UIUtilHomeViewController () {
    
}

@end

@implementation UIUtilHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"UI-Util首页", nil);
    

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
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"底部弹窗(CQTSQuickPopupUtil)";
            module.actionBlock = ^{
                UIView *popupView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
                popupView.backgroundColor = [UIColor greenColor];
                
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setTitle:@"点我收起" forState:UIControlStateNormal];
                [btn setBackgroundColor:[UIColor redColor]];
                [btn addTarget:self action:@selector(hidePopupAction:) forControlEvents:UIControlEventTouchUpInside];
                [popupView addSubview:btn];
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(popupView).offset(50);
                    make.centerX.equalTo(popupView);
                    make.width.mas_equalTo(200);
                    make.height.mas_equalTo(44);
                }];
                
                [CQTSQuickPopupUtil showWindowBottomClearView:popupView height:200 tapBlankComplete:^(CQTSBottomBlankView * _Nonnull bBlankView) {
                    [bBlankView hideBlankView];
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

- (void)hidePopupAction:(UIButton *)button {
    CQTSBottomBlankView *popupView = [CQTSBottomBlankView blankViewFromPopupView:button];
    [popupView hideBlankView];
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
