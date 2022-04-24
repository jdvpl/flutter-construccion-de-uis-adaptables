import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationAPI {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<void> register(
      {@required String username,
      @required String email,
      @required String password}) async {
    try {
      final Response response = await _dio
          .post('https://backend-flutter-jdvpl.herokuapp.com/api/v1/register',
              // es opcional ya lo tiene por defecto
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                },
              ),
              data: {
            'username': username,
            'email': email,
            'password': password,
          });

      _logger.i(response.data);
    } catch (e) {
      _logger.e(e);
    }
  }
}
