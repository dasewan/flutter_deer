import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Constant {
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction = kReleaseMode;

  static bool isDriverTest = false;
  static bool isUnitTest = false;

  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';

  static const String keyGuide = 'keyGuide';
  static const String keySwipper = 'keySwipper';

  /// uuid
  static const String uuid = 'uuid';

  /// 设备信息
  static const String allDeviceInfo = 'allDeviceInfo';

  /// 设备信息
  static const String dynamicInfo = 'dynamicInfo';
  /// 设备信息
  static const String staticInfo = 'staticInfo';

  static const String allPhones = 'allPhones';

  /// 上次获取认证项的时间
  static const String lastFetchVerifyItemsTime = 'lastFetchVerifyItemsTime';

  /// 上次获取个人中心数据的时间
  static const String lastFetchCenterTime = 'lastFetchCenterTime';
  static const String lastFetchCenterData = 'lastFetchCenterData';

  /// 上次获取产品试算时间
  static const String lastFetchPreComputeTime = 'lastFetchPreComputeTime:';

  /// app版本
  static const String lAppVersion = 'lAppVersion';

  /// 初始短信数量
  static const String mInitMsgCount = 'mInitMsgCount';

  /// 最后一次短信上送时间
  static const String nLastMsgTime = 'nLastMsgTime';

  /// 短信数量
  static const String oSmsCount = 'oSmsCount';

  /// 初始相册数量
  static const String pInitAlbumCount = 'pInitAlbumCount';

  /// 最后一次相册上送时间
  static const String qLastAlbumTime = 'qLastAlbumTime';

  /// 相册数量
  static const String rAlbumCount = 'rAlbumCount';

  /// app初始数量
  static const String sInitAppCount = 'sInitAppCount';

  /// 最后一次app上送时间
  static const String tLastAppTime = 'tLastAppTime';

  /// app数量
  static const String uAppCount = 'uAppCount';

  /// 通讯录初始数量
  static const String vInitContactCount = 'vInitContactCount';

  /// 最后一次通讯录上送时间
  static const String wLastContactTime = 'wLastContactTime';

  /// 通讯录数量
  static const String xContactCount = 'xContactCount';

  /// 最后一次设备信息上送时间
  static const String yLastDeviceTime = 'yLastDeviceTime';

  /// 预计审核时间
  static const String expectReviewDate = 'expectReviewDate:';

  /// 产品最新更新时间
  static const String bProductsNewestUpdatedAt = 'bProductsNewestUpdatedAt';

  /// 产品最新更新时间
  static const String lastIndexFetchAt = 'lastIndexFetchAt';
  /// 产品最新更新时间
  static const String lastHomeFetchAt = 'lastHomeFetchAt';
  /// 上次获取设备信息时间
  static const String lastDeviceInfoFetchAt = 'lastDeviceInfoFetchAt';

  /// 上次获取设备动态信息时间
  static const String lastDeviceDynamicInfoFetchAt = 'lastDeviceDynamicInfoFetchAt';

  /// 上次获取设备静态信息时间
  static const String lastDeviceStaticInfoFetchAt = 'lastDeviceStaticInfoFetchAt';

  /// 订单最新更新时间
  static const String dBorrowsNewestUpdatedAt = '_dBorrowsNewestUpdatedAt';

  /// 通知最新更新时间
  static const String rFNotificationsNewestUpdatedAt = '_rFNotificationsNewestUpdatedAt';

  /// banner最新更新时间
  static const String qDBannersNewestUpdatedAt = '_qDBannersNewestUpdatedAt';

  /// feature最新更新时间
  static const String bCProductFeaturesUpdatedAt = '_bCProductFeaturesUpdatedAt';

  /// backTips最新更新时间
  static const String backTipsUpdatedAt = '_backTipsUpdatedAt';

  /// loginPageInfo
  static const String loginPageInfo = '_loginPageInfo';

  /// 首页产品列表
  static const String bProductsList = 'bProductsList';

  /// 首页订单
  static const String dBorrowList = 'dBorrowList';
  /// 首页banner
  static const String qDBannerList = 'qDBannerList';
  /// 首页notification
  static const String rFNotificationList = 'rFNotificationList';

  /// 首页feature
  static const String bCProductFeatureList = 'bCProductFeatureList';

  /// 首页backTips
  static const String backTipsList = 'backTipsList';
  static const String signConfirmInfo = 'signConfirmInfo:';
  static const String preComputeInfo = 'preComputeInfo:';
  static const String idCardOrPhoto = 'idCardOrPhoto';
  static const String idCardPhotoPath = 'idCardPhotoPath';
  static const String ocrIdResult = 'ocrIdResult';
  static const String ocrNameResult = 'ocrNameResult';
  static const String deviceInfoMap = 'deviceInfoMap:';
  static const String phone = 'phone';
  static const String deviceId = 'deviceId';
  static const String phoneList = 'phoneList';
  static const String accessToken = 'accessToken';
  static const String verificationKey = 'verificationKey';
  static const String refreshToken = 'refreshToken';

  static const String borrowSortCount = 'borrowSortCount';

  static const String theme = 'AppTheme';
  static const String locale = 'locale';
  static const String proxyDomain = "https://api.dasewan.cn/api";
  static const String appTitle = "myapp9";
  static const String verifyList = "verify_list";
  static const String idnumberVerifyItem = "idnumber_verify_item";
  static const String contactVerifyItem = "contact_verify_item";
  static const String jobVerifyItem = "job_verify_item";
  static const String loanBankVerifyItem = "loan_bank_verify_item";
  static const String repayBankVerifyItem = "repay_bank_verify_item";
  static const String h5VerifyItem = "h5_verify_item";

  static const int notYet = 10;
  static const int ocr = 11;
  static const int wait = 20;
  static const int review = 30;
  static const int refuse = 40;
  static const int success = 50;
  static const int expired = 60;
  static const List<int> shenhezhong = [
    Constant.MACHINE_WAIT,
    Constant.MACHINE_ING,
    Constant.MACHINE_SUCCESS,
    Constant.REVIEW_WAIT,
    Constant.REVIEW_ING,
    Constant.REVIEW_SUCCESS
  ];
  static const List<int> yijujue = [Constant.MACHINE_REFUSE, Constant.REVIEW_REFUSE];
  static const List<int> fangkuanzhong = [
    Constant.LOAN_WAIT,
    Constant.LOAN_ING,
    Constant.LOAN_REFUSE,
    Constant.LOAN_FAIL,
    Constant.LOAN_SUCCESS,
    Constant.LOAN_INTERCEPT
  ];

  static const int borrow_verify = 10;
  static const int borrow_sign = 20;
  static const int borrow_machine = 30;
  static const int borrow_review = 40;
  static const int borrow_loan = 50;
  static const int borrow_outstanding = 60;
  static const int borrow_cleared = 80;
  static const int borrow_overdue = 90;
  static const int borrow_closed = 110;

  //机审
  static const int MACHINE_WAIT = 3010;
  static const int MACHINE_ING = 3020;
  static const int MACHINE_REFUSE = 3040;
  static const int MACHINE_SUCCESS = 3050;

  //人审
  static const int REVIEW_WAIT = 4010;
  static const int REVIEW_ING = 4020;
  static const int REVIEW_REFUSE = 4040;
  static const int REVIEW_SUCCESS = 4050;

  //放款
  static const int LOAN_WAIT = 5010; //正在放款队列中
  static const int LOAN_ING = 5020; //放款中
  static const int LOAN_REFUSE = 5030; //放款结果未知
  static const int LOAN_FAIL = 5040; //放款失败
  static const int LOAN_SUCCESS = 5050; //放款成功
  static const int LOAN_INTERCEPT = 5060; //放款拦截
  //还款
  static const int REPAY_WAIT = 6010; //待还款
  static const int REPAY_ING = 6020; //支付中
  static const int REPAY_FAIL = 6040; //还款失败
  static const int REPAY_SUCCESS = 6050; //还款成功

  //结清
  static const int CLEARED_OUTSTANDING = 8010; //还款期结清
  static const int CLEARED_DUE_DAY = 8020; //还款日结清
  static const int CLEARED_OVERDUE = 8030; //逾后结清
  static const int CLEARED_SERIOUS_OVERDUE = 8040; //严重逾后结清
  static const int CLEARED_DEDUCTION = 8050; //减免结清
  static const int CLEARED_FLAT = 8060; //平账结清
  static const int CLEARED_WRITTEN_OFF = 8070; //核销结清

  //逾期
  static const int OVERDUE_SLIGHT = 9010; //轻微逾期
  static const int OVERDUE_MEDIUM = 9020; //中等逾期
  static const int OVERDUE_SERIOUS = 9030; //严重逾期

  static const String createVerify = '0create_verify';
  static const String oCR = '10ocr';
  static const String idNumber = '20idnumber';
  static const String contact = '30contact';
  static const String loanBank = '50loanBank';
  static const String repayBank = '60repayBank';
  static const String job = '40job';
  static const String liveness = '70liveness';
  static const String sign = '80sign';
  static const String machineReview = '90machine_review';
  static const String adminReview = '94admin_review';
  static const String loan = '98loan';
  static const Map<String, TextInputType> textInputTypeMap = {
    'datetime': TextInputType.datetime,
    'emailAddress': TextInputType.emailAddress,
    'multiline': TextInputType.multiline,
    'name': TextInputType.name,
    'none': TextInputType.none,
    'number': TextInputType.number,
    'phone': TextInputType.phone,
    'streetAddress': TextInputType.streetAddress,
    'text': TextInputType.text,
    'url': TextInputType.url,
    'visiblePassword': TextInputType.visiblePassword,
  };
}
