import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imagename;
  final Function onPreseed;

  const CustomButtonSocial({Key key, this.text, this.imagename, this.onPreseed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPreseed,
      child: Row(
        children: [
          Image.asset(
            imagename,
            scale: 2,
          ),
          SizedBox(
            width: 20.0,
          ),
          CustomText(
            text: text,
            alignment: Alignment.center,
          ),
        ],
      ),
      style: ButtonStyle(
          // padding: MaterialStateProperty.all<EdgeInsets>(
          //     EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[100]),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ))),
    );
  }
}
