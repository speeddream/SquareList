//
//  Service.h
//  Selene
//
//  Created by zhaoqiang on 15/11/16.
//  Copyright © 2016年 hairun. All rights reserved.
//  网络请求底层：负责整个项目的所有HTTP请求(基类封装----解耦)

#import "AFHTTPSessionManager.h"
#import "ServiceParams.h"
#import "ServiceConfig.h"
#import "ServiceAPI.h"

#define ServiceManager [Service sharedManager]

typedef void (^failureBlock)(NSError *error);
typedef void (^successBlock)(id responseObject);
typedef void (^progressBlock)(NSProgress *progress);

@interface Service : AFHTTPSessionManager

/** HTTP会话管理者单例(请求响应数据为JSON) */
+ (AFHTTPSessionManager *)sharedManager;

/** 请求图片二进制数据，请求响应数据为NSData */
+ (AFHTTPSessionManager *)imageManager;

/** 在成功的回调中判断SVProgressHUD是否需要Dismiss */
+ (void)setProgressHUDNeedDismiss:(BOOL)progressHUDNeedDismiss;

/**
 *  GET/POST请求
 *
 *  @param url     请求地址
 *  @param params  求情参数
 *  @param method  请求方式
 *  @param success 请求成功回调
 *  @param failure 请求失败回调
 *  @return        返回请求任务（NSURLSessionDataTask）
 */
+ (NSURLSessionDataTask *)requestWithUrl:(NSString *)url
                                  params:(id)params
                                  method:(HTTPRequestMethod)method
                                 success:(successBlock)success
                                 failure:(failureBlock)failure;

/**
 *  @param url     请求地址
 *  @param params  求情参数
 *  @param success 请求成功回调
 *  @param failure 请求失败回调
 *  @return        返回请求任务（NSURLSessionDataTask）
 */
+ (NSURLSessionDataTask *)getWithUrl:(NSString *)url
                              params:(id)params
                             success:(successBlock)success
                             failure:(failureBlock)failure;

/**
 *  @param url     请求地址
 *  @param params  求情参数
 *  @param success 请求成功回调
 *  @param failure 请求失败回调
 *  @return        返回请求任务（NSURLSessionDataTask）
 */
+ (NSURLSessionDataTask *)postWithUrl:(NSString *)url
                               params:(id)params
                              success:(successBlock)success
                              failure:(failureBlock)failure;
/**
 *  上传图片（单张/多张图片）
 *  内部已经压缩已过了
 *  @param url     请求地址
 *  @param params  请求参数
 *  @param images   图片数据(数组)
 *  @param success 请求成功回调
 *  @param failure 请求失败回调
 *
 *  @return 返回请求任务（NSURLSessionDataTask）
 */
+ (NSURLSessionDataTask *)uploadWithUrl:(NSString *)url
                                 params:(id)params
                                 images:(NSArray<UIImage *> *)images
                                success:(successBlock)success
                                failure:(failureBlock)failure;

/**
 *  上传图片（带进度条的回调）
 *
 *  @param url      请求地址
 *  @param params   请求参数
 *  @param imageDatas    图片数据(数组)
 *  @param progress 上传图片的进度回调
 *  @param success  请求成功回调
 *  @param failure  请求失败回调
 *
 *  @return 返回请求任务（NSURLSessionDataTask）
 */
+ (NSURLSessionDataTask *)uploadWithUrl:(NSString *)url
                               params:(id)params
                               datas:(NSArray<NSData *> *)imageDatas
                             progress:(progressBlock)progress
                              success:(successBlock)success
                              failure:(failureBlock)failure;

/**
 *  上传二进制数据
 *
 *  @param url      请求地址
 *  @param params   请求参数
 *  @param fileData     二进制数据
 *  @param name     本地文件路径
 *  @param fileName 本地文件路径
 *  @param mimeType 本地文件路径
 *  @param success  请求成功回调
 *  @param failure  请求失败回调
 *
 *  @return 返回请求任务（NSURLSessionDataTask）
 */
+ (NSURLSessionDataTask *)uploadWithUrl:(NSString *)url
                                 params:(id)params
                                   data:(NSData *)fileData
                                   name:(NSString *)name
                               fileName:(NSString *)fileName
                               mimeType:(NSString *)mimeType
                                success:(successBlock)success
                                failure:(failureBlock)failure;

/**
 *  下载文件
 *
 *  @param url      请求地址
 *  @param filePath   文件路径
 *  @param progress 上传进度回调
 *  @param success  请求成功回调
 *  @param failure  请求失败回调
 *
 *  @return 返回请求任务（NSURLSessionDataTask）
 */
+ (NSURLSessionTask *)downloadWithUrl:(NSString *)url
                             filePath:(NSString *)filePath
                             progress:(progressBlock)progress
                              success:(successBlock)success
                              failure:(failureBlock)failure;

@end
