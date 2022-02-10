//
//  TSRipeCollectionViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSRipeCollectionViewController.h"
#import <CQDemoKit/CQTSRipeImageCollectionView.h>
#import <CQDemoKit/CQTSLocImagesUtil.h>

@interface TSRipeCollectionViewController ()


@property (nonatomic, assign) CQTSRipeImageSource ripeImageSource;

@end



@implementation TSRipeCollectionViewController

- (instancetype)initWithRipeImageSource:(CQTSRipeImageSource)ripeImageSource {
    self = [super init];
    if (self) {
        _ripeImageSource = ripeImageSource;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSLocalizedString(@"测试CQTSRipeCollectionView", nil);
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[CQTSLocImagesUtil cjts_localImage3]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.mas_topLayoutGuide);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuide);
    }];
    
    CQTSRipeImageCollectionView *collectionView = [[CQTSRipeImageCollectionView alloc] initWithScrollDirection:UICollectionViewScrollDirectionVertical perMaxCount:3];
    [collectionView setupSectionRowCounts:@[@1, @3, @6, @8] ripeImageSource:self.ripeImageSource];
    collectionView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    collectionView.cellConfigBlock = ^(UICollectionViewCell * _Nonnull bCell) {
        bCell.contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
        bCell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    };
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        if #available(iOS 11.0, *) {
//            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
//            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-10)
//        } else {
//            // Fallback on earlier versions
//            // topLayoutGuide\bottomLayoutGuide iOS11已经被弃用
//            make.top.equalTo(topLayoutGuide.snp.bottom).offset(10)
//            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-10)
//        }
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(10);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-10);
        } else {
            // Fallback on earlier versions
            // topLayoutGuide\bottomLayoutGuide iOS11已经被弃用
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(10);
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop).offset(-10);
        }
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.centerX.mas_equalTo(self.view);
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
