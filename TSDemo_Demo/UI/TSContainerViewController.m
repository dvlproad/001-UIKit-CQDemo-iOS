//
//  TSContainerViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSContainerViewController.h"
#import <CQDemoKit/CJUIKitToastUtil.h>
#import <CQDemoKit/CQTSButtonFactory.h>
#import <CQDemoKit/CQTSContainerViewFactory.h>

@interface TSContainerViewController ()

@end

@implementation TSContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // verticalButtonsView
    
    NSArray *verticalButtons = @[
        [CQTSButtonFactory themeBGButtonWithTitle:@"按钮1" actionBlock:^(UIButton * _Nonnull bButton) {
            [CJUIKitToastUtil showMessage:@"你点击了按钮1"];
        }],
        [CQTSButtonFactory themeBGButtonWithTitle:@"按钮2" actionBlock:^(UIButton * _Nonnull bButton) {
            [CJUIKitToastUtil showMessage:@"你点击了按钮2"];
        }],
        [CQTSButtonFactory themeBGButtonWithTitle:@"按钮3" actionBlock:^(UIButton * _Nonnull bButton) {
            [CJUIKitToastUtil showMessage:@"你点击了按钮3"];
        }],
    ];
    UIView *verticalButtonsView = [CQTSContainerViewFactory containerViewAlongAxis:MASAxisTypeVertical withSubviews:verticalButtons fixedSpacing:10];
    [self.view addSubview:verticalButtonsView];
    [verticalButtonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(120);
        make.height.mas_equalTo(44*3+10*2);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).mas_offset(20);
    }];
    
    
    NSArray *horizontalButtons = @[
        [CQTSButtonFactory themeBGButtonWithTitle:@"按钮1" actionBlock:^(UIButton * _Nonnull bButton) {
            [CJUIKitToastUtil showMessage:@"你点击了按钮1"];
        }],
        [CQTSButtonFactory themeBGButtonWithTitle:@"按钮2" actionBlock:^(UIButton * _Nonnull bButton) {
            [CJUIKitToastUtil showMessage:@"你点击了按钮2"];
        }],
        [CQTSButtonFactory themeBGButtonWithTitle:@"按钮3" actionBlock:^(UIButton * _Nonnull bButton) {
            [CJUIKitToastUtil showMessage:@"你点击了按钮3"];
        }],
    ];
    UIView *horizontalButtonsView = [CQTSContainerViewFactory containerViewAlongAxis:MASAxisTypeHorizontal withSubviews:horizontalButtons fixedSpacing:10];
    [self.view addSubview:horizontalButtonsView];
    [horizontalButtonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(verticalButtonsView.mas_bottom).mas_offset(40);
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
