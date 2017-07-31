//
//  ServiceAPI.h
//  Selene
//
//  Created by 海润 on 2017/6/13.
//  Copyright © 2017年 hairun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - hostAPI
/** 测试环境API */
UIKIT_EXTERN NSString *const DevelopBaseAPI;

/** 生成环境API */
UIKIT_EXTERN NSString *const ReleaseBaseAPI;

#pragma mark - html API
/**《隐私条款》用户注册登录协议 */
UIKIT_EXTERN NSString *const Web_ProtocolAPI;

#pragma mark - serviceAPI
/** 图形验证码 */
UIKIT_EXTERN NSString *const RandomCodeAPI;

/** 发送短信 */
UIKIT_EXTERN NSString *const SendSMSCodeAPI;

/** 手机号 + 动态验证码的方式登录 */
UIKIT_EXTERN NSString *const LoginPhoneAPI;

/** 手机号 + 密码登录 */
UIKIT_EXTERN NSString *const LoginPasswordAPI;

/** 第三方登录 */
UIKIT_EXTERN NSString *const LoginThirdAPI;

/** 密码登录校验 */
UIKIT_EXTERN NSString *const LoginPwdVerifyAPI;

/** 设置密码 */
UIKIT_EXTERN NSString *const LoginSetPwdAPI;

/** 绑定手机号 */
UIKIT_EXTERN NSString *const LoginBindPhoneAPI;

/** 注册第一步 */
UIKIT_EXTERN NSString *const RegisterStepOneAPI;

/** 注册第二步 */
UIKIT_EXTERN NSString *const RegisterStepTwoAPI;

/** 注册第三步 */
UIKIT_EXTERN NSString *const RegisterStepThreeAPI;

/** 找回密码第一步 */
UIKIT_EXTERN NSString *const FindPwdStepOneAPI;

/** 找回密码第二步 */
UIKIT_EXTERN NSString *const FindPwdStepTwoAPI;

/** 修改密码 */
UIKIT_EXTERN NSString *const ModifyPwdAPI;

/** 修改手机号 */
UIKIT_EXTERN NSString *const ModifyPhoneAPI;

/** 注册品牌列表 */
UIKIT_EXTERN NSString *const RegBrandListAPI;

/** 注册关注品牌 */
UIKIT_EXTERN NSString *const RegBrandFollowAPI;

/** 注册关注风格 */
UIKIT_EXTERN NSString *const RegStyleFollowAPI;

/** 绑定手机号 */
UIKIT_EXTERN NSString *const BindMobileAPI;

/** 绑定微信/微博 */
UIKIT_EXTERN NSString *const BindWXWBAPI;

/** 解绑微信/微博 */
UIKIT_EXTERN NSString *const UnbindWXWBAPI;

/** 获取绑定信息 */
UIKIT_EXTERN NSString *const BindMsg;

/** 修改昵称 */
UIKIT_EXTERN NSString *const ModifyNicknameAPI;

/** 首页接口 */
UIKIT_EXTERN NSString *const HomeAPI;

/** 每周精选接口 */
UIKIT_EXTERN NSString *const SubListAPI;

/** 每周精选详情接口 */
UIKIT_EXTERN NSString *const SubListDetailAPI;

/** 离我最近的商场（刷新商场）*/
UIKIT_EXTERN NSString *const HomeRefreshNearMallAPI;

/** 首页定位城市 */
UIKIT_EXTERN NSString *const HomeLocationCityAPI;

/** 附近的优惠列表(首页入口) */
UIKIT_EXTERN NSString *const NearBenefitListAPI;

/** 用户信息 */
UIKIT_EXTERN NSString *const UserInfoAPI;

/** 更新用户信息接口 */
UIKIT_EXTERN NSString *const UserInfoUpdateAPI;

/** 浏览历史列表(我的入口) */
UIKIT_EXTERN NSString *const BrowsingHistoryAPI;

/** 清除历史列表(我的入口) */
UIKIT_EXTERN NSString *const CleanHistoryAPI;

/** 设置备注接口 */
UIKIT_EXTERN NSString *const RemarkNameSetAPI;

/** 品牌列表 */
UIKIT_EXTERN NSString *const BrandListAPI;

/** 品牌关注列表 */
UIKIT_EXTERN NSString *const BrandFollowAPI;

/** 品牌（添加、取消）关注 / 晒单（添加、取消）收藏 */
UIKIT_EXTERN NSString *const FollowAPI;

/** 商场列表 */
UIKIT_EXTERN NSString *const MallListAPI;

/** 商场详情 */
UIKIT_EXTERN NSString *const MallDetailAPI;

/** 商场详情页—根据品类id获取门店和楼层信息 */
UIKIT_EXTERN NSString *const MallDetailSFAPI;

/** 门店列表接口 */
UIKIT_EXTERN NSString *const MallStoreListAPI;

/** 门店详情 */
UIKIT_EXTERN NSString *const StoreDetailAPI;

/** 单品列表 */
UIKIT_EXTERN NSString *const SingleGoodListAPI;

/** 街区晒单列表接口 */
UIKIT_EXTERN NSString *const ShareListAPI;

/** 收藏列表接口 */
UIKIT_EXTERN NSString *const CollectListAPI;

/** 街区晒单最热列表接口 */
UIKIT_EXTERN NSString *const HotShareListAPI;

/** 街区关注列表接口 */
UIKIT_EXTERN NSString *const FindFocusListAPI;

/** 街区最热列表接口 */
UIKIT_EXTERN NSString *const FindExcellentListAPI;

/** 街区列表接口 */
UIKIT_EXTERN NSString *const FindShareListAPI;

/** 晒单详情接口 */
UIKIT_EXTERN NSString *const ShareDetailAPI;

/** 热门搜索接口 */
UIKIT_EXTERN NSString *const HotSearchListAPI;

/** 热门折扣接口 */
UIKIT_EXTERN NSString *const HotBenefitListAPI;

/** 热门品牌接口 */
UIKIT_EXTERN NSString *const HotBrandListAPI;

/** 品牌详情接口 */
UIKIT_EXTERN NSString *const BrandDetailAPI;

/** 常去商场接口 */
UIKIT_EXTERN NSString *const OfenMallAPI;

/** 订阅商场列表接口 */
UIKIT_EXTERN NSString *const SubscribeMallAPI;

/** 综合搜索接口 */
UIKIT_EXTERN NSString *const SearchAPI;

/** 优惠详情接口 */
UIKIT_EXTERN NSString *const BenefitDetailAPI;

/** 街区推荐接口 */
UIKIT_EXTERN NSString *const UserRecommendListAPI;

/** 全民晒单接口 */
UIKIT_EXTERN NSString *const UserFindListAPI;

/** 用户个人晒单列表接口 */
UIKIT_EXTERN NSString *const PersonalShareListAPI;

/** 门店晒单列表接口 */
UIKIT_EXTERN NSString *const UserShareListAPI;

/** 门店晒单详情接口 */
UIKIT_EXTERN NSString *const StoreShareDetailAPI;

/** 门店列表接口 */
UIKIT_EXTERN NSString *const StoreListAPI;

/** 晒单详情分享URL */
UIKIT_EXTERN NSString *const BlockDetailShareURL;

/** 晒单详情分享URL */
UIKIT_EXTERN NSString *const PersonalShareURL;

/** 附近门店列表接口 */
UIKIT_EXTERN NSString *const NearStoreListAPI;

/** 街区晒单选择门店列表接口 */
UIKIT_EXTERN NSString *const ChooseStoreListAPI;

/** 公共参数接口 */
UIKIT_EXTERN NSString *const PublicParamAPI;

/** 公共参数楼层接口(根据商场id和优惠id区分) */
UIKIT_EXTERN NSString *const PublicFloorParamAPI;

/** 上传图片 */
UIKIT_EXTERN NSString *const UploadImgAPI;

/** 上传图片上的标签位置 */
UIKIT_EXTERN NSString *const UploadPositionAPI;

/** 品类列表 */
UIKIT_EXTERN NSString *const CategoryListAPI;

/** 注销登录 */
UIKIT_EXTERN NSString *const LogoutAPI;

/** 上传头像 */
UIKIT_EXTERN NSString *const UploadHeadAPI;

/** 上传背景 */
UIKIT_EXTERN NSString *const UploadBgAPI;

/** 品牌标签列表 */
UIKIT_EXTERN NSString *const BrandTagListAPI;

/** 标签保存 */
UIKIT_EXTERN NSString *const BrandTagSaveAPI;

/** 晒单发布 */
UIKIT_EXTERN NSString *const UserSharePublishAPI;

/** 删除晒单 */
UIKIT_EXTERN NSString *const UserShareDeleteAPI;

/** 发现点赞 */
UIKIT_EXTERN NSString *const FindSupportAPI;

/** 我的二维码 */
UIKIT_EXTERN NSString *const UserQRCodeAPI;

/** 举报列表 */
UIKIT_EXTERN NSString *const ReportListAPI;

/** 举报保存 */
UIKIT_EXTERN NSString *const ReportSaveAPI;

/** 商场详情分享地址 */
UIKIT_EXTERN NSString *const UMShareMallDeatilAPI;

/** 门店详情分享地址 */
UIKIT_EXTERN NSString *const UMShareStoreDeatilAPI;

/** 晒单详情分享地址 */
UIKIT_EXTERN NSString *const UMShareOrderDeatilAPI;

/** 晒单详情分享地址(新) */
UIKIT_EXTERN NSString *const UMShareFindDeatilAPI;

/** 晒单分享图片 */
UIKIT_EXTERN NSString *const UMShareBlockDetailAPI;

/** 发送评论接口 */
UIKIT_EXTERN NSString *const CommentSaveAPI;

/** 删除评论接口 */
UIKIT_EXTERN NSString *const CommentDeleteAPI;

/** 举报评论接口 */
UIKIT_EXTERN NSString *const CommentReportAPI;

/** 评论列表地址 */
UIKIT_EXTERN NSString *const CommentListAPI;

/** 评论列表xin地址 */
UIKIT_EXTERN NSString *const CommentNewListAPI;

/** 点赞列表地址 */
UIKIT_EXTERN NSString *const SupportListAPI;

/** 意见反馈地址 */
UIKIT_EXTERN NSString *const FeedbackSaveAPI;

/** 消息中心地址 */
UIKIT_EXTERN NSString *const MessageCenterAPI;

/** 消息已读地址 */
UIKIT_EXTERN NSString *const MessageReadAPI;

/** 消息列表地址 */
UIKIT_EXTERN NSString *const MessageListAPI;

/** 用户中心地址 */
UIKIT_EXTERN NSString *const BeneCenterListAPI;

/** 互动列表(关注他人/粉丝) */
UIKIT_EXTERN NSString *const FansListAPI;

/** 我的用户等级 */
UIKIT_EXTERN NSString *const MemeberLevelAPI;

/** 我的账户消息 */
UIKIT_EXTERN NSString *const UserMessageAPI;

/** 搜索引擎 */
UIKIT_EXTERN NSString *const SearchEngineAPI;

/** 私信列表 */
UIKIT_EXTERN NSString *const PrivateMsgListAPI;

/** 发送私信 */
UIKIT_EXTERN NSString *const SendPrivateMsgAPI;

/** 删除私信 */
UIKIT_EXTERN NSString *const DeletePrivateMsgAPI;

/** 首页广告接口 */
UIKIT_EXTERN NSString *const AdvertisementAPI;

/** 首页焦点图获取分享信息接口 */
UIKIT_EXTERN NSString *const HomeShareInfoAPI;

/** 公共分享接口 */
UIKIT_EXTERN NSString *const ShareCommonAPI;

/** IM发送消息时检查好友关系 */
UIKIT_EXTERN NSString *const FriendshipCheckAPI;


/** 推荐给朋友下载分享地址，分享成功之后回调接口 */
UIKIT_EXTERN NSString *const UMShareSuccessAPI;

/** 推荐给朋友下载分享地址 */
UIKIT_EXTERN NSString *const UMShareDownLoadAPI;

/** (纠错)推荐给朋友下载分享地址 */
UIKIT_EXTERN NSString *const UMZCShareDownLoadAPI;

/** 已纠错(找茬)列表 */
UIKIT_EXTERN NSString *const CorrectListAPI;

/** 纠错(找茬)提交保存接口 */
UIKIT_EXTERN NSString *const CorrectInfoSaveAPI;

/** 纠错(找茬)资源(图片、音频等)上传 */
UIKIT_EXTERN NSString *const CorrectResourceUploadAPI;

/** 纠错(找茬)规则 */
UIKIT_EXTERN NSString *const Web_CorrectRuleAPI;

/** 我的奖金金额接口 */
UIKIT_EXTERN NSString *const MyBonusAPI;

/** 我的奖金（提现记录） */
UIKIT_EXTERN NSString *const CashRecordAPI;

/** 资金流水 */
UIKIT_EXTERN NSString *const BillsRecordAPI;

/** 找茬奖励列表 */
UIKIT_EXTERN NSString *const RewardListAPI;

/** 找茬详情 */
UIKIT_EXTERN NSString *const CorrectionDetailAPI;

/** 奖金提现接口 */
UIKIT_EXTERN NSString *const WithdrawAPI;

/** 支付宝提现手续费 */
UIKIT_EXTERN NSString *const PoundageAPI;

/** 推荐关注接口 */
UIKIT_EXTERN NSString *const RecommendAttentionAPI;

/** 等级规则接口 */
UIKIT_EXTERN NSString *const MemberRuleAPI;

/** 圣诞树活动扫脸，图片上传 */
UIKIT_EXTERN NSString *const ActivityPhotoUploadAPI;

/** 摇一摇活动提领奖品详情页面分享 */
UIKIT_EXTERN NSString *const ActivityShakeShareAPI;

/** 摇一摇活动提领奖品详情页面，转赠好友 */
UIKIT_EXTERN NSString *const ActivityShakeDonationAPI;

/** 等级规则接口 */
UIKIT_EXTERN NSString *const MerchantAppStoreAPI;

/** 通讯录检查 http://doc.web.test.hgjvip.cn/#api-3_0_user-3_4_4______ */
UIKIT_EXTERN NSString *const AddressBookVerifyAPI;

/** 通讯录同步 */
UIKIT_EXTERN NSString *const AddressBookSyncAPI;

/** 通讯录列表 */
UIKIT_EXTERN NSString *const AddressBookListAPI;

/** 通讯录列表全部关注 */
UIKIT_EXTERN NSString *const AddressBookFocusAllAPI;

/** 通讯录短信邀请模板 */
UIKIT_EXTERN NSString *const MessageInviteTemplateAPI;

/** 标签数据源 */
UIKIT_EXTERN NSString *const TagDatasourceAPI;

/** 标签历史记录 */
UIKIT_EXTERN NSString *const TagRecordListAPI;

/** 标签历史记录删除单条记录 */
UIKIT_EXTERN NSString *const TagRecordDeleteAPI;

/** 奔溃日志上传接口 */
UIKIT_EXTERN NSString *const UploadCrashLogAPI;

