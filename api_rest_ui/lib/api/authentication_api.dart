import 'package:api_rest_ui/helpers/http.dart';
import 'package:api_rest_ui/helpers/http_response.dart';
import 'package:api_rest_ui/models/authentication_response.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationAPI {
  final Http _http;

  AuthenticationAPI(this._http);

  Future<HttpResponse<AuthenticationResponse>> register(
      {@required String username,
      @required String email,
      @required String password}) {
    return _http.request<AuthenticationResponse>(
      '/register',
      method: "POST",
      data: {
        'username': username,
        'email': email,
        'password': password,
      },
      parser: (data) {
        return AuthenticationResponse.fromJson(data);
      },
    );
  }

  Future<HttpResponse<AuthenticationResponse>> login({
    @required String email,
    @required String password,
  }) {
    return _http.request<AuthenticationResponse>(
      '/login',
      method: "POST",
      data: {
        'email': email,
        'password': password,
      },
      parser: (data) {
        return AuthenticationResponse.fromJson(data);
      },
    );
  }
}
