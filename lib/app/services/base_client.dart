import 'dart:io';
import 'package:dio/dio.dart';
import 'package:diwanapp/app/env/environnments.dart';
import 'package:diwanapp/app/helpers/shared_preferences.dart';
import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio dio() {
  Dio dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: false,
    requestBody: false,
    responseBody: true,
    responseHeader: false,
    compact: false,
  ));

  String token = '';

  SharedData.getFromStorage('token', 'string').then((value) {
    if (value != null) {
      print('TOKEN ==== $token');
      token = value;
    }
  });

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) {
        options.headers.addAll({
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          HttpHeaders.acceptHeader: 'application/json',
        });
        if (token != '') {
          options.headers.addAll({
            HttpHeaders.authorizationHeader: 'Bearer $token',
          });
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        if (e.type == DioErrorType.unknown) {
          Get.snackbar(
            'Server Error',
            'Something wrong please try again',
            colorText: Colors.white,
            backgroundColor: Colors.red,
          );
          Get.toNamed(AppRoutes.connectivity);
        }
        return handler.next(e);
      },
    ),
  );

  dio.options.baseUrl = AppEnvironnments.baseUrl;

  return dio;
}
