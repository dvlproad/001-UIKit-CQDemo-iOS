//
//  CQTSRipeImageCollectionViewCell.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 8/10/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import "CQTSRipeImageCollectionViewCell.h"
#import <Masonry/Masonry.h>

static const CGFloat badgeLabelWidth = 16;  // badge的宽高大小
const CGFloat badgeLabelMargin = 4;         // badge与cell的距离

@interface CQTSRipeImageCollectionViewCell () {
    
}
@property (nonatomic, strong) UILabel *messageTipLabel;

@end

@implementation CQTSRipeImageCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
//        self.selectedBackgroundView = ({
//            UIView *view = [UIView new];
//            view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0]; //#f4f4f4
//            view;
//        });
        
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.titleNameLabel];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.messageTipLabel];

    [self.titleNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView).mas_offset(0);
        make.height.mas_equalTo(12);
    }];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(badgeLabelMargin);
        make.bottom.mas_equalTo(self.titleNameLabel.mas_top).mas_offset(-6);
        make.width.mas_equalTo(self.iconImageView.mas_height).multipliedBy(1.0);
        make.centerX.mas_equalTo(self.contentView);
    }];
    
    [self.messageTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImageView.mas_top).mas_offset(-badgeLabelMargin);
        make.right.mas_equalTo(self.iconImageView.mas_right).mas_offset(badgeLabelMargin);
        make.width.mas_equalTo(badgeLabelWidth);
        make.height.mas_equalTo(badgeLabelWidth);
    }];
}

- (void)setupBadgeCount:(NSInteger)badgeCount withMaxNumber:(NSInteger)maxCount {
    _badgeCount = badgeCount;
    
    if (badgeCount <= 0) {
        self.messageTipLabel.hidden = YES;
        self.messageTipLabel.text = @"";
        return;
    }
    
    self.messageTipLabel.hidden = NO;
    
    NSString *badgeString = [NSString stringWithFormat:@"%@", @(badgeCount)];
    if (badgeCount > maxCount) {
        badgeString = [NSString stringWithFormat:@"%ld+", maxCount];
    }
    self.messageTipLabel.text = badgeString;
}

#pragma mark - lazy init
@synthesize titleNameLabel = _titleNameLabel;
- (UILabel *)titleNameLabel {
    if (!_titleNameLabel) {
        _titleNameLabel = [[UILabel alloc] init];
        _titleNameLabel.backgroundColor = [UIColor clearColor];
        _titleNameLabel.textColor =  [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0];  // (@"#333333");
        _titleNameLabel.font = [UIFont systemFontOfSize:12];
        _titleNameLabel.textAlignment = NSTextAlignmentCenter;
        //_titleNameLabel.adjustsFontSizeToFitWidth = YES; // 字号不允许进行改变
    }
    return _titleNameLabel;
}

@synthesize iconImageView = _iconImageView;
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.cornerRadius = 6;
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.backgroundColor = [UIColor clearColor];
    }
    return _iconImageView;
}

@synthesize messageTipLabel = _messageTipLabel;
- (UILabel *)messageTipLabel {
    if (!_messageTipLabel) {
        _messageTipLabel = [[UILabel alloc] init];
        _messageTipLabel.backgroundColor = [UIColor redColor]; //#ff0000
        _messageTipLabel.textColor = [UIColor whiteColor];  // (@"#FFFFFF");
        _messageTipLabel.font = [UIFont systemFontOfSize:11];
        _messageTipLabel.textAlignment = NSTextAlignmentCenter;
        _messageTipLabel.layer.cornerRadius = badgeLabelWidth/2;
        _messageTipLabel.adjustsFontSizeToFitWidth = YES;
        _messageTipLabel.minimumScaleFactor = 0.3;
        _messageTipLabel.clipsToBounds = YES;
        _messageTipLabel.hidden = YES;
    }
    return _messageTipLabel;
}

@end
