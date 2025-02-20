import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/myapp9_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/verify/iviews/id_card_photo_i_mvp_view.dart';
import 'package:myapp9/pages/verify/presenters/id_card_photo_page_presenter.dart';
import 'package:myapp9/pages/verify/router/verify_router.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/util/device_utils.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_button.dart';
import 'package:myapp9/widgets/my_scroll_view.dart';
import 'package:myapp9/widgets/selected_image.dart';
import 'package:sp_util/sp_util.dart';

import '../../config/constant.dart';

/// design/6/index.html#artboard2
class IdCardPhoto3Page extends StatefulWidget {
  const IdCardPhoto3Page({Key? key}) : super(key: key);

  @override
  _IdCardPhotoPageState createState() => _IdCardPhotoPageState();
}

class _IdCardPhotoPageState extends State<IdCardPhoto3Page>
    with
        BasePageMixin<IdCardPhoto3Page, IdCardPhotoPagePresenter>,
        SingleTickerProviderStateMixin
    implements IdCardPhotoIMvpView {
  late IdCardPhotoPagePresenter _idCardPhotoPagePresenter;

  final GlobalKey<SelectedImageState> _imageGlobalKey =
      GlobalKey<SelectedImageState>();
  final GlobalKey<SelectedImageState> _imageGlobalKey2 =
      GlobalKey<SelectedImageState>();

  CameraController? _cameraController;
  XFile? _imageFile;
  List<CameraDescription> _cameras = [];
  bool isCameraInitialized = false; // 标记摄像头是否初始化完成
  bool isCameraStarted = false; // 是否已Next摄像头界面
  bool isRearCameraSelected = true; // 默认后置摄像头

  @override
  void initState() {
    super.initState();
    _initializeCameras(); // 初始化摄像头列表
  }

  // 初始化摄像头列表
  Future<void> _initializeCameras() async {
    try {
      _cameras = await availableCameras(); // 获取可用摄像头列表
    } catch (e) {
      // debugPrint("获取摄像头失败: $e");
    }
  }

  // 初始化摄像头
  void _initCamera(CameraDescription cameraDescription) async {
    _cameraController?.dispose(); // 清理之前的 CameraController
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    try {
      await _cameraController!.initialize();
    } catch (e) {
      // debugPrint("摄像头初始化失败: $e");
    }

    if (mounted) {
      setState(() {
        isCameraInitialized = true; // 摄像头初始化完成
      });
    }
  }

  // 启动摄像头
  void _startCamera() {
    if (_cameras.isNotEmpty) {
      setState(() {
        isCameraStarted = true; // 切换到摄像头界面
        isCameraInitialized = false; // 标记初始化状态为 false
      });
      _initCamera(_cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      ));
    } else {
      // debugPrint("没有可用的摄像头！");
    }
  }

  // 拍照
  Future<void> _takePicture() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    try {
      final file = await _cameraController!.takePicture();
      setState(() {
        _imageFile = file; // 保存拍摄的图片
        isCameraStarted = false; // 拍照后返回初始界面
      });
    } catch (e) {
      // debugPrint("拍照失败: $e");
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  IdCardPhotoPagePresenter createPresenter() {
    _idCardPhotoPagePresenter = IdCardPhotoPagePresenter();
    return _idCardPhotoPagePresenter;
  }

  @override
  void onUploadSuccess(String? id, String? name) {
    NavigatorUtils.push(context, '${VerifyRouter.idCard}?id=$id&name=$name',
        replace: true);
  }

  @override
  void onCreateRefuse(String message) {
    // NavigatorUtils.goBack(context);
    // NavigatorUtils.goBack(context);
    showToast(message);
  }
  void _next(XFile file2) {
    String filePath = SpUtil.getString(Constant.idCardPhotoPath)!;
    XFile file1 = XFile(filePath);
    _idCardPhotoPagePresenter.uploadImg2(file1, file2);
  }


  @override
  Widget build(BuildContext context) {
    return isCameraStarted
          ? _buildCameraScreen() // 显示摄像头界面
          : _buildInitialScreen() // 显示初始图例界面
    ;
  }

  // 初始界面
  Widget _buildInitialScreen() {
    return Scaffold(
        appBar: const MyAppBar(
          centerTitle: 'Identity Information',
        ),
        body: MyScrollView(
          key: const Key('id_card_photo_page'),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
          crossAxisAlignment: CrossAxisAlignment.center,
          bottomButton: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 0.0),
            child: Column(
              children: [
                Gaps.vGap16,
                MyButton(
                  onPressed: _imageFile != null ? () => _next(_imageFile!) : _startCamera,
                  text: _imageFile != null ? 'Next' : 'Start taking photos',
                ),
                Gaps.vGap10,
                _imageFile != null ?  GestureDetector(onTap: _startCamera, child: Text('Retake the photo', style: const TextStyle(fontSize: 14.0))) : Gaps.vGap10,
                Gaps.vGap10,
              ],
            ),
          ),
          children: _imageFile != null ? <Widget>[
            Image.file(
              File(_imageFile!.path),
              fit: BoxFit.cover,
            ),
          ] :
          <Widget>[
            Gaps.vGap50,
            const Text(
              'Hold your ID document and take a photo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Container(
              color: Colors.transparent,
              child: Lottie.asset(
                'assets/images/verify/id/3.json',
                animate: true,
                repeat: true,
                reverse: false,
                // fit: BoxFit.contain,
              ),
            ),
            Gaps.vGap50,
            SizedBox(height: 10),
            _buildStep(1, 'Hold your ID document in one hand.'),
            _buildStep(2, 'Ensure all details on the ID are visible.'),
            _buildStep(3, 'Stand in a well-lit area.'),
            _buildStep(4, 'Position the ID near your chest.'),
            _buildStep(5, 'Look straight at the camera.'),
            SizedBox(height: 20),
          ],
        ));
  }
  Widget _buildStep(int stepNumber, String stepText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$stepNumber.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(stepText),
          ),
        ],
      ),
    );
  }

  // 摄像头界面
  Widget _buildCameraScreen() {
    return Stack(
      children: [
        // 显示全屏摄像头预览
        if (isCameraInitialized && _cameraController != null)
          CameraPreview(_cameraController!)
        else
          const Center(child: CircularProgressIndicator()),
        // 拍照按钮
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _takePicture,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
        // 返回按钮
        Positioned(
          top: 40,
          left: 20,
          child: IconButton(
            onPressed: () {
              setState(() {
                isCameraStarted = false; // 返回初始界面
              });
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
