import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obsucreText;
  const InputText({
    Key key,
    this.label = "",
    this.keyboardType = TextInputType.text,
    this.obsucreText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboardType,
      obscureText: this.obsucreText,
      decoration: InputDecoration(
        labelText: this.label,
        labelStyle: TextStyle(
          color: Colors.black26,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
