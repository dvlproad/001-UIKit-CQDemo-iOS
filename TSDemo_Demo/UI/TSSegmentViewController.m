#import "TSSegmentViewController.h"
#import <CQDemoKit/CJUIKitToastUtil.h>
#import <CQDemoKit/CQTSSegmentViewFactory.h>

@interface TSSegmentViewController ()

@end

@implementation TSSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *segmentView = [CQTSSegmentViewFactory segmentViewWithTitle:@"排序方式"
                                                                items:@[@"时间", @"热度", @"评分"]
                                                        selectedIndex:0
                                              segmentValueChangedBlock:^(UISegmentedControl *segment) {
        NSString *message = [NSString stringWithFormat:@"选中索引: %ld", (long)segment.selectedSegmentIndex];
        [CJUIKitToastUtil showMessage:message];
    }];
    [self.view addSubview:segmentView];
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(120);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
}

@end
