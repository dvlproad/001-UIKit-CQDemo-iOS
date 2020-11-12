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
    
    
#pragma mark normalSelectedButton View
    UIButton *normalSelectedButton1 = [CQTSButtonFactory submitButtonWithSubmitTitle:@"提交" editTitle:@"修改" showEditTitle:NO clickSubmitTitleHandle:nil clickEditTitleHandle:nil];
//    [normalSelectedButton1 setTitle:@"修改(未选中，可点)" forState:UIControlStateNormal];
    normalSelectedButton1.selected = false;
    normalSelectedButton1.enabled = true;

    UIButton *normalSelectedButton2 = [CQTSButtonFactory submitButtonWithSubmitTitle:@"提交" editTitle:@"修改" showEditTitle:NO clickSubmitTitleHandle:nil clickEditTitleHandle:nil];
//    [normalSelectedButton2 setTitle:@"修改(未选中，不可点)" forState:UIControlStateNormal];
    normalSelectedButton2.selected = false;
    normalSelectedButton2.enabled = false;

    UIButton *normalSelectedButton3 = [CQTSButtonFactory submitButtonWithSubmitTitle:@"提交" editTitle:@"修改" showEditTitle:NO clickSubmitTitleHandle:nil clickEditTitleHandle:nil];
//    [normalSelectedButton3 setTitle:@"提交(选中，可点)" forState:UIControlStateNormal];
    normalSelectedButton3.selected = true;
    normalSelectedButton3.enabled = true;

    UIButton *normalSelectedButton4 = [CQTSButtonFactory submitButtonWithSubmitTitle:@"提交" editTitle:@"修改" showEditTitle:NO clickSubmitTitleHandle:nil clickEditTitleHandle:nil];
//    [normalSelectedButton4 setTitle:@"提交(选中，不可点)" forState:UIControlStateNormal];
    normalSelectedButton4.selected = true;
    normalSelectedButton4.enabled = false;

    
    UIView *normalSelectedButtonView = [CQTSContainerViewFactory containerViewAlongAxis:MASAxisTypeVertical withSubviews:@[normalSelectedButton1, normalSelectedButton2, normalSelectedButton3, normalSelectedButton4]];
   [self.view addSubview:normalSelectedButtonView];
   [normalSelectedButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.mas_equalTo(buttonsView);
       make.centerX.mas_equalTo(buttonsView);
       make.top.mas_equalTo(buttonsView.mas_bottom).mas_offset(40);
       make.height.mas_equalTo(4*44+3*15+10+10);
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
