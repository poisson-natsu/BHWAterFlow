//
//  BHWaterFlowLayout.h
//  BHWaterFlow
//
//  Created by natsu on 16/6/12.
//  Copyright © 2016年 natsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHWaterFlowLayout : UICollectionViewFlowLayout
// column count
@property (nonatomic, assign) NSInteger columnCount;
// 数据源数组
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, assign) CGFloat sectionHeaderHeight;
@end
