//
//  TSMultilineTextViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/12/29.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TSMultilineTextViewController.h"

@interface TSMultilineTextViewController ()

@end

@implementation TSMultilineTextViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = NSLocalizedString(@"Cell视图【多行排列】的文本列表控制器的使用示例", nil);
    self.fixTextViewHeight = 60;  // 固定textView的视图高度（该值大于44才生效），默认固定为44
    
    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    // 字符串验证
    {
        CQDMSectionDataModel *sectionDataModel = [[CQDMSectionDataModel alloc] init];
        sectionDataModel.theme = @"字符串验证";
        {
            CJDealTextModel *dealTextModel = [[CJDealTextModel alloc] init];
            dealTextModel.placeholder = @"请输入要验证的值";
            dealTextModel.text = @"一二三四五六七八九十01234567890壹贰叁肆伍陆柒捌玖拾上面就是从1到10的繁体字写法，其实从一到十的繁体字写法也就是从一到十的大写，一般用于在票据上面，据说从一到十的写法起源于明太祖朱元璋，朱元璋当时的一件重大贪污案“郭桓案”而发布法令，其中明确要求记账的数字必须由“一、二、三、四、五、六、七、八、九、十、百、千”改为“壹、贰、叁、肆、伍、陆、柒、捌、玖、拾、佰(陌)、仟(阡)”等复杂的汉字，用以增加涂改帐册的难度。后来“陌”和“阡”被改写成“佰、仟”，并一直使用到现在。";
            dealTextModel.hopeResultText = @"YES";
            dealTextModel.actionTitle = @"验证手机号";
            dealTextModel.autoExec = YES;
            dealTextModel.actionBlock = ^NSString * _Nonnull(NSString * _Nonnull oldString) {
                return @"一二三四五六七八九十01234567890壹贰叁肆伍陆柒捌玖拾上面就是从1到10的繁体字写法，其实从一到十的繁体字写法也就是从一到十的大写，一般用于在票据上面，据说从一到十的写法起源于明太祖朱元璋，朱元璋当时的一件重大贪污案“郭桓案”而发布法令，其中明确要求记账的数字必须由“一、二、三、四、五、六、七、八、九、十、百、千”改为“壹、贰、叁、肆、伍、陆、柒、捌、玖、拾、佰(陌)、仟(阡)”等复杂的汉字，用以增加涂改帐册的难度。后来“陌”和“阡”被改写成“佰、仟”，并一直使用到现在。";
            };
            [sectionDataModel.values addObject:dealTextModel];
        }
        {
            CJDealTextModel *dealTextModel = [[CJDealTextModel alloc] init];
            dealTextModel.placeholder = @"请输入要验证的值";
            dealTextModel.text = @"一二三四五六七八九十01234567890壹贰叁肆伍陆柒捌玖拾上面就是从1到10的繁体字写法，其实从一到十的繁体字写法也就是从一到十的大写，一般用于在票据上面，据说从一到十的写法起源于明太祖朱元璋，朱元璋当时的一件重大贪污案“郭桓案”而发布法令，其中明确要求记账的数字必须由“一、二、三、四、五、六、七、八、九、十、百、千”改为“壹、贰、叁、肆、伍、陆、柒、捌、玖、拾、佰(陌)、仟(阡)”等复杂的汉字，用以增加涂改帐册的难度。后来“陌”和“阡”被改写成“佰、仟”，并一直使用到现在。";
            dealTextModel.hopeResultText = @"YES";
            dealTextModel.actionTitle = @"验证手机号";
            dealTextModel.autoExec = YES;
            dealTextModel.actionBlock = ^NSString * _Nonnull(NSString * _Nonnull oldString) {
                return @"一二三四五六七八九十01234567890壹贰叁肆伍陆柒捌玖拾上面就是从1到10的繁体字写法，其实从一到十的繁体字写法也就是从一到十的大写，一般用于在票据上面，据说从一到十的写法起源于明太祖朱元璋，朱元璋当时的一件重大贪污案“郭桓案”而发布法令，其中明确要求记账的数字必须由“一、二、三、四、五、六、七、八、九、十、百、千”改为“壹、贰、叁、肆、伍、陆、柒、捌、玖、拾、佰(陌)、仟(阡)”等复杂的汉字，用以增加涂改帐册的难度。后来“陌”和“阡”被改写成“佰、仟”，并一直使用到现在。";
            };
            [sectionDataModel.values addObject:dealTextModel];
        }
        
        [sectionDataModels addObject:sectionDataModel];
    }
    

    
    self.sectionDataModels = sectionDataModels;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
