//
//  TSRipeTableViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSRipeTableViewController.h"
#import <CQDemoKit/CQTSRipeTableView.h>

@interface TSRipeTableViewController ()

@end

@implementation TSRipeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.title = NSLocalizedString(@"测试CQTSRipeTableView", nil);
    
    CQTSRipeTableView *tableView = [[CQTSRipeTableView alloc] initWithSectionRowCounts:@[@1, @3, @6, @8]];
    tableView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_topLayoutGuide).mas_offset(20);
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuide).mas_offset(-20);
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
