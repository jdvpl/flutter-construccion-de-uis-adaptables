import 'package:api_rest_ui/helpers/http_response.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart' show required;

class Http {
  Dio _dio;
  Logger _logger;
  bool _logsEnabled;

  Http({
    @required Dio dio,
    @required Logger logger,
    @required bool logsEnabled,
  }) {
    _dio = dio;
    _logger = logger;
    _logsEnabled = logsEnabled;
  }

  Future<HttpResponse<T>> request<T>(
    String path, {
    String method = "GET",
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> data,
    Map<String, String> headers,
    T Function(dynamic data) parser,
  }) async {
    try {
      final Response response = await _dio.request(path,
          options: Options(
            method: method,
            headers: headers,
          ),
          queryParameters: queryParameters,
          data: data);
      _logger.i(response.data);
      if (parser != null) {
        return HttpResponse.succes<T>(parser(response.data));
      }
      return HttpResponse.succes<T>(response.data);
    } catch (e) {
      _logger.e(e);
      int statusCode = 0;
      String message = "Unknown error";
      dynamic data;

      if (e is DioError) {
        statusCode = -1;
        message = e.message;
        if (e.response != null) {
          statusCode = e.response.statusCode;
          message = e.response.statusMessage;
          data = e.response.data;
        }
      }
      return HttpResponse.fail(
          statusCode: statusCode, message: message, data: data);
    }
  }
}
