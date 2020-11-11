//
//  TSTabBarViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSTabBarViewController.h"
#import "DemoHomeViewController.h"

@interface TSTabBarViewController ()

@end

@implementation TSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray<CQDMTabBarModel *> *tabBarModels = [[NSMutableArray alloc] init];
    {
        CQDMTabBarModel *tabBarModel = [[CQDMTabBarModel alloc] init];
        tabBarModel.title = NSLocalizedString(@"首页1", nil);
        tabBarModel.classEntry = [DemoHomeViewController class];
        [tabBarModels addObject:tabBarModel];
    }
    {
        CQDMTabBarModel *tabBarModel = [[CQDMTabBarModel alloc] init];
        tabBarModel.title = NSLocalizedString(@"首页2", nil);
        tabBarModel.classEntry = [DemoHomeViewController class];
        [tabBarModels addObject:tabBarModel];
    }
    
    self.tabBarModels = tabBarModels;
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
