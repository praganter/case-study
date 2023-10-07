import 'package:case_study/core/api/api_constants.dart';
import 'package:dio/dio.dart';

class HttpManager {
  static final Dio _dio = Dio();
  static final Map<String, dynamic> _headers = {"X-Api-Key": ApiConstants.apiKey};

  static Future<dynamic> get(Map<String, dynamic> params) async {
    try {
      Response response =
          await _dio.get(ApiConstants.baseUrl, queryParameters: params, options: Options(headers: _headers));
      return response.data;
    } catch (e) {
      _catchError();
    }
  }

  static _catchError() {}
}
