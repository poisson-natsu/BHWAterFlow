//
//  ViewController.m
//  BHWaterFlow
//
//  Created by natsu on 16/6/12.
//  Copyright © 2016年 natsu. All rights reserved.
//

#import "ViewController.h"
#import "BHDisplayInfo.h"
#import "BHCollectionViewCell.h"
#import "BHWaterFlowLayout.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kReuse @"henghenghahei"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) BHWaterFlowLayout *flowLayout;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation ViewController

- (NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.flowLayout = [[BHWaterFlowLayout alloc] init];
    self.flowLayout.columnCount = 2;
    self.flowLayout.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, kScreenW, kScreenH - 20) collectionViewLayout:self.flowLayout];
    [self.collectionView registerClass:[BHCollectionViewCell class] forCellWithReuseIdentifier:kReuse];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    
    // 制造数据源
    for (int i = 0; i < 20; i++) {
        // 随机宽高
        BHDisplayInfo *info = [[BHDisplayInfo alloc] init];
        [self.items addObject:info];
    }
    
    self.flowLayout.items = self.items;
    [self.collectionView reloadData];
}

#pragma mark - collectionview delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuse forIndexPath:indexPath];
    
    BHDisplayInfo *item = self.items[indexPath.item];
    cell.markLabel.text = [NSString stringWithFormat:@"%li", indexPath.item + 1];
    cell.markLabel.backgroundColor = item.itemColor;
    return cell;
}



@end
