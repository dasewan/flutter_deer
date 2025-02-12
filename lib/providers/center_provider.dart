import 'package:flutter/material.dart';
import 'package:myapp9/generated/center_entity.dart';

import '../generated/json/center_entity.g.dart';

class CenterProvider extends ChangeNotifier {
  CenterData _centerData = $CenterDataFromJson({
    "b_name": "",
    "a_phone": "52345678905",
    "whatsapp": "15921185025",
    "a_e_message": 88,
    "a_o_service_count": 0,
    "g_credit_fraction": 0,
    "current_level": "D(900)",
    "f_credit_amount": 2000000,
    "next_amount": 1000,
    "process_tip": "Complete the certification to obtain the correct loan amount",
    "last_refresh_time": "2023-06-25T00:40:11.000000Z",
    "show_active": 0,
    "amount_progress": [
      {"amount": 0, "type": 2},
      {"amount": 0, "type": 0},
      {"amount": 1000, "type": 1},
      {"amount": 0, "type": 0},
      {"amount": 0, "type": 0},
      {"amount": 2000, "type": 1},
      {"amount": 0, "type": 0},
      {"amount": 0, "type": 0},
      {"amount": 4000, "type": 1},
      {"amount": 0, "type": 0},
      {"amount": 8000, "type": 1}
    ],
    "level_progress": [
      {"level": "", "type": 2},
      {"level": "", "type": 0},
      {"level": "A(300)", "type": 1},
      {"level": "", "type": 0},
      {"level": "", "type": 0},
      {"level": "B(500)", "type": 1},
      {"level": "", "type": 0},
      {"level": "", "type": 0},
      {"level": "C(800)", "type": 1},
      {"level": "", "type": 0},
      {"level": "D(900)", "type": 1}
    ],
    "point": [0, 0.3, 0.5, 0.8, 1]
  });
  String? _lastRefreshTime = '';

  CenterData get centerData => _centerData!;

  String get lastRefreshTime => _lastRefreshTime!;

  void setCenterData(CenterData centerData) {
    if (centerData.lastRefreshTime != _lastRefreshTime) {
      _centerData = centerData;
      _lastRefreshTime = centerData.lastRefreshTime;
      notifyListeners();
    }
  }
}
