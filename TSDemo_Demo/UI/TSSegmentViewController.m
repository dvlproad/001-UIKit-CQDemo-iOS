#import "TSSegmentViewController.h"
#import <CQDemoKit/CJUIKitToastUtil.h>
#import <CQDemoKit/UISegmentedControl+CQTSMoreProperty.h>
#import <CQDemoKit/UIView+CQAuxiliaryTitle.h>
#import <Masonry/Masonry.h>

@interface TSSegmentViewController ()

@end

@implementation TSSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"时间", @"热度", @"评分"]];
    segment.selectedSegmentIndex = 0;
    segment.cqtsValueChangedBlock = ^(UISegmentedControl *segment) {
        NSString *message = [NSString stringWithFormat:@"选中索引: %ld", (long)segment.selectedSegmentIndex];
        [CJUIKitToastUtil showMessage:message];
    };
    UIView *segmentView = [segment cqts_withLeftTitle:@"排序方式"];
    [self.view addSubview:segmentView];
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(120);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
}

@end
