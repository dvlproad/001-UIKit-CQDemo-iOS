//
//  TSRipeButtonViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSRipeButtonViewController.h"
#import <CQDemoKit/CQTSRipeButton.h>

@interface TSRipeButtonViewController ()

@end

@implementation TSRipeButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSLocalizedString(@"测试CQTSRipeButton", nil);
    
    UIButton *button1 = tsRipeButtonIndex(1);
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(120);
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(180);
    }];
    
    UIButton *button2 = tsRipeButtonIndex(2);
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(button1.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(button1);
        make.centerX.mas_equalTo(button1);
        make.height.mas_equalTo(button1);
    }];

    UIButton *button3 = tsRipeButtonIndex(3);
    [self.view addSubview:button3];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(button2.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(button2);
        make.centerX.mas_equalTo(button2);
        make.height.mas_equalTo(button2);
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
