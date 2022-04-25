import 'package:api_rest_ui/api/account_api.dart';
import 'package:api_rest_ui/data/authentication_client.dart';
import 'package:api_rest_ui/models/user.dart';
import 'package:api_rest_ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _authenticationClient = GetIt.instance<AuthenticationClient>();
  final _accountApi = GetIt.instance<AccountAPI>();
  User _user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUser();
    });
  }

  Future<void> _signOut() async {
    await _authenticationClient.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (_) => false);
  }

  Future<void> _loadUser() async {
    final response = await _accountApi.getUserInfo();
    if (response.data != null) {
      print("###User####");

      _user = response.data;
      print(response.data.email);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_user == null) CircularProgressIndicator(),
            if (_user != null)
              Column(
                children: [
                  Text(_user.id),
                  Text(_user.username),
                  Text(_user.email),
                  Text(_user.createdAt.toIso8601String()),
                ],
              ),
            FlatButton(
              onPressed: _signOut,
              child: Text("Sign Out"),
            )
          ],
        ),
      ),
    );
  }
}
