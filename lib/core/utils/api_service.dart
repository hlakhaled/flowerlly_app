import 'package:dio/dio.dart';

class ApiService {
  Dio _dio;
  final String baseUrl = "https://perenual.com/api/";
  ApiService(this._dio);

  get({required String endPoint}) async {
    var response = await _dio.get("$baseUrl$endPoint");
    return response.data;
  }
}
