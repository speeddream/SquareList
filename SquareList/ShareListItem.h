//
//  ShareListItem.h
//  Selene
//
//  Created by 边惠芳 on 16/4/11.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShareListItem : NSObject

@property (nonatomic, copy) NSString *shareId;

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *userDefineStore;

@property (nonatomic, copy) NSString *storeId;

@property (nonatomic, copy) NSString *shareFrom;

@property (nonatomic, copy) NSString *benefitInfo;

@property (nonatomic, copy) NSString *describe;

@property (nonatomic, copy) NSString *supportTotal;

@property (nonatomic, copy) NSString *utime;

@property (nonatomic, copy) NSString *updateBy;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) BOOL del;

@property (nonatomic, copy) NSString *hot;

@property (nonatomic, copy) NSString *upTime;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, copy) NSString *bmName;

@property (nonatomic, strong) NSURL *userImage;

@property (nonatomic, copy) NSString *scanNum;

@property (nonatomic, copy) NSString *supportNum;

@property (nonatomic, assign) BOOL selfSupport;

@property (nonatomic, strong) NSURL *shareImage;

@property (nonatomic, strong) NSURL *levelImage;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, strong) NSArray<NSURL *> *imgList;

@property (nonatomic, assign) BOOL star;

@end

