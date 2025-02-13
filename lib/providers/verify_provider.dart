import 'package:flutter/material.dart';
import 'package:myapp9/models/g_verify_entity.dart';

class VerifyProvider extends ChangeNotifier {
  GVerifyEntity? _gVerifyEntity;
  int _jIdnumberVerifyStatus = 10;
  int _nContactVerifyStatus = 10;
  int _pJobVerifyStatus = 10;
  int _tRepayBankStatus = 10;
  int _rLoanBankStatus = 10;
  int _vH5VerifyStatus = 10;
  int _fStatus = 10;
  int _yOcrVerifyStatus = 10;
  int _aASupplementVerifyStatus = 10;
  String _updatedAt = '';
  int _next = 0; // 0:ocr 1:id 2:contact 3:job 4:bank

  GVerifyEntity? get gVerifyEntity => _gVerifyEntity;

  void setGVerifyEntity(GVerifyEntity gVerifyEntity) {
    if (gVerifyEntity.jIdnumberVerifyStatus !=
            _gVerifyEntity?.jIdnumberVerifyStatus ||
        gVerifyEntity.pJobVerifyStatus != _gVerifyEntity?.pJobVerifyStatus ||
        gVerifyEntity.tRepayBankStatus != _gVerifyEntity?.tRepayBankStatus ||
        gVerifyEntity.nContactVerifyStatus !=
            _gVerifyEntity?.nContactVerifyStatus ||
        gVerifyEntity.rLoanBankStatus != _gVerifyEntity?.rLoanBankStatus ||
        gVerifyEntity.vH5VerifyStatus != _gVerifyEntity?.vH5VerifyStatus||
        gVerifyEntity.fStatus != _gVerifyEntity?.fStatus ||
        gVerifyEntity.yOcrVerifyStatus != _gVerifyEntity?.yOcrVerifyStatus ||
        gVerifyEntity.aASupplementVerifyStatus != _gVerifyEntity?.aASupplementVerifyStatus ) {
      notifyListeners();
    }
  }

  int get jIdnumberVerifyStatus => _jIdnumberVerifyStatus;

  void setJIdnumberVerifyStatus(int jIdnumberVerifyStatus) {
    if (_jIdnumberVerifyStatus != jIdnumberVerifyStatus) {
      _jIdnumberVerifyStatus = jIdnumberVerifyStatus;
      notifyListeners();
    }
  }

  int get nContactVerifyStatus => _nContactVerifyStatus;

  void setNContactVerifyStatus(int nContactVerifyStatus) {
    if (_nContactVerifyStatus != nContactVerifyStatus) {
      _nContactVerifyStatus = nContactVerifyStatus;
      notifyListeners();
    }
  }

  int get pJobVerifyStatus => _pJobVerifyStatus;

  void setPJobVerifyStatus(int pJobVerifyStatus) {
    if (_pJobVerifyStatus != pJobVerifyStatus) {
      _pJobVerifyStatus = pJobVerifyStatus;
      notifyListeners();
    }
  }

  int get tRepayBankStatus => _tRepayBankStatus;

  void setTRepayBankStatus(int tRepayBankStatus) {
    if (_tRepayBankStatus != tRepayBankStatus) {
      _tRepayBankStatus = tRepayBankStatus;
      notifyListeners();
    }
  }

  int get rLoanBankStatus => _rLoanBankStatus;

  void setRLoanBankStatus(int rLoanBankStatus) {
    if (_rLoanBankStatus != rLoanBankStatus) {
      _rLoanBankStatus = rLoanBankStatus;
      notifyListeners();
    }
  }

  int get vH5VerifyStatus => _vH5VerifyStatus;

  void setVH5VerifyStatus(int vH5VerifyStatus) {
    if (_vH5VerifyStatus != vH5VerifyStatus) {
      _vH5VerifyStatus = vH5VerifyStatus;
      notifyListeners();
    }
  }
  int get fStatus => _fStatus;

  void setFStatus(int fStatus) {
    if (_fStatus != fStatus) {
      _fStatus = fStatus;
      notifyListeners();
    }
  }

  int get yOcrVerifyStatus => _yOcrVerifyStatus;

  void setYOcrVerifyStatus(int yOcrVerifyStatus) {
    if (_yOcrVerifyStatus != yOcrVerifyStatus) {
      _yOcrVerifyStatus = yOcrVerifyStatus;
      notifyListeners();
    }
  }

  int get aASupplementVerifyStatus => _aASupplementVerifyStatus;

  void setAASupplementVerifyStatus(int aASupplementVerifyStatus) {
    if (_aASupplementVerifyStatus != aASupplementVerifyStatus) {
      _aASupplementVerifyStatus = aASupplementVerifyStatus;
      notifyListeners();
    }
  }

  String get updatedAt => _updatedAt;

  void setUpdatedAt(String updatedAt) {
    if (_updatedAt != updatedAt) {
      _updatedAt = updatedAt;
      notifyListeners();
    }
  }

  int get next => _next;

  void setNext(int next) {
    if (_next != next) {
      _next = next;
      notifyListeners();
    }
  }
}
