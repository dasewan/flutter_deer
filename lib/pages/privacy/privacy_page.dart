import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/myapp9_localizations.dart';
import 'package:myapp9/routers/fluro_navigator.dart';

import '../../widgets/my_app_bar.dart';
import '../login2/router/login_router.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  final ScrollController _scrollController = ScrollController();
  bool _canTap = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        _canTap = _scrollController.offset + 20 >= (_scrollController.position.maxScrollExtent) && !_scrollController.position.outOfRange;
        // _canTap = _scrollController.offset + 10 >= (_scrollController.position.maxScrollExtent) ;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: "隐私政策",
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // _buildTitle('隐私政策'),
                    _buildSubTitle('本政策仅适用于{公司名}的{产品名}产品或服务'),
                    _buildTip("最近更新日期：{隐私政策更新时间}"),
                    _buildSubTitle2("一、我们如何收集和使用您的用户信息"),
                    _buildSubTitle2("二、我们如何使用 Cookie 和同类技术"),
                    _buildSubTitle2("三、我们如何共享、转让、公开披露您的用户信息"),
                    _buildSubTitle2("四、我们如何保护您的用户信息"),
                    _buildSubTitle2("五、您的权利"),
                    _buildSubTitle2("六、我们如何处理儿童的个人信息"),
                    _buildSubTitle2("七、您的用户信息如何储存及如何在全球范围转移"),
                    _buildSubTitle2("八、本政策如何更新"),
                    _buildSubTitle2("九、如何联系我们"),
                    _buildContent(
                        "我们深知用户信息对您的重要性，并会尽全力保护您的用户信息安全可靠。我们致力于维持您对我们的信任，恪守以下原则，保护您的用户信息：权责一致原则、目的明确原则、选择同意原则、最少够用原则、确保安全原则、主体参与原则、公开透明原则等。同时，我们承诺，我们将按业界成熟的安全标准，采取相应的安全保护措施来保护您的用户信息。请在使用我们的产品（或服务）前，仔细阅读并了解本隐私政策。"),
                    _buildSubTitle2("一、我们如何收集和使用您的用户信息"),
                    _buildContent('''（一）您使用我司产品或服务过程中我们收集和使用的信息
我们仅会出于本政策所述的业务功能，收集和使用您的用户信息，收集用户信息的目的在于向您提供产品或服务，您有权自行选择是否提供该信息，但多数情况下，如果您不提供，我们可能无法向您提供相应的服务，也无法回应您遇到的问题：
在您使用我们的服务时，允许我们收集您自行向我们提供的或为向您提供服务所必要的信息包括：姓名、身份证信息、手机设备信息、手机号码、位置信息、收入信息、资产状况（车辆、房产、存款）、应用列表信息、银行卡信息等。
对于我们收集的用户信息，我们将用于为您提供注册、登录服务、金融产品的浏览、搜索、匹配、推荐服务、金融产品的申请服务、金融产品的还款等服务。
您提供的上述信息，将在您使用本服务期间持续授权我们使用。在您停止使用推送服务时，我们将停止使用并删除上述信息。
我们保证会依法对收集后的用户信息进行去标识化或匿名化处理，对于无法单独或者与其他信息结合识别自然人个人身份的信息，不属于法律意义上的个人信息。如果我们将非个人信息与其他信息结合识别到您的个人身份时，或者与您的个人信息结合使用时，我们会在结合使用期间，将此类信息作为您的个人信息按照本隐私政策对其进行处理和保护。
为了更好运营和改善我们的技术和服务，或出于商业策略的变化，当我们提供的产品或服务所需的用户信息收集、使用、处理超出上述范围或者要将收集到的用户信息用于本隐私政策未载明的其他用途，或当我们要将基于特定目的收集而来的信息用于其他目的时，我们会在获取用户信息后的合理期限内或处理用户信息前通知您，并获得您的授权同意。
                    '''),
                    _buildContent('''（二）征得授权同意的例外请您理解，根据法律法规及相关国家标准，以下情形中，我们收集和使用您的用户信息无需征得您的授权同意： 
1、与国家安全、国防安全直接相关的； 
2、与公共安全、公共卫生、重大公共利益直接相关的； 
3、与犯罪侦查、起诉、审判和判决执行等直接相关的； 
4、出于维护您或其他个人的生命、财产等重大合法权益但又很难得到本人同意的； 
5、所收集的您的用户信息是您自行向社会公众公开的；
6、从合法公开披露的信息中收集的您的用户信息，如合法的新闻报道、政府信息公开等渠道； 
7、根据您的要求签订或履行合同所必需的； 
8、用于维护软件及相关服务的安全稳定运行所必需的，例如发现、处置软件及相关服务的故障；
9、 个人信息控制者为新闻单位且其在开展合法的新闻报道所必需的； 
10、学术研究机构基于公共利益开展统计或学术研究所必要，且对外提供学术研究或描述的结果时，对结果中所包含的个人信息进行去标识化处理的。
11、法律法规规定的其他情形。
                    '''),
                    _buildContent('''
                  （二）征得授权同意的例外
请您理解，根据法律法规及相关国家标准，以下情形中，我们收集和使用您的用户信息无需征得您的授权同意： 
1、与国家安全、国防安全直接相关的； 
2、与公共安全、公共卫生、重大公共利益直接相关的； 
3、与犯罪侦查、起诉、审判和判决执行等直接相关的； 
4、出于维护您或其他个人的生命、财产等重大合法权益但又很难得到本人同意的； 
5、所收集的您的用户信息是您自行向社会公众公开的；
6、从合法公开披露的信息中收集的您的用户信息，如合法的新闻报道、政府信息公开等渠道； 
7、根据您的要求签订或履行合同所必需的； 
8、用于维护软件及相关服务的安全稳定运行所必需的，例如发现、处置软件及相关服务的故障；
9、 个人信息控制者为新闻单位且其在开展合法的新闻报道所必需的； 
10、学术研究机构基于公共利益开展统计或学术研究所必要，且对外提供学术研究或描述的结果时，对结果中所包含的个人信息进行去标识化处理的。
11、法律法规规定的其他情形。


                  '''),

                    // Add more sections as needed
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              _canTap ? '' : '请滑动并阅读所有协议内容',
              style: TextStyle(color: Colors.red),
            ),
            ElevatedButton(
              onPressed: _canTap
                  ? () {
                NavigatorUtils.push(context, LoginRouter.loginPhonePage, replace: true);
                    }
                  : null,
              child: Text(Myapp9Localizations.of(context)!.agree),
            ),
            ElevatedButton(
              child: Text(Myapp9Localizations.of(context)!.disagree),
              onPressed: () {
                NavigatorUtils.goBackWithParams(context, false);
                // execute your code
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSubTitle(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        content,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildSubTitle2(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        content,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  Widget _buildTip(String content) {
    return Text(
      content,
      style: TextStyle(fontSize: 14, color: Colors.grey),
    );
  }

  Widget _buildContent(String content) {
    return Text(
      content,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    );
  }
}
