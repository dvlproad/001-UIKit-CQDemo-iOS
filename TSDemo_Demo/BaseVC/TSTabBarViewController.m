//
//  TSTabBarViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSTabBarViewController.h"
#import "BaseUIHomeViewController.h"
#import "UtilHomeViewController.h"
#import "RipeViewHomeViewController.h"

@interface TSTabBarViewController ()

@end

@implementation TSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray<CQDMTabBarModel *> *tabBarModels = [[NSMutableArray alloc] init];
    {
        CQDMTabBarModel *tabBarModel = [[CQDMTabBarModel alloc] init];
        tabBarModel.title = NSLocalizedString(@"BaseUI", nil);
        tabBarModel.classEntry = [BaseUIHomeViewController class];
        [tabBarModels addObject:tabBarModel];
    }
    {
        CQDMTabBarModel *tabBarModel = [[CQDMTabBarModel alloc] init];
        tabBarModel.title = NSLocalizedString(@"Util", nil);
        tabBarModel.classEntry = [UtilHomeViewController class];
        [tabBarModels addObject:tabBarModel];
    }
    {
        CQDMTabBarModel *tabBarModel = [[CQDMTabBarModel alloc] init];
        tabBarModel.title = NSLocalizedString(@"RipeView", nil);
        tabBarModel.classEntry = [RipeViewHomeViewController class];
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
