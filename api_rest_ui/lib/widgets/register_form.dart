import 'dart:convert';
import 'dart:ui';

import 'package:api_rest_ui/api/authentication_api.dart';
import 'package:api_rest_ui/data/authentication_client.dart';
import 'package:api_rest_ui/utils/dialogs.dart';
import 'package:api_rest_ui/utils/responsive.dart';
import 'package:api_rest_ui/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _authenticationClient = GetIt.instance<AuthenticationClient>();
  final _authenticationAPI = GetIt.instance<AuthenticationAPI>();

  GlobalKey<FormState> _formKey = GlobalKey();

  String _username = "", _email = "", _password = "";

  Future<void> _submit() async {
    bool isOk = _formKey.currentState.validate();
    if (isOk) {
      ProgressDialog.show(context);
      final response = await _authenticationAPI.register(
        username: _username,
        email: _email,
        password: _password,
      );
      ProgressDialog.dismiss(context);

      if (response.data != null) {
        await _authenticationClient.saveSession(response.data);
        Navigator.pushNamedAndRemoveUntil(context, 'home', (_) => false);
      } else {
        print("Register code ${response.error.statusCode}");
        print("Register data ${response.error.data}");
        print("Register message ${response.error.message}");

        String message = response.error.message;
        if (response.error.statusCode == -1) {
          message = "Network conection fail";
        } else if (response.error.statusCode == 409) {
          message =
              "Duplicated user ${jsonEncode(response.error.data['duplicatedFields'])}";
        }
        Dialogs.alert(context, title: "Error", message: message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 430 : 360,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "USERNAME",
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  _username = text;
                },
                validator: (text) {
                  if (text.trim().length < 5) {
                    return "Invalid username";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "EMAIL",
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  if (!text.contains("@")) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              InputText(
                obsucreText: true,
                keyboardType: TextInputType.emailAddress,
                label: "PASSWORD",
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  _password = text;
                },
                validator: (text) {
                  if (text.trim().length < 6) {
                    return "Invalid password";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: responsive.dp(5),
              ),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: Colors.pinkAccent,
                  onPressed: this._submit,
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: responsive.dp(1.5)),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: responsive.dp(1.5),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: responsive.dp(14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
