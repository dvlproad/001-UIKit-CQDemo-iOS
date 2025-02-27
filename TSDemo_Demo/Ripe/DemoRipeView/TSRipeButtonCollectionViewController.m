//
//  TSRipeButtonCollectionViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSRipeButtonCollectionViewController.h"
#import <CQDemoKit/CQTSRipeButtonCollectionView.h>
#import <CQDemoKit/CQTSLocImagesUtil.h>

@interface TSRipeButtonCollectionViewController ()

@end

@implementation TSRipeButtonCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSLocalizedString(@"测试CQTSRipeButtonCollectionView", nil);
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[CQTSLocImagesUtil cjts_localImageAtIndex:2]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.mas_topLayoutGuide);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuide);
    }];
    
    NSArray<NSString *> *buttonTitles = @[@"按钮01", @"按钮02", @"按钮03", @"按钮04", @"按钮05", @"按钮06", @"按钮07", @"按钮08", @"按钮09", @"按钮10"];
    CQTSRipeButtonCollectionView *horizontalCollectionView = [[CQTSRipeButtonCollectionView alloc] initWithTitles:buttonTitles perMaxCount:1 scrollDirection:UICollectionViewScrollDirectionHorizontal didSelectItemAtIndexHandle:^(NSInteger index) {
        NSString *title = buttonTitles[index];
        NSLog(@"点击了“%@”", title);
    }];
    horizontalCollectionView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    horizontalCollectionView.cellConfigBlock = ^(UICollectionViewCell * _Nonnull bCell) {
        bCell.contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
        bCell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    };
    [self.view addSubview:horizontalCollectionView];
    [horizontalCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        if #available(iOS 11.0, *) {
//            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
//        } else {
//            // Fallback on earlier versions
//            // topLayoutGuide\bottomLayoutGuide iOS11已经被弃用
//            make.top.equalTo(topLayoutGuide.snp.bottom).offset(10)
//        }
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(10);
        } else {
            // Fallback on earlier versions
            // topLayoutGuide\bottomLayoutGuide iOS11已经被弃用
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(10);
        }
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    
    
    CQTSRipeButtonCollectionView *verticalCollectionView = [[CQTSRipeButtonCollectionView alloc] initWithTitles:buttonTitles perMaxCount:1 scrollDirection:UICollectionViewScrollDirectionVertical didSelectItemAtIndexHandle:^(NSInteger index) {
        NSString *title = buttonTitles[index];
        NSLog(@"点击了“%@”", title);
    }];
    verticalCollectionView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    verticalCollectionView.cellConfigBlock = ^(UICollectionViewCell * _Nonnull bCell) {
        bCell.contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
        bCell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    };
    [self.view addSubview:verticalCollectionView];
    [verticalCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(horizontalCollectionView.mas_bottom).offset(10);
//        if #available(iOS 11.0, *) {
//            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-10)
//        } else {
//            // Fallback on earlier versions
//            // topLayoutGuide\bottomLayoutGuide iOS11已经被弃用
//            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-10)
//        }
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-10);
        } else {
            // Fallback on earlier versions
            // topLayoutGuide\bottomLayoutGuide iOS11已经被弃用
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop).offset(-10);
        }
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.width.mas_equalTo(100);
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
