import 'package:flutter/material.dart';

import '../models/index_entity.dart';

class OrderModel {
  String? _bProductsNewestUpdatedAt;
  List<IndexDataBProducts>? _bProducts;
  String? _dBorrowsNewestUpdatedAt;
  List<IndexDataDBorrows>? _dBorrows;

  OrderModel(this._bProductsNewestUpdatedAt, this._bProducts, this._dBorrowsNewestUpdatedAt, this._dBorrows);

  String get maxUpdatedAt {
    String maxUpdatedAt = '';
    if (_dBorrowsNewestUpdatedAt != null && _dBorrowsNewestUpdatedAt!.compareTo(_bProductsNewestUpdatedAt!) > 0) {
      maxUpdatedAt = _dBorrowsNewestUpdatedAt!;
    } else {
      maxUpdatedAt = _bProductsNewestUpdatedAt!;
    }
    return maxUpdatedAt;
  }
}

class ItemModel {
  IndexDataBProducts? _bProduct;

  IndexDataBProducts get bProduct => _bProduct!;

  set bProduct(IndexDataBProducts value) {
    _bProduct = value;
  }

  IndexDataDBorrows? _dBorrow;

  ItemModel(
    this._bProduct,
    this._dBorrow,
  );

  IndexDataDBorrows? get dBorrow => _dBorrow;

  set dBorrow(IndexDataDBorrows? value) {
    _dBorrow = value;
  }
}

class IndexNewProvider extends ChangeNotifier {
  IndexDataAUser? _aUser;
  String _maxUpdatedAt = '';
  List<ItemModel> _itemModels = [];
  List<IndexDataDBorrows> _dBorrows = [];
  String _rFNotificationsNewestUpdatedAt = '';
  List<IndexDataRFNotifications> _rFNotifications = [];
  String _qDBannersNewestUpdatedAt = '';
  List<IndexDataQDBanners> _qDBanners = [];
  String _bCProductFeaturesUpdatedAt = '';
  List<IndexDataBCProductFeatures> _bCProductFeatures = [];
  String _backTipsUpdatedAt = '';
  List<IndexDataBackTips> _backTips = [];
  IndexDataRemind? _remind;
  int _indexAction = 11;

  IndexDataAUser get aUser => _aUser!;

  set aUser(IndexDataAUser value) {
    _aUser = value;
    notifyListeners();
  }

  String get maxUpdatedAt => _maxUpdatedAt;

  set maxUpdatedAt(String value) {
    _maxUpdatedAt = value;
  }

  List<ItemModel> get itemModels => _itemModels;

  set itemModels(List<ItemModel> value) {
    _itemModels = value;
  }

  List<IndexDataDBorrows> get dBorrows => _dBorrows;

  set dBorrows(List<IndexDataDBorrows> value) {
    _dBorrows = value;
    notifyListeners();
  }

  IndexDataRemind get remind => _remind!;

  set remind(IndexDataRemind value) {
    _remind = value;
    notifyListeners();
  }

  List<IndexDataQDBanners> get qDBanners => _qDBanners;

  set qDBanners(List<IndexDataQDBanners> value) {
    _qDBanners = value;
    notifyListeners();
  }

  String get qDBannersNewestUpdatedAt => _qDBannersNewestUpdatedAt;

  set qDBannersNewestUpdatedAt(String value) {
    _qDBannersNewestUpdatedAt = value;
    notifyListeners();
  }

  List<IndexDataRFNotifications> get rFNotifications => _rFNotifications;

  set rFNotifications(List<IndexDataRFNotifications> value) {
    _rFNotifications = value;
    notifyListeners();
  }

  String get rFNotificationsNewestUpdatedAt => _rFNotificationsNewestUpdatedAt;

  set rFNotificationsNewestUpdatedAt(String value) {
    _rFNotificationsNewestUpdatedAt = value;
    notifyListeners();
  }

  List<IndexDataBCProductFeatures> get bCProductFeatures => _bCProductFeatures;

  set bCProductFeatures(List<IndexDataBCProductFeatures> value) {
    _bCProductFeatures = value;
  }

  String get backTipsUpdatedAt => _backTipsUpdatedAt;

  set backTipsUpdatedAt(String value) {
    _backTipsUpdatedAt = value;
    notifyListeners();
  }

  List<IndexDataBackTips> get backTips => _backTips;

  set backTips(List<IndexDataBackTips> value) {
    _backTips = value;
    notifyListeners();
  }

  String get bCProductFeaturesUpdatedAt => _bCProductFeaturesUpdatedAt;

  set bCProductFeaturesUpdatedAt(String value) {
    _bCProductFeaturesUpdatedAt = value;
    notifyListeners();
  }

  int get indexAction => _indexAction;

  set indexAction(int value) {
    _indexAction = value;
    notifyListeners();
  }
}
