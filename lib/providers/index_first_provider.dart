import 'package:flutter/material.dart';
import 'package:myapp9/models/a_user_entity.dart';
import 'package:myapp9/models/b_product_entity.dart';
import 'package:myapp9/models/g_verify_entity.dart';
import 'package:myapp9/models/q_verify_item_entity.dart';

import '../models/index_first_entity.dart';

class IndexFirstProvider extends ChangeNotifier {
  String? _maxTime = '';
  AUserEntity? _aUser;
  List<BProductEntity>? _bProducts;
  GVerifyEntity? _gVerify;
  List<QVerifyItemEntity>? _qVerifyItems;
  IndexFirstEntity? _indexFirstEntity;

  String _actionRoute = '/create';

  String get actionRoute => _actionRoute;
  String get maxTime => _maxTime!;
  AUserEntity? get aUser => _aUser;
  List<BProductEntity>? get bProducts => _bProducts;
  GVerifyEntity? get gVerify => _gVerify;
  List<QVerifyItemEntity>? get qVerifyItems => _qVerifyItems;
  IndexFirstEntity? get indexFirstEntity => _indexFirstEntity;

  void setIndexFirstEntity(IndexFirstEntity indexFirstEntity) {
    if (_maxTime != indexFirstEntity.data!.maxTime) {
      _maxTime = indexFirstEntity.data!.maxTime;
      _aUser = indexFirstEntity.data!.aUser;
      _bProducts = indexFirstEntity.data!.bProducts;
      _gVerify = indexFirstEntity.data!.gVerify;
      _qVerifyItems = indexFirstEntity.data!.qVerifyItems;
      notifyListeners();
    }
  }

  void setActionRoute(String actionRoute) {
    if (_actionRoute != actionRoute) {
      _actionRoute = actionRoute;
      notifyListeners();
    }
  }
}
