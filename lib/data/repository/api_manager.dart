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
      {Map<String, dynamic>? queryParameters}) {
    return dio.get(EndPoint.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(validateStatus: ((status) => true)));
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? data}) {
    return dio.post(EndPoint.baseUrl+endPoint,
        queryParameters: queryParameters,
        data: data,
        options: Options(validateStatus: ((status) => true)));
  }
}
