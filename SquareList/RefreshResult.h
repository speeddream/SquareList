//
//  RefreshResult.h
//  Selene_Merchant
//
//  Created by zhaoqiang on 15/11/27.
//  Copyright © 2015年 hairun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RefreshEntity;

@interface RefreshResult : NSObject

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, assign) BOOL success;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, copy) NSString *ex;

@property (nonatomic, copy) NSString *serverTime;

@property (nonatomic, strong) RefreshEntity *entity;

@end


@interface RefreshEntity : NSObject

@property (nonatomic, assign) NSInteger pageNo;

/** 总页数 */
@property (nonatomic, assign) NSInteger pages;

/** 分页数据 */
@property (nonatomic, strong) NSArray *items;

/** 当前页 */
@property (nonatomic, assign) NSInteger currentPage;

/** 每页个数 */
@property (nonatomic, assign) NSInteger pageSize;

/** 总数 */
@property (nonatomic, assign) NSInteger total;

@end

