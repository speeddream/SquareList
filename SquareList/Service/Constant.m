//uto-merging Selene/classes/General/Service/Constant.h
//  Constant.m
//  Selene
//
//  Created by zhaoqiang on 15/11/16.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AdSupport/AdSupport.h> // 获取IDFA目前
#import <mach/mach_time.h>
#import "SVProgressHUD.h"
#import <UIKit/UIKit.h>

#pragma mark - 参数字段
NSString *const kShareFromStore = @"STORE_SHARE";
NSString *const kShareFromFind  = @"FIND_SHARE";
NSString *const kShareFromGift  = @"GIFT_SHARE";

#pragma mark - 分页加载参数字段
NSString *const kParamPageSize       = @"pageSize";
NSString *const kParamCurrentPage    = @"currentPage";

#pragma mark - 晒单详情类型参数
NSString *const kShareNormal       = @"NORMAL";
NSString *const kShareExcellent    = @"EXCELLENT";
NSString *const kShareAgainst      = @"AGAINST";

#pragma mark - 其他参数
NSString *const kParamStoreId     = @"storeId";
NSString *const kParamLocType     = @"locType";
NSString *const kParamOrderType   = @"orderType";
NSString *const kParamCategoryId  = @"cateId";
NSString *const kParamStyle       = @"style";
NSString *const kParamWhere       = @"where";
NSString *const kParamType        = @"type";
NSString *const kParamAll         = @"all";
NSString *const kParamId          = @"id";
NSString *const kParamTradeId     = @"tradeId";
NSString *const kParamTargetId    = @"targetId";

NSString *const kParamMallId      = @"mallId";
NSString *const kParamBrandId     = @"brandId";
NSString *const kParamBenefitId   = @"benefitId";
NSString *const kParamShareId     = @"userShareId";
NSString *const kParamRType       = @"rtype";
NSString *const kParamFloor       = @"floor";
NSString *const kParamKeyword     = @"keyword";
NSString *const kParamMobile      = @"mobile";
NSString *const kParamPassword    = @"pwd";
NSString *const kParamRandomcode  = @"randomcode";

NSString *const kParamH5          = @"H5";
NSString *const kParamWeb         = @"WEB";
NSString *const kParamApp         = @"APP";
NSString *const kParamMall        = @"MALL";
NSString *const kParamBrand       = @"BRAND";
NSString *const kParamStore       = @"STORE";
NSString *const kParamGoods       = @"GOODS";
NSString *const kParamShare       = @"SHARE";
NSString *const kParamUser        = @"USER";
NSString *const kParamQrcode      = @"QRCODE";
NSString *const kParamBenefit     = @"BENEFIT";
NSString *const kParamSingle      = @"SINGLE";
NSString *const kParamPublic      = @"PUBLIC";
NSString *const kParamAdvert      = @"ADVERT";
NSString *const kParamPersonal    = @"PERSONAL";
NSString *const kParamDownload    = @"DOWNLOAD";
NSString *const kParamCorrection  = @"CORRECTION";
NSString *const kParamMessage     = @"MESSAGE";
NSString *const kParamPrivateMsg  = @"PRIVATE_MESSAGE";
NSString *const kParamHomeArticle = @"HOME_ARTICLE";


NSString *const kParamUserFocus   = @"USER_FOCUS";
NSString *const kParamFocusUser   = @"FOCUS_USER";
NSString *const kParamSex         = @"SEX";
NSString *const kParamGift        = @"GIFT";
NSString *const kParamBrithday    = @"BIRTHDAY";
NSString *const kParamSignature   = @"SIGNATURE";
NSString *const kParamBlackList   = @"USER_BLACK";

NSString *const kParamSquareHot    = @"HOT";
NSString *const kParamSquareFocus  = @"FOCUS";
NSString *const kParamSquareNew    = @"NEW";
NSString *const kParamSquareStar   = @"STAR";

#pragma mark -跳转控制器关键字
NSString *const kDestinationFixSelfData  = @"FIX_SELF_DATA";
NSString *const kDestinationFirstShare   = @"FIRST_SHARE";
NSString *const kDestinationBindMobile   = @"BIND_MOBILE";
NSString *const kDestinationBindWeXin    = @"BIND_WEIXIN";
NSString *const kDestinationBindWeiBo    = @"BIND_WEIBO";
NSString *const kDestinationHGJShare     = @"HGJ_SHARE";


#pragma mark - 其他关键字段
NSString *const kResultEntity    = @"entity";
NSString *const kResultSuccess   = @"success";
NSString *const kLoginUserType   = @"userType";

NSString *const kSMSTypeRegister     = @"REG";
NSString *const kSMSTypeLogin        = @"LOGIN";
NSString *const kSMSTypeFindPwd      = @"FIND_PWD";
NSString *const kSMSTypeSetPwd       = @"SET_PWD";
NSString *const kSMSTypeResetMobile  = @"RESET_MOBILE";
NSString *const kSMSTypeBindMobile   = @"BIND_MOBILE";

NSString *const kLocationLongitude = @"longitude";
NSString *const kLocationLatitude  = @"latitude";

NSString *const kIsNewUser = @"isNewUser";

#pragma mark - 友盟分享、高德地图AppKey、AppSecret
NSString *const UMAppKey                 = @"57a00254e0f55a3a4e003af5";
NSString *const GaoDeMapAppKey           = @"b392dfeb9340d44b046e30ae098e428d";
NSString *const UMShareSinaAppKey        = @"3949158478";
NSString *const UMShareSinaAppSecret     = @"16bc0740e3a31a7107bf73d418152f6d";
NSString *const UMShareSinaCallBackUrl   = @"http://sns.whalecloud.com/sina2/callback";
NSString *const UMShareCommonCallBackUrl = @"http://mobile.umeng.com/social";
NSString *const UMShareQQAppID           = @"1105290965";
NSString *const UMShareQQAppKey          = @"9zUNnRN9pxbVuLdI";
NSString *const UMShareWechatAppID       = @"wxc8093a5962df871d";
NSString *const UMShareWechatAppSecret   = @"b86ef61085c8e1222652b8c062662409";
NSString *const UMSShareImage            = @"/selene_web_res/images/softree.png";

#pragma mark - 极光推送
NSString *const JPushAppKey              = @"7d0d40f75f8f153be0e3fe3a";
NSString *const JPushChannel             = @"Publish channel";
NSString *const TuSDKAppKey              = @"1b1ecbffdeae7649-00-hg4oq1";

#pragma mark - Leancloud实时通讯IM
NSString *const LCAppID                  = @"IKuN0j3k5gfSYPRjG2oPG2Kb-gzGzoHsz";
NSString *const LCAppKey                 = @"5umQcl1y3MqdThoAR6Ii3Ys8";

#pragma mark - 腾讯Bugly
NSString *const BuglyAppID               = @"6ce1641b38";

#pragma mark - 应用相关信息
NSString *const AppleID             = @"1138243901";
NSString *const AppleID_Merchant    = @"1138212983";
NSString *const AppName             = @"惠逛街";
NSString *const kPortrait           = @"portrait";
NSString *const kUserInfo           = @"userInfo";
NSString *const kUserId             = @"userId";
NSString *const kNickName           = @"nickName";
NSString *const kFocusType          = @"focusType";
NSString *const FollowTypeUser      = @"FOCUS_USER";
NSString *const FollowTypeMall      = @"FOCUS_MALL";
NSString *const FollowTypeBrand     = @"FOCUS_BRAND";
NSString *const FollowTypeFriend    = @"FRIEND";
NSString *const FollowTypeRecommend = @"RECOMMEND";
NSString *const FollowTypeShare     = @"COLLECT_SHARE";

NSString *const kParamMsgType       = @"msgType";
NSString *const MsgTypeComment      = @"COMMENT";
NSString *const MsgTypeSupport      = @"SUPPORT";
NSString *const MsgTypeNotice       = @"NOTICE";
NSString *const MsgTypeFans         = @"FANS";

NSString *const RequestTimeout     = @"请求超时";
NSString *const TicketOverdue      = @"登录过期，请重新登录";

#pragma mark - 纠错类型和位置
NSString *const CorrectType        = @"CORRECTION";
NSString *const CorrectWhereOther  = @"OTHER";
NSString *const CorrectWhereSound  = @"SOUND";
NSString *const CorrectWhereScreen = @"SCREEN";

#pragma mark - 常量距离
const CGFloat Margin           = 15.0f;
const CGFloat TopMargin        = 10.f;
const CGFloat Cell_Height      = 44.0f;
const CGFloat TextField_H      = 45.0f;
const CGFloat FocusView_Scale  = 190.0f / 375.0f;

#pragma mark - 通知名称

/** 晒单选择优惠 */
NSString *const TransferBenefitsNotification = @"TransferBenefitsNotification";

/** 用户上传了图片(至少一张) */
NSString *const UploadFocusCountNotification = @"UploadFocusCountNotification";

#pragma mark - Blocks implementation
CGFloat CalculateTimeBlock(void (^block)(void)) {
    mach_timebase_info_data_t info;
    if (mach_timebase_info(&info) != KERN_SUCCESS) return - 1.0;
    uint64_t start = mach_absolute_time ();
    block();
    uint64_t end = mach_absolute_time ();
    uint64_t elapsed = end - start;
    
    uint64_t nanos = elapsed * info.numer / info.denom;
    NSLog(@"耗时%f毫秒", (CGFloat)nanos / NSEC_PER_MSEC);
    return (CGFloat)nanos / NSEC_PER_MSEC;
}

void GCDAfterTimeBlock(NSTimeInterval second, void (^block)(void)) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (block) { block(); }
    });
}

void ShowLoadingStatusBlock(NSString *status) {
    [SVProgressHUD showWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
}

void ShowSuccessStatusBlock(NSString *status) {
    [SVProgressHUD showSuccessWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:0.8];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
}

void ShowSuccessStatusCompletion(NSString *status, SVProgressHUDDismissCompletion completion) {
    [SVProgressHUD showSuccessWithStatus:status];
    [SVProgressHUD dismissWithDelay:0.8 completion:completion];
}

void ShowMessageBlock(NSString *status) {
    [SVProgressHUD showWithStatus:status];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

void ShowErrorStatusBlock(NSString *status) {
    [SVProgressHUD showErrorWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:1.8];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
}

void ShowErrorStatusWithCodeBlock(NSString *status, NSInteger code) {
    if (code == 40000) {
        [SVProgressHUD dismiss];
    } else {
        [SVProgressHUD showErrorWithStatus:status];
        [SVProgressHUD setMinimumDismissTimeInterval:0.8];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    }
}

void ShowCustomMessageBlock(NSString *status) {
    [SVProgressHUD setFont:[UIFont systemFontOfSize:13.0f]];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setBackgroundColor:[UIColor orangeColor]];
    [SVProgressHUD showWithStatus:status];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

void ShowProgressBlock(CGFloat progress, NSString *status) {
    [SVProgressHUD showProgress:progress status:status];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
}

void DismissHudBlock(void) {
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
}

void AnimateLikeButton(UIButton *sender) {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [sender.layer addAnimation:animation forKey:@"transform"];
}
