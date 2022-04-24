import 'package:api_rest_ui/helpers/http_response.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationAPI {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<HttpResponse> register(
      {@required String username,
      @required String email,
      @required String password}) async {
    try {
      final Response response = await _dio
          .post('https://backend-flutter-jdvpl.herokuapp.com/api/v1/register',
              // es opcional ya lo tiene por defecto
              // options: Options(
              //   headers: {
              //     'Content-Type': 'application/json',
              //   },
              // ),
              data: {
            'username': username,
            'email': email,
            'password': password,
          });
      _logger.i(response.data);
      return HttpResponse.succes(response.data);
    } catch (e) {
      _logger.e(e);
      int statusCode = -1;
      String message = "Unknown error";
      dynamic data;

      if (e is DioError) {
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

  Future<HttpResponse> login(
      {@required String email, @required String password}) async {
    try {
      final Response response = await _dio.post(
          'https://backend-flutter-jdvpl.herokuapp.com/api/v1/login',
          data: {
            'email': email,
            'password': password,
          });
      _logger.i(response.data);
      return HttpResponse.succes(response.data);
    } catch (e) {
      _logger.e(e);
      int statusCode = -1;
      String message = "Unknown error";
      dynamic data;

      if (e is DioError) {
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
