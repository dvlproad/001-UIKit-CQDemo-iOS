//
//  TSManualTestMethodViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 12/7/18.
//  Copyright © 2018 dvlproad. All rights reserved.
//

#import "TSManualTestMethodViewController.h"

@interface TSManualTestMethodViewController () 

@end

@implementation TSManualTestMethodViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    //
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"测试数字的加减";
        {
            CQTSManualTestMethodModel *valueChangeModel = [[CQTSManualTestMethodModel alloc] initWithValue:@"20" textFromValueBlock:^NSString *(id value) {
                NSString *text = (NSString *)value;
                return text;
            } valueFromTextBlock:^id(NSString *string) {
                return string;
            } ];
            [valueChangeModel setupChangeExplain:@"测试<数字字符串>的加减（无结果辅助信息）" minusHandle:^id(id oldValue) {
                NSString *oldText = (NSString *)oldValue;
                NSInteger iValue = [oldText integerValue] - 1;
                NSString *newText = [@(iValue) stringValue];
                return newText;
            } addHandle:^id(id oldValue) {
                NSString *oldText = (NSString *)oldValue;
                NSInteger iValue = [oldText integerValue] + 1;
                NSString *newText = [@(iValue) stringValue];
                return newText;
            }];
            [sectionDataModel.values addObject:valueChangeModel];
        }
        {
            CQTSManualTestMethodModel *valueChangeModel = [[CQTSManualTestMethodModel alloc] initWithValue:@"20" textFromValueBlock:^NSString *(id value) {
                NSString *text = (NSString *)value;
                return text;
            } valueFromTextBlock:^id(NSString *string) {
                return string;
            } ];
            [valueChangeModel setupChangeExplain:@"测试<数字字符串>的加减（有结果辅助信息）" minusHandle:^id(id oldValue) {
                NSString *oldText = (NSString *)oldValue;
                NSInteger iValue = [oldText integerValue] - 1;
                NSString *newText = [@(iValue) stringValue];
                return newText;
            } addHandle:^id(id oldValue) {
                NSString *oldText = (NSString *)oldValue;
                NSInteger iValue = [oldText integerValue] + 1;
                NSString *newText = [@(iValue) stringValue];
                return newText;
            }];
            [valueChangeModel setupResultFromValueBlock:^NSString *(id value) {
                NSString *extarResultString = [NSString stringWithFormat:@"您方法的返回值为：%@", value];
                return extarResultString;
            }];
            [sectionDataModel.values addObject:valueChangeModel];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    self.sectionDataModels = sectionDataModels;
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
