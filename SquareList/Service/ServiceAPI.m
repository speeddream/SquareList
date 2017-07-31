//
//  ServiceAPI.m
//  Selene
//
//  Created by 海润 on 2017/6/13.
//  Copyright © 2017年 hairun. All rights reserved.
//

#import "ServiceAPI.h"

#pragma mark - 测试环境
NSString *const DevelopBaseAPI = @"http://web.test.hgjvip.cn";

#pragma mark - 生产环境
NSString *const ReleaseBaseAPI = @"http://web.hgjvip.cn";

NSString *const Web_ProtocolAPI = @"/selene/web/protocol";

NSString *const RandomCodeAPI        = @"/selene/code";
NSString *const SendSMSCodeAPI       = @"/selene/join/sms/send";
NSString *const LoginPhoneAPI        = @"/selene/join/login";
NSString *const LoginPasswordAPI     = @"/selene/join/login/pwd/v1";
NSString *const LoginThirdAPI        = @"/selene/join/login/third";
NSString *const LoginPwdVerifyAPI    = @"/selene/join/verify/user";
NSString *const LoginSetPwdAPI       = @"/selene/join/special/user/setpwd";
NSString *const LoginBindPhoneAPI    = @"/selene/join/bind/mobile/nopwd";
NSString *const RegisterStepOneAPI   = @"/selene/join/reg/step1";
NSString *const RegisterStepTwoAPI   = @"/selene/join/reg/step2";
NSString *const RegisterStepThreeAPI = @"/selene/join/reg/step3";
NSString *const FindPwdStepOneAPI    = @"/selene/join/find/pwd/step1";
NSString *const FindPwdStepTwoAPI    = @"/selene/join/find/pwd/step2";

NSString *const BindMobileAPI        = @"/selene/user/bind/mobile";
NSString *const ModifyPwdAPI         = @"/selene/user/update/pwd";
NSString *const ModifyPhoneAPI       = @"/selene/user/update/mobile";
NSString *const ModifyNicknameAPI    = @"/selene/user/update/nickname";
NSString *const RegBrandListAPI      = @"/selene/brand/guide/list";
NSString *const RegBrandFollowAPI    = @"/selene/user/guide/follow";
NSString *const RegStyleFollowAPI    = @"/selene/home/guide/style/list";
NSString *const BindWXWBAPI          = @"/selene/user/third/binding";
NSString *const UnbindWXWBAPI        = @"/selene/user/third/unbinding";
NSString *const BindMsg              = @"/selene/user/third/info";

NSString *const HomeAPI                = @"/selene/home/index/v2";
NSString *const SubListAPI             = @"/selene/sub/list/v1";
NSString *const SubListDetailAPI       = @"/selene/web/subject/";
NSString *const HomeRefreshNearMallAPI = @"/selene/home/near/mall";
NSString *const HomeLocationCityAPI    = @"/selene/home/city";
NSString *const NearBenefitListAPI     = @"/selene/benefit/near/list";
NSString *const UserInfoAPI            = @"/selene/user/info";
NSString *const UserInfoUpdateAPI      = @"/selene/user/update/info";
NSString *const BrowsingHistoryAPI     = @"/selene/user/browse/history";
NSString *const CleanHistoryAPI        = @"/selene/user/browse/history/clean";
NSString *const RemarkNameSetAPI       = @"/selene/user/remark/name/set";
NSString *const MallListAPI            = @"/selene/mall/list";
NSString *const OfenMallAPI            = @"/selene/user/often/mall";
NSString *const SubscribeMallAPI       = @"/selene/user/subscribe/mall";
NSString *const MallDetailAPI          = @"/selene/mall/detail/";
NSString *const MallDetailSFAPI        = @"/selene/mall/store/floor/list/v1";
NSString *const MallStoreListAPI       = @"/selene/mall/store/list";
NSString *const ShareListAPI           = @"/selene/find/focus/list";
NSString *const CollectListAPI         =@"/selene/user/collect/list";
NSString *const HotShareListAPI        = @"/selene/find/list";
NSString *const FindFocusListAPI       = @"/selene/find/focus/list";
NSString *const FindExcellentListAPI   = @"/selene/find/excellent/list";
NSString *const FindShareListAPI       = @"/selene/find/share/list";
NSString *const ShareDetailAPI         = @"/selene/find/detail/";
NSString *const HotSearchListAPI       = @"/selene/search/hot/most/v2";
NSString *const HotBrandListAPI        = @"/selene/hot/brand";
NSString *const HotBenefitListAPI      = @"/selene/hot/benefit";
NSString *const SearchAPI              = @"/selene/search/list/v2";
NSString *const StoreDetailAPI         = @"/selene/store/detail/";
NSString *const SingleGoodListAPI      = @"/selene/goods/list";
NSString *const BrandListAPI           = @"/selene/brand/list/v1";
NSString *const BrandDetailAPI         = @"/selene/brand/detail/v2/";
NSString *const BrandFollowAPI         = @"/selene/user/brand/follow/list";
NSString *const FollowAPI              = @"/selene/user/follow/v2";
NSString *const BenefitDetailAPI       = @"/selene/benefit/detail/v2/";
NSString *const UserRecommendListAPI   = @"/selene/user/recommend";
NSString *const UserFindListAPI        = @"/selene/user/find/list";
NSString *const PersonalShareListAPI   = @"/selene/user/personal/share/list";
NSString *const UserShareListAPI       = @"/selene/user/share/list";
NSString *const StoreShareDetailAPI    = @"/selene/store/share/";
NSString *const StoreListAPI           = @"/selene/store/list/condition";
NSString *const BlockDetailShareURL    = @"/selene-h5/shaidan_detail.html?id=%@";
NSString *const PersonalShareURL       = @"/selene-h5/homepage.html?id=%@";
NSString *const NearStoreListAPI       = @"/selene/store/list/near";
NSString *const ChooseStoreListAPI     = @"/selene/store/list/v1";
NSString *const LogoutAPI              = @"/selene/user/loginout";
NSString *const PublicParamAPI         = @"/selene/pub/param?v2=1";
NSString *const PublicFloorParamAPI    = @"/selene/pub/floors";
NSString *const BrandTagListAPI        = @"/selene/brand/tag/list/";
NSString *const BrandTagSaveAPI        = @"/selene/brand/tag/api/save";
NSString *const UserSharePublishAPI    = @"/selene/user/share/publish";
NSString *const UserShareDeleteAPI     = @"/selene/user/share/del/";
NSString *const UploadImgAPI           = @"/selene/user/share/image/upload";
NSString *const UploadPositionAPI      = @"/selene/find/record/position/v2";
NSString *const UploadHeadAPI          = @"/selene/user/image/upload/head";
NSString *const UploadBgAPI            =@"/selene/user/image/upload/background";
NSString *const FindSupportAPI         = @"/selene/find/support/v2";
NSString *const UserQRCodeAPI          = @"/selene/web/recommend";
NSString *const ReportListAPI          = @"/selene/report/list";
NSString *const ReportSaveAPI          = @"/selene/report/target/save";
NSString *const CommentSaveAPI         = @"/selene/comment/save";
NSString *const CommentDeleteAPI       = @"/selene/comment/delete";
NSString *const CommentReportAPI       = @"/selene/comment/report";
NSString *const CommentListAPI         = @"/selene/comment/list";
NSString *const CommentNewListAPI      = @"/selene/comment/msg/list";
NSString *const SupportListAPI         = @"/selene/find/support/list";
NSString *const FeedbackSaveAPI        = @"/selene/feedback/save";
NSString *const MessageCenterAPI       = @"/selene/user/message/center";
NSString *const MessageReadAPI         = @"/selene/user/message/read";
NSString *const MessageListAPI         = @"/selene/user/message/list";
NSString *const BeneCenterListAPI      = @"/selene/benefit/center/list";
NSString *const FansListAPI            = @"/selene/user/interactive/list";
NSString *const MemeberLevelAPI        = @"/selene/member/info";
NSString *const UserMessageAPI         = @"/selene/user/msg/v2";
NSString *const SearchEngineAPI        = @"/selene/search/autocomplete";
NSString *const PrivateMsgListAPI      = @"/selene/user/private/msg/list";
NSString *const SendPrivateMsgAPI      = @"/selene/user/private/msg/send";
NSString *const DeletePrivateMsgAPI    = @"/selene/user/private/msg/del";
NSString *const AdvertisementAPI       = @"/selene/pub/advert";
NSString *const HomeShareInfoAPI       = @"/selene/bargain/share/info";
NSString *const ShareCommonAPI         = @"/selene/home/share/common";
NSString *const FriendshipCheckAPI     = @"/selene/user/center/friendship/check";






NSString *const UMShareSuccessAPI      = @"/selene/member/share/score";

NSString *const UMShareMallDeatilAPI   = @"/html/mall/detail/";
NSString *const UMShareStoreDeatilAPI  = @"/html/store/detail/";
NSString *const UMShareOrderDeatilAPI  = @"/html/share/detail/";
NSString *const UMShareFindDeatilAPI   = @"/selene/find/share/img/view/";
NSString *const UMShareBlockDetailAPI  = @"/selene/find/share/pdf/img/upload";
NSString *const UMShareDownLoadAPI     = @"/selene/down/user/downLoad";
NSString *const UMZCShareDownLoadAPI   = @"/selene/down/user/downLoad/zc";

NSString *const CorrectListAPI           = @"/selene/correction/list";
NSString *const CorrectInfoSaveAPI       = @"/selene/correction/save/v1";
NSString *const CorrectResourceUploadAPI = @"/selene/res/upload";
NSString *const Web_CorrectRuleAPI       = @"/selene/web/currention/rule";

NSString *const MyBonusAPI               = @"/selene/ua/reward/amount";
NSString *const CashRecordAPI            = @"/selene/ua/withdraw/history";
NSString *const BillsRecordAPI           = @"/selene/ua/withdraw/bills";
NSString *const RewardListAPI            = @"/selene/correction/reward/list";
NSString *const CorrectionDetailAPI      = @"/selene/correction/detail/v2";
NSString *const WithdrawAPI              = @"/selene/ua/balance/out";
NSString *const PoundageAPI              = @"/selene/ua/show/poundage";
NSString *const RecommendAttentionAPI    = @"/selene/find/recommand/starlist";
NSString *const MemberRuleAPI            = @"/selene/member/rule";
NSString *const ActivityPhotoUploadAPI   = @"/selene/activity/user/photo/upload";
NSString *const ActivityShakeShareAPI    = @"/selene/activity/shake/share/prize/";
NSString *const ActivityShakeDonationAPI = @"/selene/activity/shake/share/prize/donation/";

NSString *const MerchantAppStoreAPI      = @"/selene/down/merchant/downLoad";

NSString *const AddressBookVerifyAPI     = @"/selene/user/address/book/verify";
NSString *const AddressBookSyncAPI       = @"/selene/user/address/book/sync";
NSString *const AddressBookListAPI       = @"/selene/user/address/book/list";
NSString *const AddressBookFocusAllAPI   = @"/selene/user/address/book/focus/all";
NSString *const MessageInviteTemplateAPI = @"/selene/user/address/book/sms/msg";
NSString *const TagDatasourceAPI         = @"/selene/find/share/label/record";
NSString *const TagRecordListAPI         = @"/selene/find/share/label/list";
NSString *const TagRecordDeleteAPI       = @"/selene/find/share/label/del/";
NSString *const UploadCrashLogAPI        = @"/selene/res/log/upload";














