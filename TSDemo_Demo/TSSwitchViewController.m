//
//  TSSwitchViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSSwitchViewController.h"
#import <CQDemoKit/CJUIKitToastUtil.h>
#import <CQDemoKit/CQTSSwitchViewFactory.h>

@interface TSSwitchViewController ()

@end

@implementation TSSwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // switchView
    UIView *switchView = [CQTSSwitchViewFactory switchViewWithTitle:@"是否打开" switchOn:NO switchValueChangedBlock:^(UISwitch * _Nonnull bSwitch) {
        NSString *message = [NSString stringWithFormat:@"当前开关状态为%@", bSwitch.on ? @"开" : @"关"];
        [CJUIKitToastUtil showMessage:message];
    }];
    [self.view addSubview:switchView];
    [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(120);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
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
