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
    self.navigationItem.title = NSLocalizedString(@"测试本地图片、网络图片", nil);
    
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
    UIImage *localImage = [CQTSLocImagesUtil cjts_localImageRandom];
    imageView1.image = localImage;
    
    
    NSString *networkImageUrl = [CQTSNetImagesUtil cjts_imageUrlRandom];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *networkImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:networkImageUrl]]];

        dispatch_async(dispatch_get_main_queue(), ^{
            imageView2.image = networkImage;
        });
    });
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
