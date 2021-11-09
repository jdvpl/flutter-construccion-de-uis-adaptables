import 'package:api_rest_ui/widgets/input_text.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 20,
      left: 20,
      child: Column(
        children: [
          InputText(
            keyboardType: TextInputType.emailAddress,
            label: "CORREO ELECTRONICO",
          ),
          InputText(
            label: "CONTRASEÑA",
            obsucreText: true,
          ),
        ],
      ),
    );
  }
}
