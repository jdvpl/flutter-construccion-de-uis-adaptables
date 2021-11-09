import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obsucreText, borderEnabled;
  final double fontSize;
  const InputText(
      {Key key,
      this.label = "",
      this.keyboardType = TextInputType.text,
      this.obsucreText = false,
      this.borderEnabled = true,
      this.fontSize = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboardType,
      obscureText: this.obsucreText,
      style: TextStyle(fontSize: this.fontSize),
      decoration: InputDecoration(
        enabledBorder: this.borderEnabled
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              )
            : InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        labelText: this.label,
        labelStyle: TextStyle(
          color: Colors.black26,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
