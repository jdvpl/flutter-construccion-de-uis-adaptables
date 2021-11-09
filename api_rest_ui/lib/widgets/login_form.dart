import 'dart:ui';

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
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black26,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: InputText(
                    label: "CONTRASEÑA",
                    obsucreText: true,
                    borderEnabled: false,
                  ),
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  onPressed: () {},
                  child: Text(
                    "Olvido Contraseña",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
