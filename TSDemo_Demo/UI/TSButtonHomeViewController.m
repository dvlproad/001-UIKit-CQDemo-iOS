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
#import <CQDemoKit/CQTSRadioButtonsView.h>

#import "TSRipeButtonCollectionViewController.h"

@interface TSButtonHomeViewController () {
    
}

@end

@implementation TSButtonHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"测试Button", nil);
    
    __weak typeof(self) weakSelf = self;
    UIView *containerView = self.containerView;
    
    // 主题按钮:themeBGButton \ themeBorderButton
    // themeBGButton
    UIButton *themeBGButton = [CQTSButtonFactory themeBGButtonWithTitle:@"以主题色为背景的按钮" actionBlock:^(UIButton * _Nonnull bButton) {
        [CJUIKitToastUtil showMessage:@"点击以主题色为背景的按钮"];
    }];
    
    // themeBorderButton
    UIButton *themeBorderButton = [CQTSButtonFactory themeBorderButtonWithTitle:@"以主题色为边框的按钮" actionBlock:^(UIButton * _Nonnull bButton) {
        [CJUIKitToastUtil showMessage:@"以主题色为边框的按钮"];
    }];
    
    // 状态按钮:submitButton
    UIButton *submitButton = [CQTSButtonFactory submitButtonWithSubmitTitle:NSLocalizedString(@"提交", nil) editTitle:NSLocalizedString(@"修改", nil) showEditTitle:YES clickSubmitTitleHandle:^(UIButton *button) {
        button.selected = !button.selected;
    } clickEditTitleHandle:^(UIButton *button) {
        button.selected = !button.selected;
    }];
    
    // buttons
    NSArray *buttons = @[themeBGButton, themeBorderButton, submitButton];
    
    UIView *buttonsView = [CQTSContainerViewFactory containerViewAlongAxis:MASAxisTypeVertical withSubviews:buttons fixedSpacing:10];
    
    [containerView addSubview:buttonsView];
    [buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(containerView).mas_offset(40);
        make.height.mas_equalTo(44*3+10*2);
        make.centerX.mas_equalTo(containerView);
        make.left.mas_equalTo(containerView).mas_offset(20);
    }];
    
    
#pragma mark 状态按钮
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
    
    UIView *normalSelectedButtonView = [CQTSContainerViewFactory containerViewAlongAxis:MASAxisTypeVertical withSubviews:@[normalSelectedButton1, normalSelectedButton2, normalSelectedButton3, normalSelectedButton4] fixedSpacing:10];
   [containerView addSubview:normalSelectedButtonView];
   [normalSelectedButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.mas_equalTo(buttonsView);
       make.centerX.mas_equalTo(buttonsView);
       make.top.mas_equalTo(buttonsView.mas_bottom).mas_offset(40);
       make.height.mas_equalTo(4*44+3*15+10+10);
   }];
    
    
    
    
#pragma mark 其他按钮
    // bug按钮:bugButton
    UIButton *bugButton = [CQTSButtonFactory bugButtonWithBugHappen:YES fixBugHandle:^{
        [CJUIKitToastUtil showMessage:@"修复bug"];
    } reproduceBugHandle:^{
        [CJUIKitToastUtil showMessage:@"重现bgu"];
    }];
    
    UIView *otherButtonView = [CQTSContainerViewFactory containerViewAlongAxis:MASAxisTypeVertical withSubviews:@[bugButton] fixedSpacing:10];
   [containerView addSubview:otherButtonView];
   [otherButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.mas_equalTo(normalSelectedButtonView);
       make.centerX.mas_equalTo(normalSelectedButtonView);
       make.top.mas_equalTo(normalSelectedButtonView.mas_bottom).mas_offset(40);
       make.height.mas_equalTo(44);
   }];
    
#pragma mark 单选按钮组
    NSArray<NSString *> *radioButtonTitles = @[@"按钮1", @"按钮2", @"按钮3", @"按钮4",];
    CQTSRadioButtonsView *horizontalRadioButtons = [[CQTSRadioButtonsView alloc] initWithTitles:radioButtonTitles alongAxis:MASAxisTypeHorizontal fixedSpacing:10 didSelectItemAtIndexHandle:^(NSInteger index) {
        NSString *message = [NSString stringWithFormat:@"点击了第%ld个按钮", index+1];
        [CJUIKitToastUtil showMessage:message];
    }];
    [containerView addSubview:horizontalRadioButtons];
    [horizontalRadioButtons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(otherButtonView);
        make.centerX.mas_equalTo(otherButtonView);
        make.top.mas_equalTo(otherButtonView.mas_bottom).mas_offset(40);
        make.height.mas_equalTo(44);
    }];
    
    CQTSRadioButtonsView *verticalRadioButtons = [[CQTSRadioButtonsView alloc] initWithTitles:radioButtonTitles alongAxis:MASAxisTypeVertical fixedSpacing:10 didSelectItemAtIndexHandle:^(NSInteger index) {
        NSString *message = [NSString stringWithFormat:@"点击了第%ld个按钮", index+1];
        [CJUIKitToastUtil showMessage:message];
    }];
    [containerView addSubview:verticalRadioButtons];
    [verticalRadioButtons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horizontalRadioButtons);
        make.centerX.mas_equalTo(horizontalRadioButtons);
        make.top.mas_equalTo(horizontalRadioButtons.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(4*44+3*15);
    }];
    
    // 单选按钮组合的其他实现方式:CQTSRipeButtonCollectionView
    UIButton *goRadioButton = [CQTSButtonFactory themeBGButtonWithTitle:@"查看单选按钮的组合的其他实现" actionBlock:^(UIButton * _Nonnull bButton) {
        UIViewController *viewController = [[TSRipeButtonCollectionViewController alloc] init];
        [weakSelf.navigationController pushViewController:viewController animated:YES];
    }];
   [containerView addSubview:goRadioButton];
   [goRadioButton mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.mas_equalTo(verticalRadioButtons);
       make.centerX.mas_equalTo(verticalRadioButtons);
       make.top.mas_equalTo(verticalRadioButtons.mas_bottom).mas_offset(40);
       make.height.mas_equalTo(44);
   }];
    
#pragma mark 更新ScrollView的高（如果视图滚动异常，请检查你的视图是不是加在了self.view上了。而不是self.containerView上）
    [self updateScrollHeightWithBottomInterval:40 accordingToLastBottomView:goRadioButton];
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
