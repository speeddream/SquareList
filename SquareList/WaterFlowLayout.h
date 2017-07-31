//
//  WaterFlowLayout.h
//  Selene
//
//  Created by zhaoqiang on 16/7/02.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const UICollectionElementKindSectionHeader;
UIKIT_EXTERN NSString *const UICollectionElementKindSectionFooter;

@class WaterFlowLayout;

@protocol WaterFlowLayoutDelegate <NSObject>

@required

/** 每行的高度 */
- (CGFloat)waterflowLayout:(WaterFlowLayout *)waterflowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)width;

@optional

@end

@interface WaterFlowLayout : UICollectionViewLayout

@property (nonatomic, weak) id<WaterFlowLayoutDelegate> delegate;

/** 列数 */
@property (nonatomic, assign) NSInteger columnCount; // 默认两列

/** 列间距 */
@property (nonatomic, assign) CGFloat columnMargin;

/** 行间距 */
@property (nonatomic, assign) CGFloat rowMargin;

/** 内边距 */
@property (nonatomic, assign) UIEdgeInsets edgeInsets;

@end
