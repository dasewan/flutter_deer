import 'package:flutter/material.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/generated/json/b_product_entity.g.dart';
import 'package:myapp9/models/b_product_entity.dart';
import 'package:myapp9/models/index_first_entity.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/index/iviews/index_repay_i_mvp_view.dart';
import 'package:myapp9/pages/verify/router/verify_router.dart';
import 'package:myapp9/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class IndexRepayPagePresenter extends BasePagePresenter<IndexRepayIMvpView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      index(false);
    });
  }

  Future index(bool isShowDialog) {
    String? bProductsNewestUpdatedAt = SpUtil.getString(Constant.bProductsNewestUpdatedAt);
    // final Map<String, String> params = <String, String>{};
    Map<String, dynamic>? params = {"b_products_newest_updated_at": bProductsNewestUpdatedAt};
    return requestNetwork<IndexFirstEntity>(Method.get, url: HttpApi.indexRepay, queryParameters: params, isShow: isShowDialog, onSuccess: (reponse) {
      if (reponse != null) {
        if (bProductsNewestUpdatedAt == null || bProductsNewestUpdatedAt != reponse.data!.bProductsNewestUpdatedAt!) {
          SpUtil.putString(Constant.bProductsNewestUpdatedAt, reponse.data!.bProductsNewestUpdatedAt!);
          SpUtil.putObjectList(Constant.bProductsList, reponse.data!.bProducts!);
          //更新试算缓存
          for (BProductEntity item in reponse.data!.bProducts!) {
            if (item.updatedAt != SpUtil.getString(Constant.lastFetchPreComputeTime + item.id.toString())) {
              SpUtil.remove(Constant.lastFetchPreComputeTime + item.id.toString());
              SpUtil.remove(Constant.preComputeInfo + item.id.toString());
            }
          }
        } else {
          //从缓存中补充产品列表数据
          List<Map>? dataList = SpUtil.getObjectList(Constant.bProductsList);

          if (dataList != null) {
            List<BProductEntity> data = List<BProductEntity>.from(dataList.map((value) {
              return $BProductEntityFromJson(value);
            }));
            reponse.data?.bProducts = data;
          }
        }
        List<BProductEntity> onWayList = [];
        List<BProductEntity> userProductList = [];
        List<int> onWayProductIdList = reponse.data!.aUser!.uOnWayProductId!.split(',').map((stringNumber) => int.parse(stringNumber)).toList();
        List<int> onUserProductIdList = reponse.data!.aUser!.nProducts!.split(',').map((stringNumber) => int.parse(stringNumber)).toList();
        // 对product进行排序
        reponse.data?.bProducts?.removeWhere((element) {
          if (onWayProductIdList.contains(element.id)) {
            onWayList.add(element);
            return true;
          }
          return false;
        });
        reponse.data?.bProducts?.removeWhere((element) {
          if (onUserProductIdList.contains(element.id)) {
            userProductList.add(element);
            return true;
          }
          return false;
        });
        reponse.data!.bProducts = [...onWayList, ...userProductList, ...?reponse.data!.bProducts];
        view.showPopupOverlay(reponse.data!.aUser!.iIndexAction!);
        view.provider.setIndexFirstEntity(reponse);
        view.getContext().read<UserProvider>().setIndexAction(reponse.data!.aUser!.iIndexAction!);
        view.getContext().read<UserProvider>().setUserEntity(reponse.data!.aUser!);
      }
    }, onError: (_, __) {
      /// 加载失败
    });
  }
}

enum ActionRoute { create, verifyList, liveness, sign }

extension ActionExtension on ActionRoute {
  // String get value => ['/create', '/verifyList', '/liveness', '/sign'][index];
  String get value => [
        // BorrowRouter.createBorrow,
        // VerifyRouter.verifyList,
        // BorrowRouter.createBorrow,
        // BorrowRouter.createBorrow,
        VerifyRouter.swipper,
        VerifyRouter.swipper,
        VerifyRouter.swipper,
        '',
        '',
        '',
      ][index];
}
