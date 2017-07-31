//
//  ServiceCookie.h
//  Selene
//
//  Created by zhaoqiang on 15/11/24.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceFactory.h"

static NSString *const kCookie      = @"Cookie";
static NSString *const kLoginStatus = @"LoginStatus";
static NSString *const CookieName   = @"ticket";

@interface ServiceCookie : NSObject

/** 从缓存中取cookie然后保存到plist中 */
+ (void)saveCookie;

/** 从plist中取cookie */
+ (NSString *)getCookie;

/** 移除plist中的cookieDict */
+ (void)removeCookie;

/** 登录、注册成功，保存登录状态到plist中 */
+ (void)saveLoginStatus:(BOOL)status;

/** 判断是否登录 */
+ (BOOL)isLogin;

@end
