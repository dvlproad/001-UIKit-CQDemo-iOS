//
//  TSAuxiliaryViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSAuxiliaryViewController.h"
#import <CQDemoKit/CJUIKitToastUtil.h>
#import <CQDemoKit/CQTSButtonFactory.h>
#import <CQDemoKit/CQTSContainerViewFactory.h>
#import <CQDemoKit/UIView+CQAuxiliaryText.h>

@interface TSAuxiliaryViewController ()

@end

@implementation TSAuxiliaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // buttonsView
    UIView *buttonsView = [[UIView alloc] initWithFrame:CGRectZero];
    buttonsView.backgroundColor = UIColor.redColor;
    [self.view addSubview:buttonsView];
    [buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(120);
        make.height.mas_equalTo(44*3+10*2);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).mas_offset(20);
    }];
    
    
    UIView *buttonsView2 = [CQTSContainerViewFactory threeButtonsViewAlongAxis:MASAxisTypeHorizontal title1:@"添加上辅助" actionBlock1:^(UIButton * _Nonnull bButton) {
        [buttonsView cqdemo_addPromptText:@"这是【上】辅助文本" layout:CQAuxiliaryAlignmentTop];
    } title2:@"添加中辅助" actionBlock2:^(UIButton * _Nonnull bButton) {
        [buttonsView cqdemo_addPromptText:@"这是【中】辅助文本" layout:CQAuxiliaryAlignmentCenter];
    } title3:@"添加下辅助" actionBlock3:^(UIButton * _Nonnull bButton) {
        [buttonsView cqdemo_addPromptText:@"这是【下】辅助文本" layout:CQAuxiliaryAlignmentBottom];
    }];
    [self.view addSubview:buttonsView2];
    [buttonsView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(buttonsView.mas_bottom).mas_offset(40);
        make.height.mas_equalTo(44);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).mas_offset(20);
    }];
    
    UIView *removeButtonsView = [CQTSContainerViewFactory threeButtonsViewAlongAxis:MASAxisTypeVertical title1:@"移除辅助(正序：按添加顺序移除)" actionBlock1:^(UIButton * _Nonnull bButton) {
        [buttonsView cqdemo_removePromptText:CQAuxiliaryRemoveOrderPositive];
    } title2:@"移除辅助(逆序：后添加到先移除)" actionBlock2:^(UIButton * _Nonnull bButton) {
        [buttonsView cqdemo_removePromptText:CQAuxiliaryRemoveOrderNegative];
    } title3:@"移除辅助(所有的都移除)" actionBlock3:^(UIButton * _Nonnull bButton) {
        [buttonsView cqdemo_removePromptText:CQAuxiliaryRemoveOrderAll];
    }];
    [self.view addSubview:removeButtonsView];
    [removeButtonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(buttonsView2.mas_bottom).mas_offset(40);
        make.height.mas_equalTo(44*3+10*2);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).mas_offset(20);
    }];
    
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
