import 'package:flutter/material.dart';
import 'package:myapp9/generated/center_entity.dart';
import 'package:sp_util/sp_util.dart';

import '../../../config/constant.dart';
import '../../../generated/json/center_entity.g.dart';
import '../../../mvp/base_page_presenter.dart';
import '../../../net/dio_utils.dart';
import '../../../net/http_api.dart';
import '../../../util/helper.dart';
import '../iview/shop_iview.dart';

class ShopPagePresenter extends BasePagePresenter<ShopIMvpView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int currentTimeInSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      int lastHomeFetchAt = SpUtil.getInt(Constant.lastHomeFetchAt, defValue: currentTimeInSeconds)!;
      if (currentTimeInSeconds == lastHomeFetchAt || currentTimeInSeconds - lastHomeFetchAt > 30) {
        index(false);
      }

      /// 接口请求例子
      /// get请求参数queryParameters  post请求参数params
/*      asyncRequestNetwork<UserEntity>(Method.get,
        url: HttpApi.users,
        onSuccess: (data) {
          view.setUser(data);
        },
      );*/
    });
  }

  Future index(bool isShowDialog) {
    bool isLogin = Helper.isLoggedIn();
    String url = '';
    if (isLogin == true) {
      url = HttpApi.center;
    } else {
      url = HttpApi.homeNotLogin;
    }
    String? lastFetchCenterTime = SpUtil.getString(Constant.lastFetchCenterTime);
    Map<String, dynamic>? params = {"last_refresh_time": lastFetchCenterTime};
    return requestNetwork<CenterEntity>(Method.get, url: url, queryParameters: params, isShow: isShowDialog, onSuccess: (reponse) {
      if (reponse != null) {
        if (lastFetchCenterTime == null || lastFetchCenterTime != reponse.data!.lastRefreshTime!) {
          SpUtil.putString(Constant.lastFetchCenterTime, reponse.data!.lastRefreshTime!);
          SpUtil.putObject(Constant.lastFetchCenterData, reponse.data!);
        } else {
          //从缓存中补充产品列表数据
          Map? data = SpUtil.getObject(Constant.lastFetchCenterData);
          if (data != null) {
            reponse.data = $CenterDataFromJson(data);
          }
        }
        view.provider.setCenterData(reponse.data!);
        int currentTimeInSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        SpUtil.putInt(Constant.lastHomeFetchAt, currentTimeInSeconds);
      }
    }, onError: (_, __) {
      /// 加载失败
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void testListData() {
    /// 测试返回List类型数据解析
/*    asyncRequestNetwork<List<CityEntity>>(Method.get,
      url: HttpApi.subscriptions,
      onSuccess: (data) {

      },
    );*/
  }
}
