//
//  WaterFlowLayout.m
//  Selene
//
//  Created by zhaoqiang on 16/7/02.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import "WaterFlowLayout.h"

static const CGFloat DefaultRowMargin = 0; //  默认行间距
static const CGFloat DefaultColumnMargin = 0; // 默认列间距
static const NSInteger DefaultColumnCount = 2; // 默认列数
static const UIEdgeInsets DefaultEdgeInsets = {0, 0, 0, 0}; // 默认组间距

@interface WaterFlowLayout()

/** 存放所有cell的布局属性 */
@property (nonatomic, strong) NSMutableArray *attributeses;

/** 存放所有列的当前高度 */
@property (nonatomic, strong) NSMutableArray *columnHeights;

/** 内容的高度 */
@property (nonatomic, assign) CGFloat contentHeight;

@end

@implementation WaterFlowLayout

- (instancetype)init {
    if (self = [super init]) {
        self.columnCount   = DefaultColumnCount;
        self.columnMargin  = DefaultColumnMargin;
        self.rowMargin     = DefaultRowMargin;
        self.edgeInsets    = DefaultEdgeInsets;
    }
    return self;
}

#pragma mark - 懒加载
- (NSMutableArray *)columnHeights {
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

- (NSMutableArray *)attributeses {
    if (!_attributeses) {
        _attributeses = [NSMutableArray array];
    }
    return _attributeses;
}

- (void)setupLayout {
    // 清除以前计算的所有高度
    self.contentHeight = 0;
    [self.columnHeights removeAllObjects];
    for (NSInteger i = 0; i < self.columnCount; i++) {
        [self.columnHeights addObject:@(self.edgeInsets.top)];
    }
    
    // 清除之前所有的布局属性, 开始创建每一个cell对应的布局属性
    [self.attributeses removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < count; i++) {
        // 如果item数目过大容易造成内存峰值提高
        @autoreleasepool {
            // 获取indexPath位置cell对应的布局属性
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            [self.attributeses addObject:attributes];
        }
    }
}

#pragma mark - super method
/** 预布局初始化 */
- (void)prepareLayout {
    [super prepareLayout];
    
    [self setupLayout];
}

/** 返回indexPath位置cell对应的布局属性 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 创建布局属性
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    // collectionView的宽度
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    
    // 设置布局属性的frame
    CGFloat w = (collectionViewW - self.edgeInsets.left - self.edgeInsets.right - (self.columnCount - 1) * self.columnMargin) / self.columnCount;
    CGFloat h = [self.delegate waterflowLayout:self heightForItemAtIndexPath:indexPath itemWidth:w];
    
    // 找出高度最短的那一列
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 1; i < self.columnCount; i++) {
        // 取得第i列的高度
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    
    CGFloat x = self.edgeInsets.left + destColumn * (w + self.columnMargin);
    CGFloat y = minColumnHeight;
    if (y != self.edgeInsets.top) {
        y += self.rowMargin;
    }
    attributes.frame = CGRectMake(x, y, w, h);
    
    // 更新最短那列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attributes.frame));
    
    // 记录内容的高度
    CGFloat columnHeight = [self.columnHeights[destColumn] doubleValue];
    if (self.contentHeight < columnHeight) {
        self.contentHeight = columnHeight;
    }
    return attributes;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(0, self.contentHeight + self.edgeInsets.bottom);
}

/** 决定cell的排布 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributeses;
}

/** 用来刷新layout的，当我们返回yes的时候。如果我们的需求不需要实时的刷新layout，那么最好判断newBounds 和 我们的collectionView的bounds是否相同，不同时返回yes */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
