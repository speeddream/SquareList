//
//  Constant.h
//  Selene
//
//  Created by zhaoqiang on 15/11/16.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - 图片参数字段
/** 门店晒单 */
UIKIT_EXTERN NSString *const kShareFromStore;

/** 发现晒单 */
UIKIT_EXTERN NSString *const kShareFromFind;

/** 礼品秀晒单 */
UIKIT_EXTERN NSString *const kShareFromGift;

#pragma mark - 分页加载参数字段
UIKIT_EXTERN NSString *const kParamPageSize;
UIKIT_EXTERN NSString *const kParamCurrentPage;

#pragma mark - 晒单详情类型参数
UIKIT_EXTERN NSString *const kShareNormal;
UIKIT_EXTERN NSString *const kShareExcellent;
UIKIT_EXTERN NSString *const kShareAgainst;

#pragma mark - 其他参数
UIKIT_EXTERN NSString *const kParamStoreId;
UIKIT_EXTERN NSString *const kParamLocType;
UIKIT_EXTERN NSString *const kParamOrderType;
UIKIT_EXTERN NSString *const kParamCategoryId;
UIKIT_EXTERN NSString *const kParamStyle;
UIKIT_EXTERN NSString *const kParamWhere;
UIKIT_EXTERN NSString *const kParamType;
UIKIT_EXTERN NSString *const kParamAll;
UIKIT_EXTERN NSString *const kParamId;
UIKIT_EXTERN NSString *const kParamTradeId;
UIKIT_EXTERN NSString *const kParamTargetId;

UIKIT_EXTERN NSString *const kParamH5;
UIKIT_EXTERN NSString *const kParamWeb;
UIKIT_EXTERN NSString *const kParamApp;
UIKIT_EXTERN NSString *const kParamMallId;
UIKIT_EXTERN NSString *const kParamBrandId;
UIKIT_EXTERN NSString *const kParamBenefitId;
UIKIT_EXTERN NSString *const kParamShareId;
UIKIT_EXTERN NSString *const kParamRType;
UIKIT_EXTERN NSString *const kParamFloor;
UIKIT_EXTERN NSString *const kParamKeyword;
UIKIT_EXTERN NSString *const kParamMobile;
UIKIT_EXTERN NSString *const kParamPassword;
UIKIT_EXTERN NSString *const kParamRandomcode;
UIKIT_EXTERN NSString *const kParamMall;
UIKIT_EXTERN NSString *const kParamBrand;
UIKIT_EXTERN NSString *const kParamStore;
UIKIT_EXTERN NSString *const kParamGoods;
UIKIT_EXTERN NSString *const kParamShare;
UIKIT_EXTERN NSString *const kParamUser;
UIKIT_EXTERN NSString *const kParamQrcode;
UIKIT_EXTERN NSString *const kParamBenefit;
UIKIT_EXTERN NSString *const kParamSingle;
UIKIT_EXTERN NSString *const kParamPublic;
UIKIT_EXTERN NSString *const kParamAdvert;
UIKIT_EXTERN NSString *const kParamPersonal;
UIKIT_EXTERN NSString *const kParamDownload;
UIKIT_EXTERN NSString *const kParamCorrection;
UIKIT_EXTERN NSString *const kParamMessage;
UIKIT_EXTERN NSString *const kParamPrivateMsg;
UIKIT_EXTERN NSString *const kParamHomeArticle;

UIKIT_EXTERN NSString *const kParamUserFocus;
UIKIT_EXTERN NSString *const kParamFocusUser;
UIKIT_EXTERN NSString *const kParamSex;
UIKIT_EXTERN NSString *const kParamGift;
UIKIT_EXTERN NSString *const kParamBrithday;
UIKIT_EXTERN NSString *const kParamSignature;
UIKIT_EXTERN NSString *const kParamBlackList;

UIKIT_EXTERN NSString *const kParamSquareHot;
UIKIT_EXTERN NSString *const kParamSquareFocus;
UIKIT_EXTERN NSString *const kParamSquareNew;
UIKIT_EXTERN NSString *const kParamSquareStar;

#pragma mark -跳转控制器关键字
UIKIT_EXTERN NSString *const kDestinationFixSelfData;
UIKIT_EXTERN NSString *const kDestinationFirstShare;
UIKIT_EXTERN NSString *const kDestinationBindMobile;
UIKIT_EXTERN NSString *const kDestinationBindWeXin;
UIKIT_EXTERN NSString *const kDestinationBindWeiBo;
UIKIT_EXTERN NSString *const kDestinationHGJShare;

#pragma mark - 其他关键字段
UIKIT_EXTERN NSString *const kResultEntity;
UIKIT_EXTERN NSString *const kResultSuccess;
UIKIT_EXTERN NSString *const kSMSTypeRegister;
UIKIT_EXTERN NSString *const kSMSTypeResetPwd;
UIKIT_EXTERN NSString *const kSMSTypeFindPwd;
UIKIT_EXTERN NSString *const kSMSTypeSetPwd;
UIKIT_EXTERN NSString *const kSMSTypeLogin;
UIKIT_EXTERN NSString *const kSMSTypeRePhone;
UIKIT_EXTERN NSString *const kLoginUserType;
UIKIT_EXTERN NSString *const kNickName;
UIKIT_EXTERN NSString *const kFocusType;

#pragma mark - 纠错类型和位置
UIKIT_EXTERN NSString *const CorrectType;
UIKIT_EXTERN NSString *const CorrectWhereOther;
UIKIT_EXTERN NSString *const CorrectWhereSound;
UIKIT_EXTERN NSString *const CorrectWhereScreen;

/** 地图定位：经度longitude */
UIKIT_EXTERN NSString *const kLocationLongitude;

/** 地图定位：维度latitude */
UIKIT_EXTERN NSString *const kLocationLatitude;

/**  是否是新用户 */
UIKIT_EXTERN NSString *const kIsNewUser;

#pragma mark - 友盟分享、百度地图。。。
/** 友盟App Key */
UIKIT_EXTERN NSString *const UMAppKey;

/** 百度地图App Key */
UIKIT_EXTERN NSString *const GaoDeMapAppKey;

/** 新浪App Key */
UIKIT_EXTERN NSString *const UMShareSinaAppKey;

/** 新浪App Secret */
UIKIT_EXTERN NSString *const UMShareSinaAppSecret;

/** 新浪回调地址 */
UIKIT_EXTERN NSString *const UMShareSinaCallBackUrl;

/** 友盟分享通用回调地址 */
UIKIT_EXTERN NSString *const UMShareCommonCallBackUrl;

/** QQ App ID */
UIKIT_EXTERN NSString *const UMShareQQAppID;

/** QQ App Key */
UIKIT_EXTERN NSString *const UMShareQQAppKey;

/** 微信App ID */
UIKIT_EXTERN NSString *const UMShareWechatAppID;

/** 微信App Key */
UIKIT_EXTERN NSString *const UMShareWechatAppSecret;

/** 极光推送AppKey */
UIKIT_EXTERN NSString *const JPushAppKey;

/** 极光推送Channel */
UIKIT_EXTERN NSString *const JPushChannel;

/** TuSDK AppKey */
UIKIT_EXTERN NSString *const TuSDKAppKey;

/** Leancloud实时通讯IMAppID */
UIKIT_EXTERN NSString *const LCAppID;

/** Leancloud实时通讯IMAppKey */
UIKIT_EXTERN NSString *const LCAppKey;

/** 腾讯Bugly AppID */
UIKIT_EXTERN NSString *const BuglyAppID;

/** iTunes Connect发布应用时分配的应用标识符 */
UIKIT_EXTERN NSString *const AppleID;

/** 商户版应用标识符 */
UIKIT_EXTERN NSString *const AppleID_Merchant;

/** 应用名称 */
UIKIT_EXTERN NSString *const AppName;

/** 用户头像 */
UIKIT_EXTERN NSString *const kPortrait;

/** 用户信息 */
UIKIT_EXTERN NSString *const kUserInfo;

/** 用户id */
UIKIT_EXTERN NSString *const kUserId;

/** 用户关注 */
UIKIT_EXTERN NSString *const FollowTypeUser;

/** 商场订阅 */
UIKIT_EXTERN NSString *const FollowTypeMall;

/** 品牌关注（关注类型） */
UIKIT_EXTERN NSString *const FollowTypeBrand;

/** 朋友关注（关注类型） */
UIKIT_EXTERN NSString *const FollowTypeFriend;

/** 推荐关注（关注类型） */
UIKIT_EXTERN NSString *const FollowTypeRecommend;

/** 晒单详情（关注类型） */
UIKIT_EXTERN NSString *const FollowTypeShare;

/** 消息类型：参数 */
UIKIT_EXTERN NSString *const kParamMsgType;

/** 消息类型：评论 */
UIKIT_EXTERN NSString *const MsgTypeComment;

/** 消息类型：点赞 */
UIKIT_EXTERN NSString *const MsgTypeSupport;

/** 消息类型：消息 */
UIKIT_EXTERN NSString *const MsgTypeNotice;

/** 消息类型：粉丝 */
UIKIT_EXTERN NSString *const MsgTypeFans;


/** 请求超时提示 */
UIKIT_EXTERN NSString *const RequestTimeout;

/** 登录过期提示 */
UIKIT_EXTERN NSString *const TicketOverdue;




#pragma mark - 距离常量
/**  左右间距 */
UIKIT_EXTERN const CGFloat Margin;
/**  上间距 */
UIKIT_EXTERN const CGFloat TopMargin;
/**  cell默认高度、按钮高度 */
UIKIT_EXTERN const CGFloat Cell_Height;
/**  textField默认高度 */
UIKIT_EXTERN const CGFloat TextField_H;
/**轮播图比例*/
UIKIT_EXTERN const CGFloat FocusView_Scale;

#pragma mark - 通知名称
/** 晒单选择优惠 */
UIKIT_EXTERN NSString *const TransferBenefitsNotification;

/** 用户上传了图片(至少一张) */
UIKIT_EXTERN NSString *const UploadFocusCountNotification;

#pragma mark - 全局Block
/** 计算执行时间返回秒 */
UIKIT_EXTERN CGFloat CalculateTimeBlock(void (^block)(void));

/** 计算执行时间返回秒 */
UIKIT_EXTERN void GCDAfterTimeBlock(NSTimeInterval second, void (^block)(void));

/** 展示加载中的回调 */
UIKIT_EXTERN void ShowLoadingStatusBlock(NSString *status);

/** 展示成功的回调 */
UIKIT_EXTERN void ShowSuccessStatusBlock(NSString *status);

/** 展示成功的回调，SVProgressHUD消失之后的回调 */
//UIKIT_EXTERN void ShowSuccessStatusCompletion(NSString *status, SVProgressHUDDismissCompletion completion);

/** 展示失败的回调 */
UIKIT_EXTERN void ShowErrorStatusBlock(NSString *status);

/** 通过code展示失败的回调 */
UIKIT_EXTERN void ShowErrorStatusWithCodeBlock(NSString *status, NSInteger code);

/** 展示提示消息的回调 */
UIKIT_EXTERN void ShowMessageBlock(NSString *status);

UIKIT_EXTERN void ShowCustomMessageBlock(NSString *status);

/** 展示带进度条的回调 */
UIKIT_EXTERN void ShowProgressBlock(CGFloat progress, NSString *status);

/** 展示成功的回调 */
UIKIT_EXTERN void DismissHudBlock(void);

/** 为点赞按钮添加动画效果 */
UIKIT_EXTERN void AnimateLikeButton(UIButton *sender);

#pragma mark - 枚举
/** 服务端响应码 */
typedef NS_ENUM(NSUInteger, ResponseCode) {
    ResponseCodeSuccess            = 200,   // 业务成功
    ResponseCodeUserNotLogin       = 3000,  // 用户未登录
    ResponseCodeLoginPwdError      = 3002,  // 登录密码错误
    ResponseCodeTicketOverdue      = 3003,  // 登录过期
    ResponseCodeUserNotExist       = 3020,  // 用户不存在
    ResponseCodeRandomCodeError    = 3201,  // 图形验证码错误
    ResponseCodeRandomCodeOverdue  = 3202,  // 图形验证码过期
    ResponseCodeRandomCodeNotEmpty = 3206,  // 图形验证码不能为空
    ResponseCodeNotSetPassword     = 3208,  // 未设置登录密码
    ResponseCodeCityIsDeveloping   = 40000, // 城市正在开拓中
};

/** 类型(商场、门店、品牌、优惠) */
typedef NS_ENUM(NSUInteger, SeleneType) {
    SeleneTypeMall,
    SeleneTypeStore,
    SeleneTypeBrand,
    SeleneTypeBenefit
};

/** 浏览历史类型(商场、门店、品牌) */
typedef NS_ENUM(NSUInteger, HistoryType) {
    HistoryTypeMall,
    HistoryTypeStore,
    HistoryTypeBrand
};

/** 晒单类型(全民、门店) */
typedef NS_ENUM(NSUInteger, OrderType) {
    OrderTypePeople,
    OrderTypeStore
};

/** 优惠类型(商场、品牌) */
typedef NS_ENUM(NSUInteger, BenefitType) {
    BenefitTypeMall,
    BenefitTypeSBrand
};

/** 滚动方向判断(TableView、Scrollview、CollectionView向上、向下) */
typedef NS_ENUM(NSUInteger, ScrollDirection) {
    ScrollDirectionUp,
    ScrollDirectionDown
};

/** 友盟分享类型 */
typedef NS_ENUM(NSUInteger, CustomShareType) {
    CustomShareTypeWeb,   // 网页
    CustomShareTypeImage
};

#pragma mark - Block重命名
/** 点击tag位置的UIView */
typedef void(^TouchViewAtTag)(id view, NSInteger tag);

