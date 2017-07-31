//
//  ServiceParams.h
//  Selene
//
//  Created by zhaoqiang on 16/5/17.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AppContext, AFHTTPSessionManager;

@interface ServiceParams : NSObject

/** 设置所有公共参数 */
+ (void)setAllServiceParamsWithManager:(AFHTTPSessionManager *)manager;

/** webview设置所有公共参数 */
+ (void)setAllServiceParamsWithRequest:(NSMutableURLRequest *)currentRequest;

/** 设置动态参数 */
+ (NSMutableDictionary *)dynamicServiceParams;

@end

@interface AppContext : NSObject

+ (instancetype)sharedInstance;

/** 登录凭据 */
@property (nonatomic, copy, readonly) NSString *ticket;

/** 纬度 */
@property (nonatomic, copy, readonly) NSString *lat;

/** 经度 */
@property (nonatomic, copy, readonly) NSString *lon;

/** 手机品牌(iPhone、iPad or others) */
@property (nonatomic, copy) NSString *brand;

/** 机型 */
@property (nonatomic, copy) NSString *model;

/** 系统版本 */
@property (nonatomic, copy) NSString *ver;

/** 应用版本 */
@property (nonatomic, copy) NSString *appver;

/** 设备唯一标识符(卸载后会变) */
@property (nonatomic, copy) NSString *dcode;

/** 应用标识(CLIENT/MERCHANTS) */
@property (nonatomic, copy) NSString *appname;

/** 数据类型 */
@property (nonatomic, copy) NSString *contentType;

/** 城市编码 */
@property (nonatomic, copy) NSString *cityCode;

@end

