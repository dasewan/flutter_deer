import 'package:flutter/material.dart';

import '../models/borrow_list_entity.dart';

class OrderListPageProvider extends ChangeNotifier {
  /// Tab的下标
  int _index = 0;

  int get index => _index;

  /// 商品数量
  List<int> _goodsCountList = [0, 0, 0, 0, 0, 0, 0, 0];

  List<int> get goodsCountList => _goodsCountList;

  /// 分页
  final List<int> _tabPageCurrentList = [1, 1, 1, 1, 1, 1, 1, 1];
  final List<int> _tabPageCurrentTotal= [-1, -1, -1, -1, -1, -1, -1, -1];

  List<int> get tabPageCurrentList => _tabPageCurrentList;
  List<int> get tabPageCurrentTotal => _tabPageCurrentTotal;

  /// 分页
  final List<bool> _hasMorePagesList = [true, true, true, true, true, true, true, true];

  List<bool> get hasMorePagesList => _hasMorePagesList;

  ///分页数据
  final List<List<BorrowListData>> _tabPageData = [[], [], [], [], [], [], [], []];

  List<List<BorrowListData>> get tabPageData => _tabPageData;

  /// 选中商品分类下标
  int _sortIndex = 0;

  int get sortIndex => _sortIndex;

  void setSortIndex(int sortIndex) {
    _sortIndex = sortIndex;
    notifyListeners();
  }

  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }

  void setGoodsCount(List<int> count) {
    _goodsCountList = count;
    notifyListeners();
  }

  void setTabPageCurrent(int page) {
    _tabPageCurrentList[index] = page;
    notifyListeners();
  }
  void setTabPageTotal(int total) {
    _tabPageCurrentTotal[index] = total;
    notifyListeners();
  }

  void setTabPageData(List<BorrowListData> data) {
    if (data.isEmpty) {
      _tabPageData[index].clear();
    } else {
      _tabPageData[index].addAll(data);
    }
    notifyListeners();
  }

  void setHasMorePages(bool has) {
    _hasMorePagesList[index] = has;
    notifyListeners();
  }
}
