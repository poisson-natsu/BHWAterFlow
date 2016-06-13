//
//  BHCollectionViewCell.m
//  BHWaterFlow
//
//  Created by natsu on 16/6/12.
//  Copyright © 2016年 natsu. All rights reserved.
//

#import "BHCollectionViewCell.h"

@interface BHCollectionViewCell ()


@end

@implementation BHCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.markLabel];
    }
    return self;
}

- (UILabel *)markLabel
{
    if (!_markLabel) {
        _markLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _markLabel.textAlignment = NSTextAlignmentCenter;
        _markLabel.textColor = [UIColor whiteColor];
    }
    
    return _markLabel;
}

- (void)setBounds:(CGRect)bounds
{
    [super setBounds:bounds];
    
    self.contentView.frame = bounds;
}

- (void)setItem:(BHDisplayInfo *)item
{
    _item = item;
    
    
}

@end
