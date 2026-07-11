//
//  TSFrameworkResourceViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSFrameworkResourceViewController.h"
#import <CQDemoKit/CQTSContainerViewFactory.h>
#import <CQDemoKit/UIView+CQAuxiliaryText.h>
#import <CQDemoResource/UIImage+CQDemoResource.h>
#import <CJBaseUtil_Swift/CJBaseUtil_Swift-Swift.h>

@interface TSFrameworkResourceViewController ()

@property (nonatomic, strong) UIImageView *imageView2;

@end

@implementation TSFrameworkResourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSLocalizedString(@"FrameworkResource 的测试", nil);
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    __weak typeof(self) weakSelf = self;
    
#pragma mark Bundle的获取测试
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
    
    UIView *container = [CQTSContainerViewFactory containerViewAlongAxis:MASAxisTypeVertical withSubviews:subViews fixedSpacing:10];
    container.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
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
        } else {
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(10);
        }
        make.height.mas_equalTo(50*subViews.count);
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.centerX.mas_equalTo(self.view);
    }];
    
    
    // 设置数据
    NSBundle *bundle11 = [NSBundle cj_frameworkResourceBundle:@"CQDemoResource" ocClassName:@"CQTSLocImagesUtil"];
    NSBundle *bundle12 = [NSBundle cj_frameworkResourceBundle:@"CQDemoResource" swiftClassName:@"CQTSLocImagesUtil" nameSpace:@"CQDemoResource"];   // CQTSLocImagesUtil 不是 swift写的类
    NSBundle *bundle0 = [NSBundle cj_frameworkResourceBundle:@"CQDemoResource"]; // 内部循环
    
    UIImage *localImage1 = [UIImage imageNamed:@"cqts_1" inBundle:bundle11 compatibleWithTraitCollection:nil];
    imageView1.image = localImage1;
    if (localImage1 == nil) {
        [self _addErrorText:@"测试成功:需要完整的图片名(严格的有后缀就加，无后缀就不用)" toView:imageView1];
    }

    UIImage *localImage2 = [UIImage imageNamed:@"cqts_1.jpg" inBundle:bundle11 compatibleWithTraitCollection:nil];
    imageView2.image = localImage2;
    if (localImage2 != nil) {
        [self _addErrorText:@"✅:严格的有后缀就加，无后缀就不用(jpg)" toView:imageView2];
    }
    
    UIImage *longVerticalImage = [UIImage imageNamed:@"cqts_long_vertical_1.jpg" inBundle:bundle0 compatibleWithTraitCollection:nil];
    imageView3.image = longVerticalImage;
    
    
    
#pragma mark 图片的获取测试
    UIImageView *xcassetImageView1 = [[UIImageView alloc] initWithFrame:CGRectZero];
    xcassetImageView1.contentMode = UIViewContentModeScaleAspectFill;
    xcassetImageView1.layer.masksToBounds = YES;
    
    UIImageView *xcassetImageView2 = [[UIImageView alloc] initWithFrame:CGRectZero];
    xcassetImageView2.contentMode = UIViewContentModeScaleAspectFill;
    xcassetImageView2.layer.masksToBounds = YES;
    
    UIImageView *xcassetImageView11 = [[UIImageView alloc] initWithFrame:CGRectZero];
    xcassetImageView11.contentMode = UIViewContentModeScaleAspectFill;
    xcassetImageView11.layer.masksToBounds = YES;
    
    UIImageView *nocache_xcassetImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    nocache_xcassetImageView.contentMode = UIViewContentModeScaleAspectFill;
    nocache_xcassetImageView.layer.masksToBounds = YES;
    
    UIImageView *nocache_imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    nocache_imageView.contentMode = UIViewContentModeScaleAspectFill;
    nocache_imageView.layer.masksToBounds = YES;
    
    NSArray *subViews2 = @[xcassetImageView1, xcassetImageView2, xcassetImageView11,
                          nocache_xcassetImageView, nocache_imageView,
    ];
    UIView *container2 = [CQTSContainerViewFactory containerViewAlongAxis:MASAxisTypeVertical withSubviews:subViews2 fixedSpacing:20];
    container2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.2];
    [self.view addSubview:container2];
    [container2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(container.mas_bottom).offset(10);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-10);
        } else {
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop).offset(-10);
        }
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.centerX.mas_equalTo(self.view);
    }];
    
    
    UIImage *xcassetImage1 = [UIImage imageNamed:@"cqts_xcasset_jpg_1" inBundle:bundle11 compatibleWithTraitCollection:nil];
    xcassetImageView1.image = xcassetImage1;
    if (xcassetImage1 != nil) {
        [self _addErrorText:@"✅:xcasset内的图片不用后缀(jpeg)" toView:xcassetImageView1];
    }
    
    UIImage *xcassetImage2 = [UIImage imageNamed:@"cqts_xcasset_symbol_1" inBundle:bundle11 compatibleWithTraitCollection:nil];
    xcassetImageView2.image = xcassetImage2;
    if (xcassetImage2 != nil) {
        [self _addErrorText:@"✅:xcasset内的图片不用后缀(svg)" toView:xcassetImageView2];
    }
    
    UIImage *xcassetImage11 = [UIImage cqresource_imageNamed:@"cqts_xcasset_jpg_3"];
    xcassetImageView11.image = xcassetImage11;
    if (xcassetImage11 == nil) {
        [self _addErrorText:@"Error:xcasset内的图片加载失败" toView:xcassetImageView11];
    }
    
    UIImage *nocache_xcassetImage = [UIImage cqresource_noCache_imageNamed:@"cqts_xcasset_jpg_4"];
    nocache_xcassetImageView.image = nocache_xcassetImage;
    if (nocache_xcassetImage == nil) {
        [self _addErrorText:@"测试成功:xcasset内的图片，使用 imageWithContentsOfFile 加载失败" toView:nocache_xcassetImageView];
    }
    
    UIImage *nocache_image = [UIImage cqresource_noCache_imageNamed:@"cqts_1.jpg"];
    nocache_imageView.image = nocache_image;
    if (nocache_image != nil) {
        [self _addErrorText:@"✅:xcasset外的图片，使用 imageWithContentsOfFile 加载成功" toView:nocache_imageView];
    }
}

- (void)_addErrorText:(NSString *)errorText toView:(UIView *)view {
    [view cqdemo_addPromptText:errorText layout:CQAuxiliaryAlignmentCenter height:44];
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
