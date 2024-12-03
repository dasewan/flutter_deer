import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/models/d_borrow_sign_entity.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/index/iviews/index_review_i_mvp_view.dart';
import 'package:myapp9/providers/index_no_provider.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import '../../../generated/json/d_borrow_sign_entity.g.dart';
import '../../../models/index_no_entity.dart';

class IndexReviewPagePresenter extends BasePagePresenter<IndexReviewIMvpView> {
  late Timer _timer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<Map>? dataList = SpUtil.getObjectList(Constant.preComputeInfo);

      _timer = Timer.periodic(Duration(seconds: 30), (Timer t) => getIndexNo(true));

      if (dataList == null) {
        index(true);
      } else {
        List<DBorrowSignDataPreComputeItem> data = List<DBorrowSignDataPreComputeItem>.from(dataList.map((value) {
          return $DBorrowSignDataPreComputeItemFromJson(value);
        }));
        view.provider.setDBorrowSignEntity(data);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Future index(bool isShowDialog) {
    Map<String, dynamic>? params = {};
    return requestNetwork<DBorrowSignEntity>(Method.get, url: HttpApi.bProducts, queryParameters: params, isShow: isShowDialog, onSuccess: (data) {
      if (data != null) {
        if (data.data!.preComputeList != null) {
          view.provider.setDBorrowSignEntity(data.data!.preComputeList!);
          SpUtil.putObjectList(Constant.preComputeInfo, data.data!.preComputeList!);
        }
      }
    }, onError: (_, __) {
      /// 加载失败
      print(123);
    });
  }

  Future getIndexNo(bool isShowDialog) {
    final Map<String, String> params = <String, String>{};

    return requestNetwork<IndexNoEntity>(Method.get, url: HttpApi.indexNo, queryParameters: params, isShow: isShowDialog, onSuccess: (response) {
      if (response != null) {
        view.getContext().read<IndexNoProvider>().setIndexNo(response.data!.hIndexNo!);
      }
    }, onError: (_, __) {
      view.showToast(__);
    });
  }
}
