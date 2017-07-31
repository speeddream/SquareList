//
//  MainService.m
//  Selene
//
//  Created by zhaoqiang on 16/5/17.
//  Copyright © 2016年 hairun. All rights reserved.
//  

#import "MainService.h"
#import "ServiceAPI.h"

@implementation MainService
@synthesize developApiBaseUrl = _developApiBaseUrl, releaseApiBaseUrl = _releaseApiBaseUrl;

/** 开发环境 */
- (NSString *)developApiBaseUrl {
    if (_developApiBaseUrl == nil) {
        _developApiBaseUrl = DevelopBaseAPI;
    }
    return _developApiBaseUrl;
}

/** 生产环境 */
- (NSString *)releaseApiBaseUrl {
    if (_releaseApiBaseUrl == nil) {
        _releaseApiBaseUrl = ReleaseBaseAPI;
    }
    return _releaseApiBaseUrl;
}

@end
