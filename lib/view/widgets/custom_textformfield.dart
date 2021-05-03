import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  final Function onSaved;
  final Function validator;
  final bool obscureText;

  const CustomTextFormField(
      {Key key,
      this.obscureText = false,
      this.label,
      this.textInputType = TextInputType.text,
      this.onSaved,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: textInputType,
      onSaved: onSaved,
      validator: validator,
      obscureText: obscureText,
    );
  }
}
