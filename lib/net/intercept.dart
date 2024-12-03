
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/util/device_utils.dart';
import 'package:myapp9/util/log_utils.dart';
import 'package:myapp9/util/other_utils.dart';
import 'package:sp_util/sp_util.dart';
import 'package:sprintf/sprintf.dart';

import 'dio_utils.dart';
import 'error_handle.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String accessToken = SpUtil.getString(Constant.accessToken).nullSafe;
    if (accessToken.isNotEmpty) {
      //options.headers['Authorization'] = 'token $accessToken';
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    if (!Device.isWeb) {
      // https://developer.github.com/v3/#user-agent-required
      options.headers['User-Agent'] = 'Mozilla/5.0';
    }
    super.onRequest(options, handler);
  }
}

class TokenInterceptor extends QueuedInterceptor {

  Dio? _tokenDio;

  Future<String?> getToken() async {

    final Map<String, String> params = <String, String>{};
    params['refresh_token'] = SpUtil.getString(Constant.refreshToken).nullSafe;
    try {
      _tokenDio ??= Dio();
      _tokenDio!.options = DioUtils.instance.dio.options;
      final Response<dynamic> response = await _tokenDio!.post<dynamic>('lgn/refreshToken', data: params);
      if (response.statusCode == ExceptionHandle.success) {
        return (json.decode(response.data.toString()) as Map<String, dynamic>)['access_token'] as String;
      }
    } catch(e) {
      Log.e('刷新Token失败！');
    }
    return null;
  }

  @override
  Future<void> onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) async {
    //401代表token过期
    if (response.statusCode == ExceptionHandle.unauthorized) {
      Log.d('-----------自动刷新Token------------');
      final String? accessToken = await getToken(); // 获取新的accessToken
      Log.e('-----------NewToken: $accessToken ------------');
      SpUtil.putString(Constant.accessToken, accessToken.nullSafe);

      if (accessToken != null) {
        // 重新请求失败接口
        final RequestOptions request = response.requestOptions;
        request.headers['Authorization'] = 'Bearer $accessToken';

        final Options options = Options(
          headers: request.headers,
          method: request.method,
        );

        try {
          Log.e('----------- 重新请求接口 ------------');
          /// 避免重复执行拦截器，使用tokenDio
          final Response<dynamic> response = await _tokenDio!.request<dynamic>(request.path,
            data: request.data,
            queryParameters: request.queryParameters,
            cancelToken: request.cancelToken,
            options: options,
            onReceiveProgress: request.onReceiveProgress,
          );
          return handler.next(response);
        } on DioException catch (e) {
          return handler.reject(e);
        }
      }
    }
    super.onResponse(response, handler);
  }
}

class LoggingInterceptor extends Interceptor{

  late DateTime _startTime;
  late DateTime _endTime;
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    Log.d('----------Start----------');
    Log.d('⏰\x1B[36m${_startTime}\x1B[0m');
    if (options.queryParameters.isEmpty) {
      Log.d('👉RequestUrl:\x1B[37m ${options.baseUrl}${options.path}\x1B[0m');
    } else {
      Log.d('RequestUrl: ${options.baseUrl}${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}');
    }
    Log.d('RequestMethod: ${options.method}');
    Log.d('RequestHeaders:${options.headers}');
    Log.d('RequestContentType: ${options.contentType}');
    Log.d('RequestData: ${options.data.toString()}');
    Log.d('👉RequestData:\x1B[37m ${options.data?.fields.toString()}\x1B[0m');
    super.onRequest(options, handler);
  }
  
  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    final int duration = _endTime.difference(_startTime).inMilliseconds;
    if (response.statusCode == ExceptionHandle.success || response.statusCode == ExceptionHandle.success_201) {
      Log.d('👌🏻\x1B[32mResponseCode: ${response.statusCode}\x1B[0m');
    } else {
      Log.e('❌\x1B[31mResponseCode: ${response.statusCode}\x1B[0m');
    }
    // 输出结果
    Log.json(response.data.toString());
    Log.d('⏰\x1B[36m${duration}毫秒\x1B[0m');
    Log.d('----------End ----------');
    super.onResponse(response, handler);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Log.d('----------Error-----------');
    super.onError(err, handler);
  }
}

class AdapterInterceptor extends Interceptor{

  static const String _kMsg = 'msg';
  static const String _kSlash = "'";
  static const String _kMessage = 'message';
  static const String _kCode = 'code';

  static const String _kDefaultText = '无返回信息';
  static const String _kNotFound = '未找到查询信息';

  static const String _kFailureFormat = '{"code":%d,"message":"%s"}';
  static const String _kSuccessFormat = '{"code":0,"data":%s,"message":""}';
  
  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    final Response<dynamic> r = adapterData(response);
    super.onResponse(r, handler);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      adapterData(err.response!);
    }
    super.onError(err, handler);
  }

  Response<dynamic> adapterData(Response<dynamic> response) {
    String result;
    String content = response.data?.toString() ?? '';
    /// 成功时，直接格式化返回
    if (response.statusCode == ExceptionHandle.success ||
        response.statusCode == ExceptionHandle.success_201 ||
        response.statusCode == ExceptionHandle.success_not_content) {
      if (content.isEmpty) {
        content = _kDefaultText;
      }
      result = sprintf(_kSuccessFormat, [content]);
      response.statusCode = ExceptionHandle.success;
    } else {
      if (response.statusCode == ExceptionHandle.not_found) {
        /// 错误数据格式化后，按照成功数据返回
        result = sprintf(_kFailureFormat, [response.statusCode, _kNotFound]);
        response.statusCode = ExceptionHandle.success;
      } else {
        if (content.isEmpty) {
          // 一般为网络断开等异常
          result = content;
        } else {
          String msg;
          int code;
          try {
            content = content.replaceAll(r'\', '');
            if (_kSlash == content.substring(0, 1)) {
              content = content.substring(1, content.length - 1);
            }
            final Map<String, dynamic> map = json.decode(content) as Map<String, dynamic>;
            if (map.containsKey(_kMessage)) {
              msg = map[_kMessage] as String;
            } else if (map.containsKey(_kMsg)) {
              msg = map[_kMsg] as String;
            } else {
              msg = '未知异常';
            }
            if (map.containsKey(_kCode)) {
              code = map[_kCode];
              if (code == 0 && response.statusCode != ExceptionHandle.success) {
                code = response.statusCode!;
              }
            } else {
              code = response.statusCode!;
            }

            // result = sprintf(_kFailureFormat, [response.statusCode, msg]);
            result = sprintf(_kFailureFormat, [code, msg]);
            // 401 token失效时，单独处理，其他一律为成功
            if (response.statusCode == ExceptionHandle.unauthorized) {
              response.statusCode = ExceptionHandle.unauthorized;
            } else {
              response.statusCode = ExceptionHandle.success;
            }
          } catch (e) {
//            Log.d('异常信息：$e');
            // 解析异常直接按照返回原数据处理（一般为返回500,503 HTML页面代码）
            result = sprintf(_kFailureFormat, [response.statusCode, '服务器异常(${response.statusCode})']);
          }
        }
      }
    }
    response.data = result;
    return response;
  }
}
