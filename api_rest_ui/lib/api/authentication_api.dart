import 'package:api_rest_ui/helpers/http.dart';
import 'package:api_rest_ui/helpers/http_response.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationAPI {
  final Http _http;

  AuthenticationAPI(this._http);

  Future<HttpResponse> register(
      {@required String username,
      @required String email,
      @required String password}) {
    return _http.request(
      '/register',
      method: "POST",
      data: {
        'username': username,
        'email': email,
        'password': password,
      },
    );
  }

  Future<HttpResponse> login({
    @required String email,
    @required String password,
  }) {
    return _http.request(
      '/login',
      method: "POST",
      data: {
        'email': email,
        'password': password,
      },
    );
  }
}
