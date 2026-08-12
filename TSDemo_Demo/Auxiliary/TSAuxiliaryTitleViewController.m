//
//  TSAuxiliaryTitleViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2026/8/13.
//  Copyright © 2026 dvlproad. All rights reserved.
//

#import "TSAuxiliaryTitleViewController.h"
#import <CQDemoKit/CJUIKitToastUtil.h>
#import <CQDemoKit/CQTSButtonFactory.h>
#import <CQDemoKit/CQTSContainerViewFactory.h>
#import <CQDemoKit/UISegmentedControl+CQTSMoreProperty.h>
#import <CQDemoKit/UIView+CQAuxiliaryTitle.h>

@interface TSAuxiliaryTitleViewController ()

@end

@implementation TSAuxiliaryTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak typeof(self) weakSelf = self;
    
    // left title:按钮(带左title)
    UIButton *leftTitleButton = [CQTSButtonFactory themeBGButtonWithTitle:@"带左title的按钮" actionBlock:^(UIButton * _Nonnull bButton) {
        [CJUIKitToastUtil showMessage:@"点击带左title的按钮"];
    }];
    UIView *leftTitleView = [leftTitleButton cqts_withLeftTitle:@"左title"];
    leftTitleView.backgroundColor = UIColor.redColor;
    [self.view addSubview:leftTitleView];
    [leftTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(120);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).mas_offset(20);
        make.height.mas_equalTo(44);
    }];
    
    // top title:按钮(带顶title)
    UIButton *topTitleButton = [CQTSButtonFactory themeBGButtonWithTitle:@"带顶title的按钮" actionBlock:^(UIButton * _Nonnull bButton) {
        [CJUIKitToastUtil showMessage:@"点击带顶title的按钮"];
    }];
    UIView *topTitleView = [topTitleButton cqts_withTopTitle:@"顶title"];
    topTitleView.backgroundColor = UIColor.greenColor;
    [self.view addSubview:topTitleView];
    [topTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(leftTitleView.mas_bottom).mas_offset(40);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).mas_offset(20);
        make.height.mas_equalTo(44+20+4);
    }];
    
    // left title:Segment(带左title)
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"时间", @"热度", @"评分"]];
    segment.selectedSegmentIndex = 0;
    segment.cqtsValueChangedBlock = ^(UISegmentedControl *segment) {
        NSString *message = [NSString stringWithFormat:@"选中索引: %ld", (long)segment.selectedSegmentIndex];
        [CJUIKitToastUtil showMessage:message];
    };
    UIView *segmentView = [segment cqts_withLeftTitle:@"排序方式"];
    [self.view addSubview:segmentView];
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topTitleView.mas_bottom).mas_offset(40);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).mas_offset(20);
        make.height.mas_equalTo(44);
    }];
    
    // 返回上一页按钮
    UIButton *backButton = [CQTSButtonFactory themeBGButtonWithTitle:@"返回" actionBlock:^(UIButton * _Nonnull bButton) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    [self.view addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(segmentView.mas_bottom).mas_offset(40);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).mas_offset(20);
        make.height.mas_equalTo(44);
    }];
}

@end
