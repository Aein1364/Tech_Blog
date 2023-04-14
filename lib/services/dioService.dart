// ignore_for_file: file_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_tec/components/storageConst.dart';

class Dioservice {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      log(response.data.toString());
      return response;
    }).catchError((error) async {
      if (error is DioError) {
        log(error.response.toString());
      }
      return await error;
    });
  }

  Future<dynamic> postMethod(String url, Map<String, dynamic> map) async {
    dio.options.headers['content-type'] = 'application/json';
    var token = GetStorage().read(StorageConst.token);
    if (token != null) {
      dio.options.headers['Authorization'] = '$token';
    }
    return await dio
        .post(url,
            data: FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((response) {
      log(response.data.toString());
      return response;
    }).catchError((error) async {
      if (error is DioError) {
        log(error.response.toString());
      }
      return await error;
    });
  }
}
