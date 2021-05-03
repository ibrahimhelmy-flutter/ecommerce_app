import 'package:ecommerce_app/constanse.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomElevatedButton({Key key, this.text = "", this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
        alignment: Alignment.center,
      ),
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ))),
    );
  }
}
