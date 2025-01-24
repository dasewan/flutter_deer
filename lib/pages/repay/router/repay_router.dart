import 'package:fluro/fluro.dart';
import 'package:myapp9/pages/repay/repay_page.dart';
import 'package:myapp9/pages/repay/repay_succes_page.dart';
import 'package:myapp9/routers/i_router.dart';

import '../bank_page.dart';
import '../confirm_pay_page.dart';
import '../part_pay_page.dart';

class RepayRouter implements IRouterProvider {
  static String repay = '/repay';
  static String repaySuccess = '/repay_success';
  static String bank = '/bank';
  static String methodPay = '/method_pay';
  static String partPay = '/part_pay';

  @override
  void initRouter(FluroRouter router) {
    router.define(repay, handler: Handler(handlerFunc: (_, params) {
      print(params['productId']);
      final String? id = params['productId']?.first;
      print(id);
      return RepayPage(
        productId: id!,
      );
    }));
    router.define(repaySuccess, handler: Handler(handlerFunc: (_, __) {
      return const RepaySuccessPage();
    }));
    router.define(bank, handler: Handler(handlerFunc: (_, params) {
      final String id = params['productId']!.first;
      final String amount = params['amount']!.first;
      final String payType = params['payType']!.first;
      final String? extendDays = params['extendDays']?.first;
      final String? sn = params['sn']?.first;
      int extendDays2 = 0;
      if (extendDays != null) {
        extendDays2 = int.parse(extendDays);
      }
      final String? periods = params['periods']?.first;
      String periods2 = '';
      if (periods != null) {
        periods2 = periods;
      }
      return BankPage(
        productId: id,
        amount: int.parse(amount),
        payType: payType,
        extendDays: extendDays2,
        periods: periods2,
        sn: sn,
      );
    }));
    router.define(methodPay, handler: Handler(handlerFunc: (_, params) {
      final String id = params['productId']!.first;
      final String amount = params['amount']!.first;
      final String payType = params['payType']!.first;
      final String bank = params['bank']!.first;
      final String? extendDays = params['extendDays']?.first;
      int extendDays2 = 0;
      if (extendDays != null) {
        extendDays2 = int.parse(extendDays);
      }
      final String? periods = params['periods']?.first;
      String periods2 = '';
      if (periods != null) {
        periods2 = periods;
      }
      return ConfirmPayPage(productId: "11", payType: payType, amount: int.parse(amount), extendDays: extendDays2, bank: bank, periods: periods2);
    }));
    router.define(partPay, handler: Handler(handlerFunc: (_, params) {
      final String id = params['productId']!.first;
/*      final String step = params['step']!.first;
      final String min = params['min']!.first;
      final String amountRange = params['amountRange']!.first;
      final String periodRange = params['periodRange']!.first;*/
      final String step = "100";
      final String min = "10000";
      final String amountRange = "30000,20000,10000,10000";
      List<int> amountRange2 = amountRange.split(',').map((string) => int.parse(string)).toList();
      List<int> amountRange3 = [];
      int cumulativeSum = 0;
      for (int i = 0; i < amountRange2.length; i++) {
        cumulativeSum += amountRange2[i];
        amountRange3.add(cumulativeSum);
      }
      final String periodRange = "2,3,4,5";
      return PartPayPage(
        productId: id,
        step: int.parse(step),
        min: int.parse(min),
        amountRange: amountRange3,
        periodRange: periodRange.split(','),
      );
    }));
  }
}
