import 'package:flutter/material.dart';

import '../models/borrow_detail_entity.dart';

class RepayProvider extends ChangeNotifier {
  BorrowDetailDataBorrow? _borrow;
  List<BorrowDetailDataPeriods>? _periods;
  BorrowDetailDataProduct? _product;
  BorrowDetailDataLoan? _loan;
  List<String>? _tips;

  BorrowDetailDataBorrow? get borrow => _borrow;

  void setBorrow(BorrowDetailDataBorrow borrow) {
    _borrow = borrow;
    notifyListeners();
  }

  List<BorrowDetailDataPeriods>? get periods => _periods;

  void setPeriods(List<BorrowDetailDataPeriods> periods) {
    _periods = periods;
    notifyListeners();
  }

  BorrowDetailDataProduct? get product => _product;

  void setProduct(BorrowDetailDataProduct product) {
    _product = product;
    notifyListeners();
  }

  BorrowDetailDataLoan? get loan => _loan;

  void setLoan(BorrowDetailDataLoan loan) {
    _loan = loan;
    notifyListeners();
  }

  List<String>? get tips => _tips;

  void setTips(List<String> tips) {
    _tips = tips;
    notifyListeners();
  }
}
