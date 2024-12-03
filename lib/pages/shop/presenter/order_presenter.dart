import 'package:flutter/material.dart';

import '../../../generated/d_borrow_index_entity.dart';
import '../../../mvp/base_page_presenter.dart';
import '../../../net/dio_utils.dart';
import '../../../net/http_api.dart';
import '../iview/order_iview.dart';

class OrderPagePresenter extends BasePagePresenter<OrderIMvpView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      index(false, 1);

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

  Future index(bool isShowDialog, int page) {
    Map<String, dynamic>? params = {"last_refresh_time": "", "page": page};
    return requestNetwork<DBorrowIndexEntity>(Method.get, url: HttpApi.dBorrowIndex, queryParameters: params, isShow: isShowDialog, onSuccess: (reponse) {
      if (reponse != null) {
        view.index(reponse.data!);
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
