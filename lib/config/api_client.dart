import 'package:crud_app/utilities/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../utilities/constant.dart' as constant;

class ApiClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: constant.baseApiUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ),
  );

  Future<void> getRequest({required String endPath, required ValueChanged<Response> onSuccessHandler}) async {
    await _handleRequest(() => _dio.get("${constant.baseApiUrl}/$endPath"), onSuccessHandler);
  }

  Future<void> postRequest({required String endPath, required Map<String, dynamic> data, required ValueChanged<Response> onSuccessHandler}) async {
    await _handleRequest(() => _dio.post("${constant.baseApiUrl}/$endPath", data: data), onSuccessHandler);
  }

  Future<void> putRequest({required String endPath, required Map<String, dynamic> data, required ValueChanged<Response> onSuccessHandler}) async {
    await _handleRequest(() => _dio.put("${constant.baseApiUrl}/$endPath", data: data), onSuccessHandler);
  }

  Future<void> deleteRequest({required String endPath, required ValueChanged<Response> onSuccessHandler}) async {
    await _handleRequest(() => _dio.delete("${constant.baseApiUrl}/$endPath"), onSuccessHandler);
  }

  Future<void> _handleRequest(Future<Response> Function() request, ValueChanged<Response> onSuccessHandler) async {
    constant.isCommonApiLoader.value = true;
    try {
      final response = await request();
      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccessHandler(response);
      } else {
        "Something went wrong!".toShowSnackBar();
      }
    } catch (e) {
      "$e".toShowSnackBar();
    } finally {
      constant.isCommonApiLoader.value = false;
    }
  }
}
