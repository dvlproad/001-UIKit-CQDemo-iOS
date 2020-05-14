//
//  TSResourceViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSResourceViewController.h"
#import "CQTSLocImagesUtil.h"
#import "CQTSNetImagesUtil.h"

@interface TSResourceViewController ()

@end

@implementation TSResourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:imageView1];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(120);
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(180);
    }];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView1.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(imageView1);
        make.centerX.mas_equalTo(imageView1);
        make.height.mas_equalTo(imageView1);
    }];

    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:imageView3];
    [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView2.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(imageView2);
        make.centerX.mas_equalTo(imageView2);
        make.height.mas_equalTo(imageView2);
    }];
    
    
    // 设置数据
    NSArray *localImageModels = [CQTSLocImagesUtil __getTestLocalImageDataModelsWithCount:10];
    CQTSLocImageDataModel *localImageModel = [localImageModels objectAtIndex:random()%10];
    UIImage *localImage = localImageModel.image;
    imageView1.image = localImage;
    
    
    NSArray *networkImageModels = [CQTSNetImagesUtil __getTestNetImageDataModelsWithCount:10];
    CQTSNetImageDataModel *networkImageModel = [networkImageModels objectAtIndex:random()%10];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *networkImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:networkImageModel.imageUrl]]];

        dispatch_async(dispatch_get_main_queue(), ^{
            imageView2.image = networkImage;
        });
    });
    
//    // 反选 VS 全选
//    UIView *selectButtonsView = [[UIView alloc] init];
//    [self.view addSubview:selectButtonsView];
//    [selectButtonsView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(collectionView.mas_bottom).mas_offset(10);
//        make.left.mas_equalTo(self.view).mas_offset(10);
//        make.centerX.mas_equalTo(self.view);
//        make.height.mas_equalTo(44);
//    }];
//    UIButton *invertselectButton = [TSButtonFactory themeBGButton];
//    [invertselectButton setTitle:@"反选" forState:UIControlStateNormal];
//    [invertselectButton addTarget:self action:@selector(invertselect:) forControlEvents:UIControlEventTouchUpInside];
//
//    UIButton *selectAllButton = [TSButtonFactory themeBGButton];
//    [selectAllButton setTitle:@"全选" forState:UIControlStateNormal];
//    [selectAllButton addTarget:self action:@selector(selectAll:) forControlEvents:UIControlEventTouchUpInside];
//    NSArray *selectButtons = @[invertselectButton, selectAllButton];
//    for (UIButton *button in selectButtons) {
//        [selectButtonsView addSubview:button];
//    }
//    [selectButtons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:0 tailSpacing:0];
//    [selectButtons mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.mas_equalTo(selectButtonsView);
//    }];
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
