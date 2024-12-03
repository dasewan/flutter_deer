import 'package:flutter/services.dart';
import 'package:livelyness_detection/index.dart';
import 'package:livelyness_detection/livelyness_detection.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/liveness/iviews/liveness_i_mvp_view.dart';
import 'package:myapp9/pages/liveness/presenters/liveness_page_presenter.dart';
import 'package:myapp9/pages/sign/router/sign_router.dart';
import 'package:myapp9/res/raw/gaps.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_button.dart';

import '../../providers/liveness_provider.dart';

List<LivelynessStepItem> stepSelfies = [
  LivelynessStepItem(
    step: LivelynessStep.blink,
    title: "Blink",
    isCompleted: false,
  ),
  LivelynessStepItem(
    step: LivelynessStep.smile,
    title: "Smile",
    isCompleted: false,
  ),
];

class LivenessPage extends StatefulWidget {
  const LivenessPage({Key? key, this.productId}) : super(key: key);
  final String? productId;

  @override
  _LivenessPageState createState() => _LivenessPageState();
}

class _LivenessPageState extends State<LivenessPage> with BasePageMixin<LivenessPage, LivenessPagePresenter> implements LivenessIMvpView {
  late LivenessPagePresenter _livenessPagePresenter;
  static const platform = MethodChannel('samples.flutter.io/battery');

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _indexFirstPagePresenter.index(false);
    // });
  }

  @override
  LivenessProvider provider = LivenessProvider();

  @override
  LivenessPagePresenter createPresenter() {
    _livenessPagePresenter = LivenessPagePresenter(productId: widget.productId);
    return _livenessPagePresenter;
  }

  @override
  void signSuccess(String tip1, String tip2, String tip3, String tip4) {
    NavigatorUtils.push(context, "${SignRouter.signSuccess}?tip1=$tip1&tip2=$tip2&tip3=$tip3&tip4=$tip4", clearStack: true);
  }

  void dBorrowsStore(List<String?> listFace) {
    _livenessPagePresenter.dBorrowsStore(true, int.parse(widget.productId!), listFace);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }

  @override
  Future<bool> requestOpsPermission() async {
    Map<String, dynamic> arguments = <String, dynamic>{
      'type': "sms",
    };
    final bool has3 = await platform.invokeMethod('checkOpsPermission', arguments);
    if (!has3) {
      showCupertinoDialogSub(title: "短信授权", content: "请到系统设置，授权app短信授权");
    } else {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          centerTitle: 'Face Recognition',
        ),
        body: Container(
          color: Colors.grey[300],
          child: Column(
            key: const Key('goods_edit_page'),
            children: <Widget>[
              Expanded(
                flex: 13,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  padding: const EdgeInsets.all(1.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Gaps.vGap24,
                      Center(
                        child: Text(
                          "Face the screen at eye level and towards a light source",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Gaps.vGap24,
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/liveness/liveness1.png',
                              width: 160.0,
                            ),
                            Gaps.vGap12,
                            // Text("data"),
                            Gaps.vGap12,
                          ],
                        ),
                      ),
                      Expanded(
                        child: GridView(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, //横轴三个子widget
                                childAspectRatio: 3.0 //宽高比为1时，子widget
                            ),
                            children: <Widget>[
                              Icon(
                                Icons.phone_android,
                                color: Colors.blue,
                              ),
                              Icon(
                                Icons.light_mode,
                                color: Colors.blue,
                              ),
                              Icon(
                                Icons.face,
                                color: Colors.blue,
                              ),
                              Center(
                                  child: Text(
                                    "facing the phone",
                                    style: TextStyle(fontSize: 11, color: Colors.blue[700]),
                                  )),
                              Center(
                                  child: Text(
                                    "adequate lighting",
                                    style: TextStyle(fontSize: 11, color: Colors.blue[700]),
                                  )),
                              Center(
                                  child: Text(
                                    "standardized actions",
                                    style: TextStyle(fontSize: 11, color: Colors.blue[700]),
                                  )),
                            ]),
                      )
                    ],
                  ),
                ),
              ),

              //right

              Gaps.vGap5,
              //wrong
              Expanded(
                flex: 7,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  padding: const EdgeInsets.all(1.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.vGap24,
                      const Text("      Prohibited actions"),
                      Gaps.vGap12,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/liveness/liveness2.png',
                                  width: 84.0,
                                ),
                                Gaps.vGap5,
                                Text(
                                  "No Glasses",
                                  style: TextStyle(fontSize: 9, color: Colors.red[400]),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/liveness/liveness3.png',
                                    width: 84.0,
                                  ),
                                  Gaps.vGap5,
                                  Text(
                                    "No Covering",
                                    style: TextStyle(fontSize: 9, color: Colors.red[400]),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/liveness/liveness4.png',
                                    width: 84.0,
                                  ),
                                  Gaps.vGap5,
                                  Text(
                                    "Eye-level Shot",
                                    style: TextStyle(fontSize: 9, color: Colors.red[400]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.vGap8,
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                child: Column(
                  children: [
                    // Center(
                    //   child: Text(
                    //     "为了您的资金顺利到账，需要您先完成人脸识别。",
                    //     style: TextStyle(fontSize: 16),
                    //   ),
                    // ),
                    Gaps.vGap12,
                    MyButton(
                      onPressed: () async {
                        final CapturedImage? response =await LivelynessDetection.instance.detectLivelyness(
                          context,
                          config: DetectionConfig(
                            steps: [
                              LivelynessStepItem(
                                step: LivelynessStep.blink,
                                title: "Blink",
                                isCompleted: false,
                              ),
                              LivelynessStepItem(
                                step: LivelynessStep.smile,
                                title: "Smile",
                                isCompleted: false,
                              ),
                            ],
                            startWithInfoScreen: true,
                          ),
                        );;
                        List<String> listFace = [response?.imgPath ?? ''];
                        List<File> fileList = listFace
                            .where((path) => path != null) // 过滤掉空值
                            .map((path) => File(path!)) // 将剩余的非空字符串转换为 File
                            .toList();

                        // 现在 fileList 是一个 List<File>
                        fileList.forEach((file) => print(file.path));
                        if (fileList.length > 2) {
                          // dBorrowsStore(listFace);
                        } else {
                          showToast("Face recognition failed, please retry!");
                        }
                        /*                    showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => ConfirmDialog(onPressed: (id) {
                                  dBorrowsStore(id);
                                }));*/
                      },
                      text: 'Start',
                    ),
                    Gaps.vGap8,
                    Center(
                      child: Text(
                        "To ensure your funds are credited smoothly, we need you to complete facial recognition first.",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Gaps.vGap24,
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
