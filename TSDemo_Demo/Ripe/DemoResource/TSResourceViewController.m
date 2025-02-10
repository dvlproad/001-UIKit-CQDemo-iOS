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
#import <CQDemoKit/CQTSContainerViewFactory.h>

@interface TSResourceViewController ()

@property (nonatomic, strong) UIImageView *imageView2;

@end

@implementation TSResourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSLocalizedString(@"测试本地图片、网络图片", nil);
    self.view.backgroundColor = [UIColor greenColor];
    
    __weak typeof(self) weakSelf = self;
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView1.contentMode = UIViewContentModeScaleAspectFill;
    imageView1.layer.masksToBounds = YES;
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView2.contentMode = UIViewContentModeScaleAspectFill;
    imageView2.layer.masksToBounds = YES;
    self.imageView2 = imageView2;
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView3.contentMode = UIViewContentModeScaleAspectFill;
    imageView3.layer.masksToBounds = YES;
    
    NSArray *subViews = @[imageView1, imageView2, imageView3];
    
    UIView *container = [CQTSContainerViewFactory containerViewAlongAxis:MASAxisTypeVertical withSubviews:subViews fixedSpacing:20];
    [self.view addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
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
    
    
    
    
    // 设置数据
    UIImage *localImage = [CQTSLocImagesUtil cjts_localImageRandom];
    imageView1.image = localImage;
    
    
    NSString *networkImageUrl = [CQTSNetImagesUtil cjts_imageUrlRandom];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *networkImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:networkImageUrl]]];

        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.imageView2.image = networkImage;
        });
    });
    
    UIImage *longVerticalImage = [CQTSLocImagesUtil longVertical01];
    imageView3.image = longVerticalImage;
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
