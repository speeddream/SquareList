//
//  Service.m
//  Selene
//
//  Created by zhaoqiang on 15/11/16.
//  Copyright © 2016年 hairun. All rights reserved.
//  每次网络请求的时候，都会实例化一个AFHTTPSessionManager出来，后果自然是滚滚而来的泄露了。所以需要使用单例

#import "Service.h"
#import "ServiceParams.h"
#import "HeaderFile.h"

static NSString *kServiceStatus           = @"上传进度";
static NSString *kServiceMimeType         = @"image/jpeg";
static NSString *kServiceDateFormat       = @"yyyyMMddHHmmss";
static NSString *kServiceTimeoutInterval  = @"timeoutInterval";

static BOOL _progressHUDNeedDismiss = YES;

@interface Service ()

@end

@implementation Service

+ (AFHTTPSessionManager *)sharedManager {
    static dispatch_once_t onceToken;
    static AFHTTPSessionManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    
    return manager;
}

/** 图片管理者因为序列化的问题，暂不用单例 */
+ (AFHTTPSessionManager *)imageManager {
    AFHTTPSessionManager *imageManager = [AFHTTPSessionManager manager];
    imageManager.requestSerializer = [AFJSONRequestSerializer serializer];
    imageManager.responseSerializer = [AFImageResponseSerializer serializer];
    [ServiceParams setAllServiceParamsWithManager:imageManager];
    [imageManager setValue:[ServiceFactory baseURL] forKey:NSStringFromSelector(@selector(baseURL))];
    return imageManager;
}

/** 设置请求管理者 */
+ (void)setupServiceManagerWithUrl:(NSString *)url
                            params:(id)params
                            method:(HTTPRequestMethod)method {
    // 设置请求头参数
    [ServiceParams setAllServiceParamsWithManager:ServiceManager];
    
    // 设置响应序列化格式为JSON
    ServiceManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // 使用KVC方式修改readonly属性的值http://www.jianshu.com/p/1ffa6414008e
    [ServiceManager setValue:[ServiceFactory baseURL] forKey:NSStringFromSelector(@selector(baseURL))];
    
    ServiceManager.requestSerializer.timeoutInterval = 30.f;
    
//    NSLog(@"%@", ServiceManager.requestSerializer.HTTPRequestHeaders);
    
    // 显示网络指示器加载状态
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSLog(@"\n----------------------------- BEGIN Service PreLog ------------------------------\nmethod: GET \nticket: %@ \nurl: %@%@ \n----------------------------- END -----------------------------------------------\n\n\n", [AppContext sharedInstance].ticket, [ServiceFactory getCurrentBaseAPI], url);
}

+ (NSURLSessionDataTask *)requestWithUrl:(NSString *)url
                                  params:(id)params
                                  method:(HTTPRequestMethod)method
                                 success:(successBlock)success
                                 failure:(failureBlock)failure {
    if (HTTPRequestMethodGET == method) {
        [self getWithUrl:url params:params success:success failure:failure];
    } else if (HTTPRequestMethodPOST == method) {
        [self postWithUrl:url params:params success:success failure:failure];
    }
    return nil;
}

+ (NSURLSessionDataTask *)getWithUrl:(NSString *)url
                              params:(id)params
                             success:(successBlock)success
                             failure:(failureBlock)failure {
    [self setupServiceManagerWithUrl:url params:params method:HTTPRequestMethodGET];
    return [ServiceManager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [self handleSuccessResponse:responseObject];
        BLOCK_SAFE(success, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self handleFailureError:error];
        BLOCK_SAFE(failure, error);
    }];
}

+ (NSURLSessionDataTask *)postWithUrl:(NSString *)url
                               params:(id)params
                              success:(successBlock)success
                              failure:(failureBlock)failure {
    [self setupServiceManagerWithUrl:url params:params method:HTTPRequestMethodPOST];
    return [ServiceManager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [self handleSuccessResponse:responseObject];
        BLOCK_SAFE(success, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self handleFailureError:error];
        BLOCK_SAFE(failure, error);
    }];
}

+ (NSURLSessionDataTask *)uploadWithUrl:(NSString *)url
                                 params:(id)params
                                 images:(NSArray<UIImage *> *)images
                                success:(successBlock)success
                                failure:(failureBlock)failure {
    [self setupServiceManagerWithUrl:url params:params method:HTTPRequestMethodPOST];
    return [ServiceManager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        // 这里注意每次遍历name和fileName均要不一致才可
//        for (UIImage *image in images) {
////            [self handleFormData:formData fileData:[Config compressSourceImage:image]];
//        }
    } progress:^(NSProgress *uploadProgress) {
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        [self handleSuccessResponse:responseObject];
        BLOCK_SAFE(success, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self handleFailureError:error];
        BLOCK_SAFE(failure, error);
    }];
}

+ (NSURLSessionDataTask *)uploadWithUrl:(NSString *)url
                                 params:(id)params
                                  datas:(NSArray<NSData *> *)imageDatas
                               progress:(progressBlock)progress
                                success:(successBlock)success
                                failure:(failureBlock)failure {
    [self setupServiceManagerWithUrl:url params:params method:HTTPRequestMethodPOST];
    return [ServiceManager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        // 这里注意每次遍历name和fileName均要不一致才可
        for (NSData *imageData in imageDatas) {
            [self handleFormData:formData fileData:imageData];
        }
    } progress:^(NSProgress *uploadProgress) {
        BLOCK_SAFE(progress, uploadProgress);
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        [self handleSuccessResponse:responseObject];
        BLOCK_SAFE(success, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self handleFailureError:error];
        BLOCK_SAFE(failure, error);
    }];
}

+ (NSURLSessionDataTask *)uploadWithUrl:(NSString *)url
                                 params:(id)params
                                   data:(NSData *)fileData
                                   name:(NSString *)name
                               fileName:(NSString *)fileName
                               mimeType:(NSString *)mimeType
                                success:(successBlock)success
                                failure:(failureBlock)failure {
    [self setupServiceManagerWithUrl:url params:params method:HTTPRequestMethodPOST];
    return [ServiceManager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:fileData name:name fileName:fileName mimeType:mimeType];
//        [formData appendPartWithFileURL:[NSURL fileURLWithPath:path.absoluteString] name:@"file" fileName:@"recoder.mp3" mimeType:@"audio/mpeg3" error:nil];
    } progress:^(NSProgress *uploadProgress) {
        
    } success:^(NSURLSessionTask *task, id responseObject) {
        [self handleSuccessResponse:responseObject];
        BLOCK_SAFE(success, responseObject);
    } failure:^(NSURLSessionTask *task, NSError *error) {
        [self handleFailureError:error];
        BLOCK_SAFE(failure, error);
    }];
}

#pragma mark - 下载文件
+ (NSURLSessionTask *)downloadWithUrl:(NSString *)url
                            filePath:(NSString *)filePath
                             progress:(progressBlock)progress
                              success:(successBlock)success
                              failure:(failureBlock)failure {
    [self setupServiceManagerWithUrl:url params:nil method:HTTPRequestMethodPOST];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLSessionDownloadTask *downloadTask = [ServiceManager downloadTaskWithRequest:request progress:^(NSProgress *downloadProgress) {
        // 下载进度
        BLOCK_SAFE(progress, downloadProgress);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 拼接缓存目录
        NSString *downloadDir = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:filePath ? filePath : @"Download"];
        // 打开文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        // 创建Download目录
        [fileManager createDirectoryAtPath:downloadDir withIntermediateDirectories:YES attributes:nil error:nil];
        // 拼接文件路径
        NSString *filePath = [downloadDir stringByAppendingPathComponent:response.suggestedFilename];
        //        NSLog(@"downloadDir = %@",downloadDir);
        // 返回文件位置的URL路径
        return [NSURL fileURLWithPath:filePath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        BLOCK_SAFE(success, filePath.absoluteString);
        BLOCK_SAFE(failure, error);
    }];
    
    // 开始下载
    [downloadTask resume];
    
    return downloadTask;
}

+ (void)setProgressHUDNeedDismiss:(BOOL)progressHUDNeedDismiss {
    _progressHUDNeedDismiss = progressHUDNeedDismiss;
}

#pragma mark - private method
/** 处理返回结果 */
+ (void)handleSuccessResponse:(id)responseObject {
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//    BaseResult *result = [BaseResult mj_objectWithKeyValues:responseObject];
//    if (result.success && _progressHUDNeedDismiss) {
//        DismissHudBlock();
//    }
//    
//    if (!result.success) {
//        // 业务失败弹出失败消息
//        ShowErrorStatusWithCodeBlock(result.msg, result.code);
//
//        // 未登录或登录过期，刷新登录状态为未登录
//        if (ResponseCodeUserNotLogin == result.code || ResponseCodeTicketOverdue == result.code) {
//            [ServiceCookie saveLoginStatus:NO];
//        }
//    }
}

/** 处理错误结果 */
+ (void)handleFailureError:(NSError *)error {
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//    HGJLog(@"ERROR: %@", error.userInfo.description);
//    DismissHudBlock();
//    
//    if (NSURLErrorCancelled != error.code) {
//        [[UIApplication sharedApplication].keyWindow makeToast:error.localizedDescription duration:1.0 position:CSToastPositionCenter];
//    }
}

/** 处理上传表单数据 */
+ (void)handleFormData:(id<AFMultipartFormData>)formData fileData:(NSData *)fileData {
    // 随机数图片名
    NSString *name = [NSString stringWithFormat:@"hgj_image_%d_%d_%d", arc4random_uniform(100), arc4random_uniform(100), arc4random_uniform(100)];
    NSString *fileName = [NSString stringWithFormat:@"%@.jpg", name];
    
    // 上传表单数据
    [formData appendPartWithFileData:fileData name:name fileName:fileName mimeType:kServiceMimeType];
}

@end
