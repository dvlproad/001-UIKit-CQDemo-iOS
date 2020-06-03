//
//  TSContainerViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSContainerViewController.h"
#import <CQDemoKit/CJUIKitToastUtil.h>
#import <CQDemoKit/CQTSContainerViewFactory.h>

@interface TSContainerViewController ()

@end

@implementation TSContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // buttonsView
    UIView *buttonsView = [CQTSContainerViewFactory threeButtonsViewAlongAxis:MASAxisTypeVertical title1:@"按钮1" actionBlock1:^(UIButton * _Nonnull bButton) {
        [CJUIKitToastUtil showMessage:@"你点击了按钮1"];
    } title2:@"按钮2" actionBlock2:^(UIButton * _Nonnull bButton) {
        [CJUIKitToastUtil showMessage:@"你点击了按钮2"];
    } title3:@"按钮3" actionBlock3:^(UIButton * _Nonnull bButton) {
        [CJUIKitToastUtil showMessage:@"你点击了按钮3"];
    }];
    [self.view addSubview:buttonsView];
    [buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(120);
        make.height.mas_equalTo(44*3+10*2);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).mas_offset(20);
    }];
    
    
    UIView *buttonsView2 = [CQTSContainerViewFactory threeButtonsViewAlongAxis:MASAxisTypeHorizontal title1:@"按钮4" actionBlock1:^(UIButton * _Nonnull bButton) {
        [CJUIKitToastUtil showMessage:@"你点击了按钮4"];
    } title2:@"按钮5" actionBlock2:^(UIButton * _Nonnull bButton) {
        [CJUIKitToastUtil showMessage:@"你点击了按钮5"];
    } title3:@"按钮6" actionBlock3:^(UIButton * _Nonnull bButton) {
        [CJUIKitToastUtil showMessage:@"你点击了按钮6"];
    }];
    [self.view addSubview:buttonsView2];
    [buttonsView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(buttonsView.mas_bottom).mas_offset(40);
        make.height.mas_equalTo(44);
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
