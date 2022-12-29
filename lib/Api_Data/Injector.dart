import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:pagination/Api_Data/shared/data_response.dart';

import 'api_provider/api_constants.dart';

class Injector {
  static final Injector _singleton = Injector._internal();
  static final _dio = Dio();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  Dio getDio() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 180000, connectTimeout: 180000);
    _dio.options = options;
    _dio.options.followRedirects = false;
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.headers["secret_key"] =
        "sk_uOdw3weLhiLhmf1weybQe8TyTW6Z0A3LXV94od5+9+lTcqcwtaAFvEvNt61SWw==";
    _dio.options.headers["publish_key"] =
        "pk_0DVSHoP9XjVhvOW309OWJF6RAqP0ZO5D3C1sHAeqFILkY6uQjbafTQ+HxO/elsE=";
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.clear();
    _dio.interceptors.add(LoggingInterceptors());
    return _dio;
  }

  static Options? getHeaderToken() {
    String? token =
        "8e7c0db0b76e0e6ac9bb3ec4f4469660fc5b018b37ac9a24b6b0dc5e524d51aa8c026a8c16065e35778451e728943e2f1b777b92228d09cc1f713453632b462909cd91cc76836a43b997985f7e86c696271dd924e35a4165814e55e7868a0aa41277926b0317dbaf2a058c2e8ca9842f1f5b5af76eb6a5e2c5854649bac0ca2e529fca77f7c7243be1b37e327d5cb1be2a64000ace2d789afc1e0263508d239e";
    if (token != null) {
      print("token=" + token);
      String? userId = "126";
      if (userId != null) {
        print("userId=" + userId.toString());
      }
      var headerOptions = Options(headers: {
        'Authorization': 'Bearer $token',
      });
      return headerOptions;
    } else {
      var headerOptions =
          Options(headers: {'security_key':"sk_uOdw3weLhiLhmf1weybQe8TyTW6Z0A3LXV94od5+9+lTcqcwtaAFvEvNt61SWw=="});
      return headerOptions;
    }
  }
}

class LoggingInterceptors extends Interceptor {
  String printObject(Object object) {
    // Encode your object and then decode your object to Map variable
    Map jsonMapped = json.decode(json.encode(object));

    // Using JsonEncoder for spacing
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');

    // encode it to string
    String prettyPrint = encoder.convert(jsonMapped);
    return prettyPrint;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
        "--> ${options.method.toUpperCase()} ${"" + (options.baseUrl) + (options.path)}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    print("queryParameters:");
    options.queryParameters.forEach((k, v) => print('$k: $v'));
    if (options.data != null) {
      try {
        // print("Body: ${printObject(options.data)}");
        FormData formData = options.data as FormData;
        print("Body:");
        var buffer = [];
        for (MapEntry<String, String> pair in formData.fields) {
          buffer.add(pair.key + ':' + pair.value);
        }
        print("Body:{${buffer.join(', ')}}");
      } catch (e) {
        print("Body: ${printObject(options.data)}");
      }
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    print(
        "<-- ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path) : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response!.data : 'Unknown Error'}");
    print("<-- End error");
    if (dioError.response!.statusCode == 401) {
      var errorModel =
          DataResponse.fromJson(dioError.response!.data, (data) => null);
      return;
    }
    return super.onError(dioError, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    print("Headers:");
    response.headers.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response, handler);
  }
}
