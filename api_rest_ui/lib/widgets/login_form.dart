import 'dart:ui';

import 'package:api_rest_ui/utils/responsive.dart';
import 'package:api_rest_ui/widgets/input_text.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 4300 : 360,
        ),
        child: Column(
          children: [
            InputText(
              keyboardType: TextInputType.emailAddress,
              label: "CORREO ELECTRONICO",
              fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.5),
            ),
            SizedBox(
              height: responsive.dp(2),
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
                      fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.5),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    onPressed: () {},
                    child: Text(
                      "Olvido Contraseña",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: responsive.dp(1.5)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: responsive.dp(5),
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 15),
                color: Colors.pinkAccent,
                onPressed: () {},
                child: Text(
                  "Iniciar Sesion",
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
                  "¿No tienes cuenta?",
                  style: TextStyle(fontSize: responsive.dp(1.5)),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Registrarme",
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
    );
  }
}
