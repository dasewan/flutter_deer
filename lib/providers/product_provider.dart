import 'package:myapp9/models/b_product_entity.dart';

import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  BProductEntity? _bProductEntity = BProductEntity();

  BProductEntity get bProductEntity => _bProductEntity!;

  void setBProductEntity(BProductEntity bProductEntity) {
    _bProductEntity = bProductEntity;
    notifyListeners();
  }

}
