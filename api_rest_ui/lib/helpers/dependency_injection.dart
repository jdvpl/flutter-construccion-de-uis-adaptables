import 'package:api_rest_ui/api/account_api.dart';
import 'package:api_rest_ui/api/authentication_api.dart';
import 'package:api_rest_ui/data/authentication_client.dart';
import 'package:api_rest_ui/helpers/http.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

abstract class DependencyInjection {
  static void initialize() {
    final Dio dio = Dio(BaseOptions(
        baseUrl: 'https://backend-flutter-jdvpl.herokuapp.com/api/v1'));
    final Logger logger = Logger();
    Http http = Http(dio: dio, logger: logger, logsEnabled: true);

    final secureStorage = FlutterSecureStorage();
    final authenticationAPI = AuthenticationAPI(http);
    final authenticationClient = AuthenticationClient(secureStorage);
    final accountAPI =
        AccountAPI(http, authenticationClient); // registro de las dependencies
    GetIt.instance.registerSingleton<AuthenticationAPI>(authenticationAPI);
    GetIt.instance
        .registerSingleton<AuthenticationClient>(authenticationClient);
    GetIt.instance.registerSingleton<AccountAPI>(accountAPI);
  }
}
