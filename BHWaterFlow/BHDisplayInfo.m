//
//  BHDisplayInfo.m
//  BHWaterFlow
//
//  Created by natsu on 16/6/12.
//  Copyright © 2016年 natsu. All rights reserved.
//

#import "BHDisplayInfo.h"

@implementation BHDisplayInfo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.w = arc4random()%30 + 20;// 20 - 200
        self.h = arc4random()%50 + 20;
        self.itemColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    }
    return self;
}
@end
