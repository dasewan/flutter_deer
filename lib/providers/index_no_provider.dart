import 'package:flutter/material.dart';

class IndexNoProvider extends ChangeNotifier {
  int? _indexNo = 0;
  int? _indexAction = 11;

  int get indexNo => _indexNo!;

  int get indexAction => _indexAction!;

  void setIndexNo(int indexNo) {
    if (indexNo != _indexNo) {
      _indexNo = indexNo;
      notifyListeners();
    }
  }

  void setIndexAction(int indexAction) {
    if (indexAction != _indexAction) {
      _indexAction = indexAction;
      notifyListeners();
    }
  }
}
