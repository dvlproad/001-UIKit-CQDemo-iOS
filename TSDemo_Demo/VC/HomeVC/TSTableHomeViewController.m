#import "TSTableHomeViewController.h"
#import "TSSingleLineTextViewController.h"
#import "TSMultilineTextViewController.h"
#import "TSManualTestMethodViewController.h"

#import <CQDemoKit/CJUIKitToastUtil.h>
#import "TSTabBarViewController.h"

@interface TSTableHomeViewController ()

@end

@implementation TSTableHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = NSLocalizedString(@"ModuleModel测试首页", nil);
    
    __weak typeof(self) weakSelf = self;
    
    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    // 1. title + content 显示属性测试
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"title / content 显示属性测试";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"仅 title";
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"title + content";
            module.content = @"这是一段副标题描述文本";
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = [@[
                @"多行标题(限制 titleLines = 2)",
                @"第二行标题",
                @"第三行标题",
            ] componentsJoinedByString:@"\n"];
            module.titleLines = 3;
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"多行副标题(限制 contentLines = 2)";
            module.content = [@[
                @"第一行副标题",
                @"第二行副标题",
                @"第三行副标题",
            ] componentsJoinedByString:@"\n"];
            module.contentLines = 2;
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // 2. actionBlock 导航方式测试
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"导航方式测试: actionBlock (优先级最高)";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"actionBlock - Toast提示";
            module.content = @"点击后弹Toast";
            module.actionBlock = ^{
                [CJUIKitToastUtil showMessage:@"actionBlock 执行成功"];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"actionBlock - Push控制器";
            module.content = [@[
                @"actionBlock 中手动 push",
                @"actionBlock 优先于 classEntry 执行",
            ] componentsJoinedByString:@"\n"];
            module.actionBlock = ^{
                UIViewController *vc = [[UIViewController alloc] init];
                vc.view.backgroundColor = [UIColor whiteColor];
                vc.title = @"手动Push";
                vc.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // 3. selector 导航方式测试
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"导航方式测试: selector (优先级第二)";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"selector - 测试方法";
            module.content = [@[
                @"点击执行 testSelectorAction:",
                @"selector优先级高于classEntry",
            ] componentsJoinedByString:@"\n"];
            module.selector = @selector(testSelectorAction);
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // 4. viewGetterHandle 视图方式测试
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"导航方式测试: viewGetterHandle (优先级第三)";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"viewGetterHandle - 任意视图";
            module.content = @"返回一个UILabel视图";
            module.viewGetterHandle = ^UIView *{
                UILabel *label = [[UILabel alloc] init];
                label.text = @"这是通过 viewGetterHandle 创建的 UILabel";
                label.textAlignment = NSTextAlignmentCenter;
                label.numberOfLines = 0;
                label.backgroundColor = [UIColor lightGrayColor];
                return label;
            };
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // 5. viewController 控制器方式测试
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = [@[
            @"导航方式测试: UIViewController (优先级最后)",
            @"优先级顺序为：",
            @"4.1 viewControllerGetterHandle",
            @"4.2 classEntry+isCreateByXib=YES (可选额外设xibBundle)",
            @"4.3 classEntry",
        ]  componentsJoinedByString:@"\n"];
        
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"4.1 module.viewControllerGetterHandle = ^UIViewController *{";
            module.content = [@[
                @"本方法是万能的",
                @"可返回任何 VC",
                @"viewControllerGetterHandle优先级高于classEntry"
            ]  componentsJoinedByString:@"\n"];
            module.viewControllerGetterHandle = ^UIViewController *{
                UIViewController *vc = [[UIViewController alloc] init];
                vc.view.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
                
                UILabel *label = [[UILabel alloc] init];
                label.text = @"通过 viewControllerGetterHandle 创建";
                label.textColor = [UIColor whiteColor];
                label.textAlignment = NSTextAlignmentCenter;
                label.frame = CGRectMake(20, 100, 300, 50);
                [vc.view addSubview:label];
                
                return vc;
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = [@[
                @"4.2 module.classEntry = [TSXXXViewController class];",
                @"    moudle.isCreateByXib = YES;",
                @"    moudle.xibBundle = zzz;",
            ] componentsJoinedByString:@"\n"];
            module.content = [@[
                @"快捷创建用xib初始化的vc",
                @"因为要创建xib,所以此种情况此处暂不测试",
            ] componentsJoinedByString:@"\n"];
            module.actionBlock = ^{
                NSString *message = [NSString stringWithFormat:@"暂不测试使用xib的情况"];
                [CJUIKitToastUtil showMessage:message];
            };
            module.classEntry = [UIViewController class];
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"4.3 module.classEntry = [TSXXXViewController class];";
            module.content = @"有 init 创建方法的控制器";
            module.content = [@[
                @"快捷创建用init初始化的vc",
                @"注意：此控制器必须要有 [[xxx alloc] init]; 方法才能用",
            ] componentsJoinedByString:@"\n"];
            module.classEntry = [TSSingleLineTextViewController class];
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    
    // 6. UITabBarController 测试（特殊处理：替换 rootViewController）
    // 注意: execModuleModel 中检测到 isKindOfClass:[UITabBarController class] 时，不走 push，
    //       而是直接替换 window.rootViewController，并创建一个悬浮"返回主页"按钮。
    //       由于项目使用了 SceneDelegate(iOS13+)，需通过 self.view.window 获取 keyWindow，
    //       同时悬浮按钮的 CQTSSuspendWindow 也需设置 windowScene 才能显示。
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"导航方式测试: UITabBarController (特殊处理)";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"UITabBarController 特殊处理";
            module.content = [@[
                @"点击后会替换 window.rootViewController",
                @"并创建悬浮返回按钮（可拖拽）",
            ] componentsJoinedByString:@"\n"];
            module.classEntry = [TSTabBarViewController class];
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    // 7. 附加属性测试
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"附加属性测试: userInfo / unReadNumber / indexPath";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"userInfo 携带数据";
            module.content = @"点击后在actionBlock中读取";
            module.userInfo = @{@"key1": @"value1", @"number": @42};
            module.actionBlock = ^{
                [CJUIKitToastUtil showMessage:[NSString stringWithFormat:@"userInfo: %@", @{@"key1": @"value1", @"number": @42}]];
            };
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"unReadNumber 未读数";
            module.content = @"unReadNumber = 5";
            module.unReadNumber = 5;
            module.classEntry = [UIViewController class];
            [sectionDataModel.values addObject:module];
        }
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"indexPath 记录位置";
            module.content = @"手动设置 indexPath";
            module.indexPath = [NSIndexPath indexPathForRow:2 inSection:6];
            module.classEntry = [UIViewController class];
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    
    
    // 8. 综合场景测试
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"综合组合场景测试";
        {
            CQDMModuleModel *module = [[CQDMModuleModel alloc] init];
            module.title = @"全部属性均有值";
            module.content = @"actionBlock/selector/viewGetterHandle/classEntry都有值，应执行actionBlock";
            module.actionBlock = ^{
                [CJUIKitToastUtil showMessage:@"优先执行 actionBlock（actionBlock > selector > viewGetterHandle > classEntry）"];
            };
            module.selector = @selector(testSelectorAction);
            module.viewGetterHandle = ^UIView *{
                return [[UILabel alloc] init];
            };
            module.classEntry = [UIViewController class];
            module.userInfo = @{@"priority": @"actionBlock"};
            module.unReadNumber = 99;
            [sectionDataModel.values addObject:module];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    self.sectionDataModels = sectionDataModels;
}

#pragma mark - Selector Actions

- (void)testSelectorAction {
    [CJUIKitToastUtil showMessage:@"selector 执行成功"];
}

- (void)buttonAction {
    [CJUIKitToastUtil showMessage:@"按钮被点击了"];
}

@end
