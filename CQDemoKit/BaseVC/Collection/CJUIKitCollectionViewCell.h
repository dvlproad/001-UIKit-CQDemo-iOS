//
//  CJUIKitCollectionViewCell.h
//  CJUIKitDemo
//
//  Created by ciyouzen on 8/10/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJUIKitCollectionViewCell : UICollectionViewCell {
    
}
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UILabel *detailTextLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end

NS_ASSUME_NONNULL_END
