import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/config/index_action_constant.dart';
import 'package:myapp9/generated/json/b_product_entity.g.dart';
import 'package:myapp9/models/b_product_entity.dart';
import 'package:myapp9/models/g_verifies_show_entity.dart';
import 'package:myapp9/models/g_verify_entity.dart';
import 'package:myapp9/models/index_first_entity.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/index/iviews/index_first_i_mvp_view.dart';
import 'package:myapp9/pages/verify/router/verify_router.dart';
import 'package:myapp9/providers/user_provider.dart';
import 'package:myapp9/util/helper.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class IndexFirstPagePresenter extends BasePagePresenter<IndexFirstIMvpView> {
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
    return requestNetwork<IndexFirstEntity>(Method.get, url: HttpApi.indexFirst, queryParameters: params, isShow: isShowDialog, onSuccess: (reponse) {
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

        view.provider.setIndexFirstEntity(reponse);
        int tmpAction = reponse.data!.aUser!.iIndexAction ?? 11;
        view.provider.setActionRoute(ActionRoute.values[tmpAction - 11].value);
        view.getContext().read<UserProvider>().setIndexAction(reponse.data!.aUser!.iIndexAction!);
        view.getContext().read<UserProvider>().setUserEntity(reponse.data!.aUser!);
      }
    }, onError: (_, __) {
      /// 加载失败
    });
  }

  Future createBorrow(int productId, {bool isShowDialog = false}) {
    // final Map<String, String> params = <String, String>{};
    FormData formData = FormData.fromMap({
      "d_product_id": productId,
    });

    return requestNetwork<IndexFirstEntity>(Method.post,
        url: HttpApi.dBorrowsStore,
        // queryParameters: params,
        params: formData,
        isShow: isShowDialog, onSuccess: (reponse) {
      if (reponse != null) {
        // view.userProvider.setUserEntity(reponse.data!.aUser!);
        // view.userProvider.setIndexAction(reponse.data!.aUser!.iIndexAction!);
        view
            .getContext()
            .read<UserProvider>()
            .setIndexAction(reponse.data!.aUser!.iIndexAction!);
        // context.read<UserProvider>().setIndexAction(12);
        switch (IndexActionConst.named(reponse.data!.aUser!.iIndexAction!)) {
          case IndexActionConst.verifyList:
            view.goSwipper();
            // if (SpUtil.getBool(Constant.keySwipper, defValue: false)!) {
            //   view.goSwipper();
            // } else {
            //   view.goVerifyList();
            // }
            break;
          case IndexActionConst.reVerifyList:
            view.goSwipper();
            break;
          case IndexActionConst.sign:
            view.goSign();
            break;
          case IndexActionConst.liveness:
            view.goLiveness();
            break;
          default:
            print(2);
        }
      }
    }, onError: (_, __) {
      view.showToast(__);

      /// 加载失败
    });
  }

  Future gVerifiesStore(int productId, {bool isShowDialog = false}) {
    String lastFetchVerifyItemsTime = SpUtil.getString(Constant.lastFetchVerifyItemsTime, defValue: '')!;
    Map<String, dynamic>? params = {"last_fetch_time": lastFetchVerifyItemsTime};
    FormData formData = FormData.fromMap(params);
    return requestNetwork<GVerifiesShowEntity>(Method.post, url: HttpApi.gVerifiesStore, params: formData, isShow: isShowDialog, onSuccess: (data) {
      if (data != null) {
        GVerifyEntity gVerifyEntity = data.data!.gVerify!;
        int indexAction = data.data!.indexAction!;
        Helper.storeGVerifyEntity(
            gVerifyEntity: gVerifyEntity,
            view: view,
            qVerifyItems: data.data?.qVerifyItems,
            indexAction: indexAction);
        switch (IndexActionConst.named(indexAction)) {
          case IndexActionConst.verifyList:
            view.goSwipper();
            // if (SpUtil.getBool(Constant.keySwipper, defValue: false)!) {
            //   view.goSwipper();
            // } else {
            //   view.goVerifyList();
            // }
            break;
          case IndexActionConst.reVerifyList:
            view.goSwipper();
            break;
          case IndexActionConst.sign:
            view.goSign();
            break;
          case IndexActionConst.liveness:
            view.goLiveness();
            break;
          default:
            print(2);
        }
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
