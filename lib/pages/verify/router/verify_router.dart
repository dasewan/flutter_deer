import 'package:fluro/fluro.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/pages/verify/contact_page.dart';
import 'package:myapp9/pages/verify/id_card_page.dart';
import 'package:myapp9/pages/verify/id_card_photo2_page.dart';
import 'package:myapp9/pages/verify/id_card_photo_page.dart';
import 'package:myapp9/pages/verify/job_page.dart';
import 'package:myapp9/pages/verify/swiper_page.dart';
import 'package:myapp9/pages/verify/verify_list_page.dart';
import 'package:myapp9/routers/i_router.dart';
import 'package:sp_util/sp_util.dart';

import '../id_card_photo3_page.dart';
import '../loan_bank_page.dart';
import '../widgets/city_select_page.dart';

class VerifyRouter implements IRouterProvider {
  static String swipper = '/verify/swipper';
  static String verifyList = '/verify/verifyList';
  static String idCardPhoto = '/verify/idCardPhoto';
  static String handIdCardPhoto = '/verify/handIdCardPhoto';

  static String idCard = '/verify/idCard';
  static String contact = '/verify/contact';
  static String loanBank = '/verify/loanBank';
  static String repayBank = '/verify/repayBank';
  static String job = '/verify/job';
  static String liveness = '/verify/liveness';
  static String citySelectPage = '/verify/citySelect';

  @override
  void initRouter(FluroRouter router) {
    router.define(swipper, handler: Handler(handlerFunc: (_, __) {
      return const SwiperPage();
    }));
    router.define(verifyList, handler: Handler(handlerFunc: (_, __) {
      return const VerifiListPage();
    }));
    router.define(idCard, handler: Handler(handlerFunc: (_, params) {
      String? a = SpUtil.getString(Constant.idCardOrPhoto);
      if (a == VerifyRouter.idCard) {
        final String? id = params['id']?.first ?? SpUtil.getString(Constant.ocrIdResult, defValue: '');
        final String? name = params['name']?.first ?? SpUtil.getString(Constant.ocrNameResult, defValue: '');
        return IdCardPage(id: id, name: name);
      }else if (a == VerifyRouter.handIdCardPhoto) {
        return const IdCardPhoto3Page();
      }else {
        return const IdCardPhoto2Page();
      }
    }));
    router.define(idCardPhoto, handler: Handler(handlerFunc: (_, __) {
      return const IdCardPhoto2Page();
    }));
    router.define(handIdCardPhoto, handler: Handler(handlerFunc: (_, __) {
      return const IdCardPhoto3Page();
    }));
    router.define(contact, handler: Handler(handlerFunc: (_, __) {
      return const ContactPage();
    }));
    router.define(job, handler: Handler(handlerFunc: (_, __) {
      return const JobPage();
    }));
    router.define(loanBank, handler: Handler(handlerFunc: (_, __) {
      return const LoanBankPage();
    }));
    router.define(citySelectPage, handler: Handler(handlerFunc: (_, __) => const CitySelectPage()));

    // router.define(idCard, handler: Handler(handlerFunc: (_, __) {
    //   return IdCardPage();
    // }));
  }
}
