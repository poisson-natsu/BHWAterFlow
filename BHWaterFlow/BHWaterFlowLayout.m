//
//  BHWaterFlowLayout.m
//  BHWaterFlow
//
//  Created by natsu on 16/6/12.
//  Copyright © 2016年 natsu. All rights reserved.
//

#import "BHWaterFlowLayout.h"
#import "BHDisplayInfo.h"

@interface BHWaterFlowLayout ()
// 所有item的属性的数组
@property (nonatomic, strong) NSArray *layoutAttributes;

@property (nonatomic, assign) CGFloat maxHeight;
@end

@implementation BHWaterFlowLayout

/**
 *  布局准备方法 当collectionView的布局发生变化时 会被调用
 *  通常是做布局的准备工作 itemSize.....
 *  UICollectionView 的 contentSize 是根据 itemSize 动态计算出来的
 */
- (void)prepareLayout
{
    // 根据列数 计算item的宽度
    CGFloat contentW = self.collectionView.bounds.size.width - self.sectionInset.left - self.sectionInset.right;
    CGFloat marginX = self.minimumInteritemSpacing;
    CGFloat itemW = (contentW - marginX * (self.columnCount - 1))/self.columnCount;
    
    // 计算布局属性
    [self computeAttributesWithItemWidth:itemW];
}

- (void)computeAttributesWithItemWidth:(CGFloat)itemW
{
    // 定义一个列高数组 记录每一列的总高度
    CGFloat columnHeight[self.columnCount];
    // 定义一个记录每一列的总item个数的数组
    CGFloat columnItemCount[self.columnCount];
    
    // initialize
    for (int i = 0; i < self.columnCount; i++) {
        columnHeight[i] = self.sectionInset.top;
        columnItemCount[i] = 0;
    }
    
    // 遍历 数组计算相关的属性
    NSInteger index = 0;
    NSMutableArray *attributesArray = [NSMutableArray array];
    
    if (self.sectionHeaderHeight > 0)
    {
        // 添加header属性
        NSIndexPath *footerIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        UICollectionViewLayoutAttributes *headerAttr = [UICollectionViewLayoutAttributes
                                                        layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                        withIndexPath:footerIndexPath];
        headerAttr.frame = CGRectMake(0, 0, self.collectionView.bounds.size.width, self.sectionHeaderHeight);
        [attributesArray addObject:headerAttr];
        
        for (int i = 0; i < self.columnCount ; i ++)
        {
            columnHeight[i] += self.sectionHeaderHeight + 10;
            columnItemCount[i] = 1;
        }
    }
    else
    {
        for (int i = 0; i < self.columnCount ; i ++)
        {
            columnHeight[i] += 10;
            columnItemCount[i] = 1;
        }
    }
    
    for (BHDisplayInfo *item in self.items) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        // 找出最短列号
        NSInteger column = [self shortestColumn:columnHeight];
        // 数据追加此列
        columnItemCount[column]++;
        // x
        CGFloat itemX = (itemW + self.minimumInteritemSpacing) * column + self.sectionInset.left;
        // y
        CGFloat itemY = columnHeight[column];
        // 等比例缩放 计算item高度
        CGFloat itemH = item.h * itemW / item.w;
        // 设置frame
        attributes.frame = CGRectMake(itemX, itemY, itemW, itemH);
        [attributesArray addObject:attributes];
        
        // 累加高度
        columnHeight[column] += itemH + self.minimumLineSpacing;
        
        index++;
    }
    
    // 找出最高列列号
    NSInteger column = [self highestColumn:columnHeight];
    
    // 设置
    CGFloat itemH = (columnHeight[column] - self.minimumLineSpacing * columnItemCount[column]) / columnItemCount[column];
    self.maxHeight = columnHeight[column];
    self.itemSize = CGSizeMake(itemW, itemH);
    // 属性数组setter
    self.layoutAttributes = attributesArray.copy;
    
}

- (NSInteger)shortestColumn:(CGFloat *)columnHeight
{
    CGFloat max = CGFLOAT_MAX;
    NSInteger column = 0;
    for (int i = 0; i < self.columnCount; i++) {
        if (columnHeight[i] < max) {
            max = columnHeight[i];
            column = i;
        }
    }
    return column;
}

- (NSInteger)highestColumn:(CGFloat *)columnHeight
{
    CGFloat min = 0;
    NSInteger column = 0;
    for (int i = 0; i < self.columnCount; i++) {
        if (columnHeight[i] > min) {
            min = columnHeight[i];
            column = i;
        }
    }
    return column;
}

// 跟踪效果：当到达要显示的区域时 会计算所有显示item的属性
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.layoutAttributes;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.frame.size.width, self.maxHeight);
}



@end
