import 'package:flutter/material.dart';

import '../models/index_entity.dart';

class ProductNewProvider extends ChangeNotifier {
  IndexDataBProducts? _bProductEntity = IndexDataBProducts();

  IndexDataBProducts get bProductEntity => _bProductEntity!;

  void setBProductEntity(IndexDataBProducts bProductEntity) {
    _bProductEntity = bProductEntity;
    notifyListeners();
  }
}
