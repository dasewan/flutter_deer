import 'package:flutter/material.dart';
import 'package:myapp9/models/d_borrow_sign_entity.dart';

class LivenessProvider extends ChangeNotifier {
  List<DBorrowSignDataPreComputeItem>? _dBorrowSignDataPreComputeList;

  List<DBorrowSignDataPreComputeItem>? get dBorrowSignDataPreComputeList => _dBorrowSignDataPreComputeList;

  void setDBorrowSignEntity(List<DBorrowSignDataPreComputeItem> dBorrowSignDataPreComputeList) {
    _dBorrowSignDataPreComputeList = dBorrowSignDataPreComputeList;
    notifyListeners();
  }
}
