//
//  CJValidateStringBigTableViewCell.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/12/29.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "CJValidateStringBigTableViewCell.h"

@interface CJValidateStringBigTableViewCell () {
    
}

@end

@implementation CJValidateStringBigTableViewCell

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setupViews];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

#pragma mark - Setter
- (void)setFixResultLableWidth:(CGFloat)fixResultLableWidth {
    _fixResultLableWidth = fixResultLableWidth;
    
    if (fixResultLableWidth > 20) {
        [self.resultLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(fixResultLableWidth));
        }];
    }
}

- (void)setupViews {
    self.backgroundColor = [UIColor clearColor];
    
    //UIView *parentView = self.contentView;
    UIView *container = [UIView new];
    container.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView).mas_offset(5);
        make.left.mas_equalTo(self.contentView).mas_offset(5);
    }];
    UIView *parentView = container;
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectZero];
    textView.font = [UIFont systemFontOfSize:14];
//    textField.minimumFontSize = 6;
//    [textField addTarget:self action:@selector(__textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(__textViewDidChange)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    [parentView addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(parentView);
        make.centerX.mas_equalTo(parentView);
        make.height.mas_equalTo(60);
        make.top.mas_equalTo(parentView);
    }];
    self.textView = textView;
    
    
    UIButton *validateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [validateButton setBackgroundColor:[UIColor colorWithRed:0.4 green:0.3 blue:0.4 alpha:0.5]];
    [validateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [validateButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [validateButton.titleLabel setMinimumScaleFactor:0.4];
    [validateButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [validateButton addTarget:self action:@selector(validateAction) forControlEvents:UIControlEventTouchUpInside];
    [parentView addSubview:validateButton];
    [validateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(textView);
        make.width.mas_equalTo(88);
        make.height.mas_equalTo(22);
        make.top.mas_equalTo(textView.mas_bottom);
    }];
    self.validateButton = validateButton;
    
    
    UILabel *resultLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    resultLabel.numberOfLines = 0;
    resultLabel.backgroundColor = [UIColor orangeColor];
    resultLabel.textColor = [UIColor lightGrayColor];
    resultLabel.textAlignment = NSTextAlignmentLeft;
    resultLabel.font = [UIFont systemFontOfSize:14];
    [parentView addSubview:resultLabel];
    [resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(textView);
        make.right.mas_equalTo(textView);
        make.top.mas_equalTo(validateButton.mas_bottom);
        make.bottom.mas_equalTo(parentView);
    }];
    self.resultLabel = resultLabel;
}


- (void)validateAction {
    [self validateEvent:NO];
}
/**
 *  cell执行既定操作
 *
 *  @param isAutoExec   是否在cell显示出来的时候自动执行
 */
- (void)validateEvent:(BOOL)isAutoExec {
    BOOL validateSuccess = YES;
    if (self.validateHandle) {
        validateSuccess = self.validateHandle(self, isAutoExec);
    }
    
    self.resultLabel.backgroundColor = validateSuccess ? [UIColor greenColor] : [UIColor redColor];
}


#pragma mark - Private Method
- (void)__textViewDidChange:(UITextView *)textView {
    //NSLog(@"textField内容改变了:%@", textView.text);
    !self.textDidChangeBlock ?: self.textDidChangeBlock(textView.text);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
