// @dart=2.9
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:api_sample_flutter/connections/rest_api_client.dart';
import 'package:api_sample_flutter/utils/constants.dart';

class Injector {
  static final Injector _singleton = Injector._internal();
  static final dio = Dio();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  RestApiClient getClient() {
    // dio.options.connectTimeout = 10000;
    // dio.options.receiveTimeout = 3000;
    dio.options.followRedirects = false;
    dio.options.headers["Content-Type"] = "application/json";
    // String token = SharedPreferenceHelper().getUserToken();
    // if (token != null) {
    //   print("token=" + token);
    //   int userId = SharedPreferenceHelper().getUserId();
    //   if (userId != null) {
    //     print("userId=" + userId.toString());
    //   }
    //   dio.options.headers["x-access-token"] = token;
    //   dio.options.headers["Content-Type"] = "application/json";
    // }
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.interceptors.clear();
    dio.interceptors.add(LoggingInterceptors());
    final client = RestApiClient(dio, baseUrl: Constants.API_URL);
    return client;
  }
}

class LoggingInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print("--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    print(
        "<-- ${dioError.message} ${(dioError.response?.requestOptions != null ?
        (dioError.response.requestOptions.baseUrl + dioError.response.requestOptions.path) : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response.data : 'Unknown Error'}");
    print("<-- End error");
    //Manually changed
    // if(dioError.response.statusCode==403)
    //   MyApp.startFirstScreen(dioError.response.data["message"]);
    // else if(dioError.response.statusCode==402)
    //   MyApp.startFirstScreen(dioError.response.data["message"]);
    // else if(dioError.response.statusCode==401)
    //   MyApp.startFirstScreen(dioError.response.data["message"]);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "<-- ${response.statusCode} ${(response.requestOptions != null ?
        (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    print("Headers:");
    response.headers?.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response, handler);
  }
}