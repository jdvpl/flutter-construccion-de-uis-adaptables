import 'package:api_rest_ui/api/authentication_api.dart';
import 'package:api_rest_ui/helpers/http.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

abstract class DependencyInjection {
  static void initialize() {
    final Dio dio = Dio(BaseOptions(
        baseUrl: 'https://backend-flutter-jdvpl.herokuapp.com/api/v1'));
    final Logger logger = Logger();
    Http http = Http(dio: dio, logger: logger, logsEnabled: true);
    final AuthenticationAPI authenticationAPI = AuthenticationAPI(http);
    GetIt.instance.registerSingleton<AuthenticationAPI>(authenticationAPI);
  }
}
