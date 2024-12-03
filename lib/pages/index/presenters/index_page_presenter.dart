import 'package:flutter/material.dart';
import 'package:myapp9/models/index_no_entity.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/index/iviews/index_i_mvp_view.dart';

class IndexPagePresenter extends BasePagePresenter<IndexIMvpView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // getIndexNo(true);
    });
  }

  Future getIndexNo(bool isShowDialog) {
    final Map<String, String> params = <String, String>{};

    return requestNetwork<IndexNoEntity>(Method.get, url: HttpApi.indexNo, queryParameters: params, isShow: isShowDialog, onSuccess: (response) {
      if (response != null) {
        view.provider.setIndexNo(response.data!.hIndexNo!);
      }
    }, onError: (_, __) {
      view.showToast(__);
    });
  }

  void testListData() {
    /// 测试返回List类型数据解析
    asyncRequestNetwork<List<IndexNoEntity>>(
      Method.get,
      url: HttpApi.indexNo,
      onSuccess: (data) {},
    );
  }
}
