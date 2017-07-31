//
//  ServiceCookie.m
//  Selene
//
//  Created by zhaoqiang on 15/11/24.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import "ServiceCookie.h"

@implementation ServiceCookie

/* 
    注意：setObject：forKey：中Key的对象是一个id类型，并不是NSString，只不过我们经常使用NSString而已。

    现在总结他们2者的区别就是：
    1, setObject：forkey：中value是不能够为nil的，不然会报错。
       setValue：forKey：中value能够为nil，但是当value为nil的时候，会自动调用removeObject：forKey方法
    2, setValue：forKey：中key的参数只能够是NSString类型，而setObject：forKey：的可以是任何类型
*/
#pragma mark - 处理cookie业务
/** 存cookie */
+ (void)saveCookie {
    // 检查本地沙盒是否有cookie
    NSString *cookieDaomain = [ServiceFactory getCurrentBaseAPI];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    for (NSHTTPCookie *cookie in cookies) {
        if ([cookie.name isEqualToString:CookieName]) {
            if ([cookieDaomain containsString:cookie.domain]) {
                [defaults setValue:cookie.value forKey:kCookie];
                [defaults synchronize];
                // 跳出内循环
                break;
            }
        }
    }
    
    if (!cookies.count) {
        // 重新刷新验证码写入cookie
    }
}

+ (NSString *)getCookie {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *cookie = [defaults valueForKey:kCookie];
    return cookie;
}

+ (void)removeCookie {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:kCookie];
    [defaults synchronize];
}

+ (void)saveLoginStatus:(BOOL)status {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:status forKey:kLoginStatus];
    [userDefaults synchronize];
}

+ (BOOL)isLogin {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:kLoginStatus];
}

@end
