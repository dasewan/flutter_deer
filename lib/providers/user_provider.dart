import 'package:flutter/material.dart';
import 'package:myapp9/models/a_user_entity.dart';
import 'package:myapp9/models/authorizations_store_entity.dart';

class UserProvider extends ChangeNotifier {
  AUserEntity? _userEntity;
  int? _indexAction = 11;
  int get indexAction => _indexAction!;

  AUserEntity get userEntity => _userEntity!;

  void setUserEntity(AUserEntity userEntity) {
    if (userEntity.aPhone != _userEntity?.aPhone ||
        userEntity.bName != _userEntity?.bName ||
        userEntity.fCreditAmount != _userEntity?.fCreditAmount ||
        userEntity.hIndexNo != _userEntity?.hIndexNo ||
        userEntity.iIndexAction != _userEntity?.iIndexAction ||
        userEntity.oIntervene != _userEntity?.oIntervene ||
        userEntity.aeMessage != _userEntity?.aeMessage) {
      _userEntity = userEntity;
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
