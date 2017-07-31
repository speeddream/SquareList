//
//  ServiceParams.m
//  Selene
//
//  Created by zhaoqiang on 16/5/17.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import "ServiceParams.h"
#import "AFHTTPSessionManager.h"
#import "ServiceCookie.h"
#import "HeaderFile.h"

/** 经纬度默认值北京市银科大厦 */
static NSString *LATITUDE_DEFAULT  = @"39.988188";
static NSString *LONGITUDE_DEFAULT = @"116.313337";
static NSString *CONTENT_TYPE      = @"application/json";
static NSString *CLIENT            = @"CLIENT";

static NSString *kServiceParamLatitude    = @"lat";          // 纬度
static NSString *kServiceParamLongitude   = @"lon";          // 经度
static NSString *kServiceParamCookieName  = @"ticket";       // cookie
static NSString *kServiceParamBrand       = @"brand";        // 品牌
static NSString *kServiceParamModel       = @"model";        // 机型
static NSString *kServiceParamVersion     = @"ver";          // 手机系统版本
static NSString *kServiceParamAppVersion  = @"appver";       // 应用版本
static NSString *kServiceParamDeviceCode  = @"dcode";        // 设备唯一标识符
static NSString *kServiceParamCityCode    = @"cityCode";     // 城市编码
static NSString *kServiceParamAppName     = @"appname";      // 应用名称：CLIENT/MERCHANTS
static NSString *kServiceParamContentType = @"Content-Type";

@implementation ServiceParams

#pragma mark - public method
+ (void)setAllServiceParamsWithManager:(AFHTTPSessionManager *)manager {
    NSMutableDictionary *serviceParams = [self staticServiceParams];
    // 添加另一个字典中得所有条目
//    [serviceParams addEntriesFromDictionary:[Config getCityParam]];
    [serviceParams addEntriesFromDictionary:[self dynamicServiceParams]];
    [serviceParams enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
        [manager.requestSerializer setValue:value forHTTPHeaderField:key];
    }];
}

+ (void)setAllServiceParamsWithRequest:(NSMutableURLRequest *)currentRequest {
    NSMutableDictionary *serviceParams = [self staticServiceParams];
    // 添加另一个字典中得所有条目
    [serviceParams addEntriesFromDictionary:[self dynamicServiceParams]];
    [serviceParams enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
        [currentRequest setValue:value forHTTPHeaderField:key];
    }];
}

#pragma mark - private method
/** 静态参数 */
+ (NSMutableDictionary *)staticServiceParams {
    AppContext *context = [AppContext sharedInstance];
    NSMutableDictionary *staticParams = [NSMutableDictionary dictionary];
    staticParams[kServiceParamBrand] = context.brand;
    staticParams[kServiceParamModel] = context.model;
    staticParams[kServiceParamAppName] = context.appname;
    staticParams[kServiceParamVersion] = context.ver;
    staticParams[kServiceParamAppVersion] = context.appver;
    staticParams[kServiceParamDeviceCode] = context.dcode;
    staticParams[kServiceParamContentType] = context.contentType;
    return staticParams;
}

/** 动态参数 */
+ (NSMutableDictionary *)dynamicServiceParams {
    [ServiceCookie saveCookie];
    AppContext *context = [AppContext sharedInstance];
    NSMutableDictionary *dynamicParams = [NSMutableDictionary dictionary];
    dynamicParams[kServiceParamLatitude] = context.lat;
    dynamicParams[kServiceParamLongitude] = context.lon;
    dynamicParams[kServiceParamCookieName] = context.ticket;
    return dynamicParams;
}

@end

@implementation AppContext

#pragma mark - public methods
+ (instancetype)sharedInstance {
    static AppContext *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppContext alloc] init];
    });
    return sharedInstance;
}

#pragma mark - overrided methods
- (instancetype)init {
    self = [super init];
    if (self) {
        self.appname     = CLIENT;
        self.contentType = CONTENT_TYPE;
        self.brand       = [UIDevice currentDevice].model;
        self.ver         = [UIDevice currentDevice].systemVersion;
        self.model       = [UIDevice currentDevice].machineModelName;
        self.dcode       = [UIDevice currentDevice].identifierForVendor.UUIDString;
        self.appver      = [UIApplication sharedApplication].appVersion;
    }
    return self;
}

- (NSString *)lat {
    return [self convertLatitudeFromGaoDeToBaidu];
}

- (NSString *)lon {
    return [self convertLongitudeFromGaoDeToBaidu];
}

//- (NSString *)ticket {
//    return [ServiceCookie getCookie]? : [self generate32BitString];
//}

- (NSString *)ticket {
    return @"1288F0C3627D3EBEEDDA72232B79FB08";
}

/** %08x为整型以16进制方式输出的格式字符串，会把后续对应参数的整型数字，以16进制输出。08的含义为，输出的16进制值占8位，不足部分左侧补0。 */
- (NSString *)generate32BitString {
    return [[NSString alloc] initWithFormat:@"%08X%08X%08X%08X", arc4random(), arc4random(), arc4random(), arc4random()];
}

/** 高德地图纬度转为百度地图纬度（因为后台是百度地图） */
- (NSString *)convertLatitudeFromGaoDeToBaidu {
    __block NSString *latitude = nil;
//    BOOL hasLatitude = IsEmptyString([Config getLatitude]);
//    [self checkLocationServiceUsingBlock:^(BOOL open) {
//        if (open && !hasLatitude) {
//            // 高德经纬度
//            CLLocationCoordinate2D GaodeCoordinate2D = CLLocationCoordinate2DMake([Config getLatitude].floatValue, [Config getLongitude].floatValue);
//            // 百度经纬度
//            CLLocationCoordinate2D BadiduCoordinate2D = [LocationConverter gcj02ToBd09:GaodeCoordinate2D];
//            latitude = [NSString stringWithFormat:@"%f", BadiduCoordinate2D.latitude];
//        }
//    }];
    
    return latitude;
}

/** 高德地图经度转为百度地图经度（因为后台是百度地图） */
- (NSString *)convertLongitudeFromGaoDeToBaidu {
    __block NSString *longitude = nil;
//    BOOL hasLatitude = IsEmptyString([Config getLatitude]);
//    [self checkLocationServiceUsingBlock:^(BOOL open) {
//        if (open && !hasLatitude) {
//            // 高德经纬度
//            CLLocationCoordinate2D GaodeCoordinate2D = CLLocationCoordinate2DMake([Config getLatitude].floatValue, [Config getLongitude].floatValue);
//            // 百度经纬度
//            CLLocationCoordinate2D BadiduCoordinate2D = [LocationConverter gcj02ToBd09:GaodeCoordinate2D];
//            longitude = [NSString stringWithFormat:@"%f", BadiduCoordinate2D.longitude];
//        }
//    }];
    return longitude;
}

/** 检查用户是否开启定位权限 */
- (void)checkLocationServiceUsingBlock:(void(^)(BOOL open))callBack {
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways) {
        // 定位功能可用
        if (callBack) { callBack(YES); }
    } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        // 定位功能不可用
        if (callBack) { callBack(NO); }
    }
}

@end


