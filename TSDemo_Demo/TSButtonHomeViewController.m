//
//  TSButtonHomeViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSButtonHomeViewController.h"
#import <CQDemoKit/CJUIKitToastUtil.h>

//Button
#import <CQDemoKit/CQTSButtonFactory.h>
#import <CQDemoKit/CQTSContainerViewFactory.h>

@interface TSButtonHomeViewController () {
    
}

@end

@implementation TSButtonHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"测试Button", nil);
    
    // themeBGButton
    UIButton *themeBGButton = [CQTSButtonFactory themeBGButtonWithTitle:@"以主题色为背景的按钮" actionBlock:^(UIButton * _Nonnull bButton) {
        [CJUIKitToastUtil showMessage:@"点击以主题色为背景的按钮"];
    }];
    
    // themeBorderButton
    UIButton *themeBorderButton = [CQTSButtonFactory themeBorderButtonWithTitle:@"以主题色为边框的按钮" actionBlock:^(UIButton * _Nonnull bButton) {
        [CJUIKitToastUtil showMessage:@"以主题色为边框的按钮"];
    }];
    
    // submitButton
    UIButton *submitButton = [CQTSButtonFactory submitButtonWithSubmitTitle:NSLocalizedString(@"提交", nil) editTitle:NSLocalizedString(@"修改", nil) showEditTitle:YES clickSubmitTitleHandle:^(UIButton *button) {
        button.selected = !button.selected;
    } clickEditTitleHandle:^(UIButton *button) {
        button.selected = !button.selected;
    }];
    
    // buttons
    NSArray *buttons = @[themeBGButton, themeBorderButton, submitButton];
    
    UIView *buttonsView = [CQTSContainerViewFactory containerViewAlongAxis:MASAxisTypeVertical withSubviews:buttons];
    
    [self.view addSubview:buttonsView];
    [buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(120);
        make.height.mas_equalTo(44*3+10*2);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).mas_offset(20);
    }];
    
    
//    [self updateScrollHeightWithBottomInterval:40 accordingToLastBottomView:submitButton];
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
