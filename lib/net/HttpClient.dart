import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starbark/utils/aes_util.dart';
import 'package:starbark/utils/dialog_util.dart';
import 'package:starbark/utils/string_util.dart';
import '../utils/log_util.dart';
import 'dart:convert' as convert;

HttpManager httpManager = HttpManager();
class HttpManager {
  ///超时时间
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;

  static const String TAG = "HttpManager";

  static HttpManager _instance = HttpManager._internal();

  factory HttpManager() => _instance;

  Dio _dio;

  HttpManager._internal() {
    if (_dio == null) {
      // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
      BaseOptions options = new BaseOptions(
        connectTimeout: CONNECT_TIMEOUT,

        // 响应流上前后两次接受到数据的间隔，单位为毫秒。
        receiveTimeout: RECEIVE_TIMEOUT,

        // Http请求头.
        headers: {},
      );

      _dio = new Dio(options);
    }
  }

  ///初始化公共属性
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [interceptors] 基础拦截器
  void init(
      {String baseUrl,
      int connectTimeout,
      int receiveTimeout,
      List<Interceptor> interceptors}) {
    _dio.options = _dio.options.merge(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      _dio.interceptors..addAll(interceptors);
    }
  }

  Future post(String url,
      {FormData formData,
      Map<String, dynamic> queryParameters,
      bool isSHowLoading = false,
      BuildContext context,
      String loadingText}) async {
    Response response;

    //加密queryParameters
    var params = AESUtil.walletEncode(convert.jsonEncode(queryParameters));

    //loading
    if (isSHowLoading) {
      DialogUtil.showLoading(context, loadingText);
    }

    try {
      if (formData != null) {
        response = await _dio.post(url, data: formData);
      } else if (queryParameters != null) {
        response = await _dio.post(url, queryParameters: params);
      } else {
        response = await _dio.post(url);
      }

      //隐藏loading
      DialogUtil.disMissLoadingDialog(isSHowLoading, context);

      //json 数据
      //LogUtil.d(response.toString());
      var data = response.data['data'];
      var code = response.data['code'];
      var sign = response.data['sign'];

      if (!StringUtils.isNullOrEmpty(code)) {
        //这里直接把data部分给搞出来,免得每次在外面去解析˛
        //解密
        var responseData = AESUtil.walletDecode(data,sign);
        return responseData;
      } else {
        String data = response.data["msg"];
        DialogUtil.showToast(msg: data);
        LogUtil.d(TAG, "$data");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        LogUtil.d(TAG, e.response.headers.toString());
        LogUtil.d(TAG, e.response.request.toString());
      } else {
        LogUtil.d(TAG, e.request.toString());
      }

      //ToolUtils.showToast(msg: handleError(e));
      DialogUtil.disMissLoadingDialog(isSHowLoading, context);
      return null;
    }
  }
}
