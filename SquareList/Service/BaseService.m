//
//  BaseService.m
//  Selene
//
//  Created by zhaoqiang on 16/5/17.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import "BaseService.h"
#import "ServiceConfig.h"

@interface BaseService ()

@property (nonatomic, weak) id<BaseServiceProtocol> child;

@property (nonatomic, copy) NSString *customApiBaseUrl;

@end

@implementation BaseService
@synthesize privateKey = _privateKey, apiBaseUrl = _apiBaseUrl;

- (instancetype)init {
    self = [super init];
    if (self) {
        if ([self conformsToProtocol:@protocol(BaseServiceProtocol)]) {
            self.child = (id<BaseServiceProtocol>)self;
            // 手动切换环境后会把环境类型保存起来
            NSNumber *type = [[NSUserDefaults standardUserDefaults] objectForKey:@"environmentType"];
            if (type) {
                // 有设置：优先读取手动切换环境设置
                self.environmentType = (EnvironmentType)[type integerValue];
            } else {
                // 无设置：优先宏定义生产正式环境
#ifdef BUILD_FOR_RELEASE
                self.environmentType = EnvironmentTypeRelease;
#else
                self.environmentType = EnvironmentTypeDevelop;
#endif
            }
        } else {
            NSAssert(NO, @"子类没有实现协议");
        }
    }
    return self;
}

#pragma mark - getters and setters
- (void)setEnvironmentType:(EnvironmentType)environmentType {
    if (environmentType == EnvironmentTypeHotfix) {
        if (![[NSUserDefaults standardUserDefaults] objectForKey:NSStringFromClass([self class])]) {
            [[NSUserDefaults standardUserDefaults] setObject:self.apiBaseUrl forKey:NSStringFromClass([self class])];
        }
    } else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:NSStringFromClass([self class])];
    }
    _environmentType = environmentType;
    _apiBaseUrl = nil;
}

- (NSString *)privateKey {
    if (!_privateKey) {
        _privateKey = @"abcdefghijklmn";
    }
    return _privateKey;
}

- (NSString *)apiBaseUrl {
    if (_apiBaseUrl == nil) {
        switch (self.environmentType) {
            case EnvironmentTypeDevelop:
                _apiBaseUrl = self.child.developApiBaseUrl;
                break;
            case EnvironmentTypeRelease:
                _apiBaseUrl = self.child.releaseApiBaseUrl;
                break;
            case EnvironmentTypeHotfix:
                _apiBaseUrl = self.customApiBaseUrl;
                break;
            default:
                break;
        }
    }
    return _apiBaseUrl;
}

- (NSString *)customApiBaseUrl {
    if (!_customApiBaseUrl) {
        _customApiBaseUrl = [[NSUserDefaults standardUserDefaults] objectForKey:NSStringFromClass([self class])];
    }
    return _customApiBaseUrl;
}

@end
