//
//  SquareListCollectionCell.h
//  Selene
//
//  Created by 边惠芳 on 16/6/20.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShareListItem;

static NSString *const CellReuseID = @"SquareListCollectionCell";

typedef void(^LikeActionBlock)();

@interface SquareListCollectionCell : UICollectionViewCell

@property (nonatomic, strong) ShareListItem *shareItem;

@property (nonatomic, copy) LikeActionBlock likeActionBlock;

@property (weak, nonatomic) IBOutlet UIButton *attentionBtn;

@end
