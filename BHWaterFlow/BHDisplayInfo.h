//
//  BHDisplayInfo.h
//  BHWaterFlow
//
//  Created by natsu on 16/6/12.
//  Copyright © 2016年 natsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BHDisplayInfo : NSObject
// the width of the item will be shown in collectionview
@property (nonatomic, assign) NSInteger w;
// the height ...
@property (nonatomic, assign) NSInteger h;
// color
@property (nonatomic, strong) UIColor *itemColor;
@end
