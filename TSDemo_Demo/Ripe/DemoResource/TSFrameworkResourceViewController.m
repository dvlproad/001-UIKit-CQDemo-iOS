//
//  TSFrameworkResourceViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSFrameworkResourceViewController.h"
#import "CQTSLocImagesUtil.h"
#import "CQTSNetImagesUtil.h"
#import <CQDemoKit/CQTSContainerViewFactory.h>
#import <CJBaseUtil_Swift/CJBaseUtil_Swift-Swift.h>

@interface TSFrameworkResourceViewController ()

@property (nonatomic, strong) UIImageView *imageView2;

@end

@implementation TSFrameworkResourceViewController

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
    NSBundle *bundle11 = [NSBundle cj_frameworkResourceBundle:@"CQDemoResource" ocClassName:@"CQTSLocImagesUtil"];
    NSBundle *bundle12 = [NSBundle cj_frameworkResourceBundle:@"CQDemoResource" swiftClassName:@"CQTSLocImagesUtil" nameSpace:@"CQDemoResource"];   // CQTSLocImagesUtil 不是 swift写的类
    NSBundle *bundle0 = [NSBundle cj_frameworkResourceBundle:@"CQDemoResource"]; // 内部循环
    
    UIImage *localImage1 = [UIImage imageNamed:@"cqts_1.jpg" inBundle:bundle11 compatibleWithTraitCollection:nil];
    imageView1.image = localImage1;

    UIImage *localImage2 = [UIImage imageNamed:@"cqts_1.jpg" inBundle:bundle12 compatibleWithTraitCollection:nil];
    imageView2.image = localImage2;
    
    UIImage *longVerticalImage = [UIImage imageNamed:@"cqts_long_vertical_1.jpg" inBundle:bundle0 compatibleWithTraitCollection:nil];
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
