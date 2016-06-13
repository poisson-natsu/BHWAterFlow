//
//  BHCollectionViewCell.h
//  BHWaterFlow
//
//  Created by natsu on 16/6/12.
//  Copyright © 2016年 natsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHDisplayInfo.h"

@interface BHCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) BHDisplayInfo *item;

@property (nonatomic, strong) UILabel *markLabel;
@end
