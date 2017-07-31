//
//  SquareListCollectionCell.m
//  Selene
//
//  Created by 边惠芳 on 16/6/20.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import "SquareListCollectionCell.h"
#import "ShareListItem.h"
#import "HeaderFile.h"

@interface SquareListCollectionCell()

@property (weak, nonatomic) IBOutlet UILabel *desLab;

@property (weak, nonatomic) IBOutlet UIImageView *userHeadImg;

@property (weak, nonatomic) IBOutlet UIImageView *coverImg;

@property (weak, nonatomic) IBOutlet UILabel *nickNameLab;

@property (weak, nonatomic) IBOutlet UIImageView *markView;

@property (weak, nonatomic) IBOutlet UIImageView *levelImg;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewHeight;

@end

@implementation SquareListCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.nickNameLab.textColor = self.desLab.textColor = [UIColor text5aColor];
}

- (void)setShareItem:(ShareListItem *)shareItem {
    _shareItem = shareItem;
    
    self.desLab.text = shareItem.describe;
    self.nickNameLab.text = shareItem.nickName;
    self.markView.hidden = shareItem.star? NO : YES;
    
    self.bottomViewHeight.constant = IsEmptyString(shareItem.describe)? 51 : 75;
    [self.attentionBtn setTitle:IsEqualToString(shareItem.supportNum, @"0")? @"" : shareItem.supportNum forState:UIControlStateNormal];
    [self.attentionBtn setImage:[UIImage imageNamed:shareItem.selfSupport? @"liked" : @"like"] forState:UIControlStateNormal];
    [self.attentionBtn setTitleColor:[UIColor text98Color] forState:UIControlStateNormal];
    
    [self.coverImg sd_setImageWithURL:shareItem.shareImage placeholderImage:[UIImage imageNamed:@"find_share_placeholder"]];
    [self.levelImg sd_setImageWithURL:shareItem.levelImage placeholderImage:[UIImage imageNamed:@"mine_level_plachholder"]];
    [self.userHeadImg sd_setImageWithURL:shareItem.userImage placeholderImage:[UIImage imageNamed:@"common_circle_placeholder"]];
}

- (IBAction)likeAction:(UIButton *)sender {
    BLOCK_SAFE(self.likeActionBlock);
}

@end
