import 'package:flutter/material.dart';
import 'package:myapp9/config/constant.dart';
// import 'package:myapp9/generated/json/q_verify_item_entity_helper.dart';
import 'package:myapp9/generated/json/q_verify_item_entity.g.dart';
import 'package:myapp9/models/g_verifies_show_entity.dart';
import 'package:myapp9/models/g_verify_entity.dart';
import 'package:myapp9/models/q_verify_item_entity.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/verify/iviews/verify_list_i_mvp_view.dart';
import 'package:myapp9/pages/verify/router/verify_router.dart';
import 'package:sp_util/sp_util.dart';

import '../../../util/helper.dart';

class VerifyListPagePresenter extends BasePagePresenter<VerifyListIMvpView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
/*      if (Device.isWeb) {
        html.window.onBeforeUnload.listen((event) async{
          String? lastFetchVerifyItemsTime = SpUtil.getString(Constant.lastFetchVerifyItemsTime);
          if(lastFetchVerifyItemsTime != null){
            SpUtil.remove(Constant.lastFetchVerifyItemsTime);
            SpUtil.remove(Constant.verify_list);
          }
        });
        //todo 移除监听事件
        // html.window.removeEventListener(type, (event) => null)

      }*/
      verifyList(true);
      //读取缓存对比时间
      List<Map>? dataList = SpUtil.getObjectList(Constant.verifyList);
      if (dataList != null) {
        // List<QVerifyItemEntity> data = dataList.map((value) {
        //   return qVerifyItemEntityFromJson(QVerifyItemEntity(), value);
        // }).toList();
        List<QVerifyItemEntity> data = List<QVerifyItemEntity>.from(dataList.map((value) {
          return $QVerifyItemEntityFromJson(value);
        }));
        view.setQVerifyItemEntityList(data);
      }
    });
  }

  Future verifyList(bool isShowDialog) {
    String lastFetchVerifyItemsTime = SpUtil.getString(Constant.lastFetchVerifyItemsTime, defValue: '')!;
    Map<String, dynamic>? params = {"last_fetch_time": lastFetchVerifyItemsTime};
    return requestNetwork<GVerifiesShowEntity>(Method.get, url: HttpApi.gVerifies, queryParameters: params, isShow: isShowDialog, onSuccess: (data) {
      if (data != null) {
        GVerifyEntity gVerifyEntity = data.data!.gVerify!;
        Helper.storeGVerifyEntity(
            gVerifyEntity: gVerifyEntity,
            view: view,
            qVerifyItems: data.data?.qVerifyItems,
            lastFetchTime: data.data!.lastFetchTime);
      }
    }, onError: (_, __) {
      /// 加载失败
    });
  }
}

enum VerifyItem { idNumber, contact, loanBank, repayBank, job, h5, liveness }

extension VerifyItemExtension on VerifyItem {
  VerifyItemTmp get detail => [
        VerifyItemTmp('idCard', VerifyRouter.idCard, QVerifyItemEntity()),
        VerifyItemTmp('contact', VerifyRouter.contact, QVerifyItemEntity()),
        VerifyItemTmp('loanBank', VerifyRouter.loanBank, QVerifyItemEntity()),
        VerifyItemTmp('repayBank', VerifyRouter.repayBank, QVerifyItemEntity()),
        VerifyItemTmp('otherInfo', VerifyRouter.job, QVerifyItemEntity()),
        VerifyItemTmp('liveness', VerifyRouter.liveness, QVerifyItemEntity()),
      ][index];

  // QVerifyItemEntity set values2(QVerifyItemEntity qVerifyItemEntity){ return qVerifyItemEntity;};
  void talk(QVerifyItemEntity qVerifyItemEntity) {
    detail.qVerifyItemEntity = qVerifyItemEntity;
  }
}

class VerifyItemTmp {
  VerifyItemTmp(this.name, this.route, this.qVerifyItemEntity);
  String name = '';
  String route = '';
  QVerifyItemEntity qVerifyItemEntity;
  @override
  toString() => "VerifyItemTmp($name, $route)";
}
