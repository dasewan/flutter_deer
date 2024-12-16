import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/myapp9_localizations.dart';
import 'package:livelyness_detection/index.dart';
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

/// design/6/index.html#artboard2
class IdCardPhoto2Page extends StatefulWidget {
  const IdCardPhoto2Page({Key? key}) : super(key: key);

  @override
  _IdCardPhotoPageState createState() => _IdCardPhotoPageState();
}

class _IdCardPhotoPageState extends State<IdCardPhoto2Page>
    with BasePageMixin<IdCardPhoto2Page, IdCardPhotoPagePresenter>, SingleTickerProviderStateMixin
    implements IdCardPhotoIMvpView {
  late IdCardPhotoPagePresenter _idCardPhotoPagePresenter;

  final GlobalKey<SelectedImageState> _imageGlobalKey = GlobalKey<SelectedImageState>();
  final GlobalKey<SelectedImageState> _imageGlobalKey2 = GlobalKey<SelectedImageState>();

  CameraController? _cameraController;
  XFile? _imageFile;
  List<CameraDescription> _cameras = [];
  bool isCameraInitialized = false; // 标记摄像头是否初始化完成
  bool isCameraStarted = false; // 是否已进入摄像头界面
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
      debugPrint("获取摄像头失败: $e");
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
      debugPrint("摄像头初始化失败: $e");
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
            (camera) => camera.lensDirection == CameraLensDirection.back,
      ));
    } else {
      debugPrint("没有可用的摄像头！");
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
      debugPrint("拍照失败: $e");
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
    NavigatorUtils.push(context, '${VerifyRouter.idCard}?id=$id&name=$name', replace: true);
  }

  @override
  void onCreateRefuse(String message) {
    // NavigatorUtils.goBack(context);
    // NavigatorUtils.goBack(context);
    showToast(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isCameraStarted
          ? _buildCameraScreen() // 显示摄像头界面
          : _buildInitialScreen(), // 显示初始图例界面
    );
  }
  // 初始界面
  Widget _buildInitialScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 如果拍摄了照片，则显示照片
          if (_imageFile != null)
            Column(
              children: [
                Image.file(
                  File(_imageFile!.path),
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  '这是您刚刚拍摄的照片',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            )
          else
            Column(
              children: [
                Container(
                  color: Colors.transparent,
                  child: Lottie.asset(
                    'assets/images/verify/id/3.json',
                    animate: true,
                    repeat: true,
                    reverse: false,
                    fit: BoxFit.contain,
                  ),
                ),
                // Icon(
                //   Icons.camera_alt,
                //   size: 100,
                //   color: Colors.grey[400],
                // ),
                const SizedBox(height: 20),
                const Text(
                  '点击启动摄像头',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: _startCamera,
            child: const Text('启动摄像头'),
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
