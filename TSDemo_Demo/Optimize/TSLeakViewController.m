//
//  TSLeakViewController.m
//  TSDemo_Demo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSLeakViewController.h"

#import <CQDemoKit/CQTSRipeTableView.h>
#import <CQDemoKit/CQTSLocImagesUtil.h>
#import <CQDemoKit/UIImage+CQDemoKit.h>
#import <CQDemoKit/CQTSButtonFactory.h>

@interface TSLeakViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonnull, nonatomic, strong) NSMutableArray<NSString *> *imageNameArray;

@property (nonatomic, weak) NSTimer *timer1;
@property (nonatomic, weak) NSTimer *timer2;

@end

@implementation TSLeakViewController

- (void)dealloc {
    //NSLog(@"%s", __func__);
    NSLog(@"dealloc -[%@ dealloc], 地址%p", NSStringFromClass([self class]), self);       // 用于检测循环引用
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSLocalizedString(@"模拟内存泄露Leak", nil);
    
    __weak typeof(self) weakSelf = self;
    __strong __typeof(self) strongSelf = weakSelf;
    
    UIButton *button1 = [self themeBGButtonWithTitle:@"会泄露" action:@selector(leakMemoryCircularRreference:)];
    UIButton *button2 = [self themeBGButtonWithTitle:@"不泄露" action:@selector(leakMemoryCircularRreference:)];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(10);
        } else {
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(10);
        }
        make.height.equalTo(@44);
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.centerX.mas_equalTo(self.view);
    }];
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button1.mas_bottom).offset(10);
        make.height.equalTo(@44);
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.centerX.mas_equalTo(self.view);
    }];
    
    
    [self leakMemory];
    
//    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeInterval1:) userInfo:nil repeats:YES];
        
    /*
    错误做法：
    self.timer2 = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timeInterval2:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer2 forMode:NSDefaultRunLoopMode];
    */
    
    //正确做法：
    //特别注意：timer2创建时并没直接赋值给timer2。
    //原因是timer2是weak属性，如果直接赋值给timer2会被立即释放。
    //因为timerWithXXX方法创建的NSTimer默认并没有加入RunLoop，只有后面加入RunLoop以后才可以将引用指向timer2。从而导致执行到addTimer:forMode的时候，访问了野指针而发生EXC_BAD_ACCESS，崩溃。
//    NSTimer *tempTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timeInterval2:) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:tempTimer forMode:NSDefaultRunLoopMode];
//    self.timer2 = tempTimer;
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button2.mas_bottom).offset(10);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-10);
        } else {
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop).offset(-10);
        }
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.centerX.mas_equalTo(self.view);
    }];
    
    
    self.imageNameArray = [CQTSLocImagesUtil cjts_localImageNames];
}


- (void)timeInterval1:(id)object {
    NSLog(@"111");
}

- (void)timeInterval2:(id)object {
    NSLog(@"222");
}


// 内存泄漏示例
- (void)leakMemory {
    NSObject *leakObject = [[NSObject alloc] init];
    // 没有释放对象，导致内存泄漏
}

// 内存泄漏示例--循环引用导致的
- (void)leakMemoryCircularRreference:(UIButton *)button {
    TSLeakViewController *viewController = [[TSLeakViewController alloc] init];
    if ([button.titleLabel.text containsString:@"会泄露"]) {
        viewController.leakBlock = ^(NSString * _Nonnull title) {
            viewController.title = title;
        };
    } else {
        viewController.leakBlock = ^(NSString * _Nonnull title) {
            self.title = title;
        };
    }
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - themeBGButton
/// 以主题色为背景的按钮
///
- (UIButton *)themeBGButtonWithTitle:(NSString *)title action:(nonnull SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4;
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];

    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.imageNameArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *indexTitle = [NSString stringWithFormat:@"section:%zd", section];
    return indexTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    NSString *title = [NSString stringWithFormat:@"%zd", indexPath.row];
    cell.textLabel.text = title;
    
    NSString *imageName = [self.imageNameArray objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage cqdemokit_xcassetImageNamed:imageName withCache:YES];
  
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"点击了%zd-%zd", indexPath.section, indexPath.row);
    
    if (self.leakBlock != nil) {
        NSString *title = [NSString stringWithFormat:@"点击了%zd-%zd", indexPath.section, indexPath.row];
        self.leakBlock(title);
    }
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
