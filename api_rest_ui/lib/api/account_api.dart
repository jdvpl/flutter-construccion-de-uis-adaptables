import 'package:api_rest_ui/data/authentication_client.dart';
import 'package:api_rest_ui/helpers/http.dart';
import 'package:api_rest_ui/helpers/http_response.dart';
import 'package:api_rest_ui/models/user.dart';

class AccountAPI {
  final Http _http;
  final AuthenticationClient _authenticationClient;

  AccountAPI(this._http, this._authenticationClient);

  Future<HttpResponse<User>> getUserInfo() async {
    final token = await _authenticationClient.accessToken;
    return _http.request<User>('/user-info', headers: {"token": token},
        parser: (data) {
      return User.fromJson(data);
    });
  }
}
