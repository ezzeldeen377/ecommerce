import 'package:dio/dio.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
  }
  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? headers}) {
    return dio.get(EndPoint.baseUrl + endPoint,
        options: Options(
          headers: headers,
            validateStatus: ((status) => true)));
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? data}) {
    return dio.post(EndPoint.baseUrl+endPoint,
        data: data,
        options: Options(headers: headers,validateStatus: ((status) => true)));
  }

  Future<Response> deleteData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? data}) {
    return dio.delete(EndPoint.baseUrl+endPoint,
        data: data,
        options: Options(headers: headers,validateStatus: ((status) => true)));
  }

  Future<Response> updateData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? data}) {
    return dio.put(EndPoint.baseUrl+endPoint,
        data: data,
        options: Options(headers: headers,validateStatus: ((status) => true)));
  }
}
