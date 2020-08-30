import 'package:flutter/material.dart';
import 'package:flutter_amplify_test/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  ButtonWidget({@required this.buttonName, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 325,
      height: 42,
      child: RaisedButton(
        textColor: Colors.black,
        color: buttonColor,
        onPressed: onPressed,
        child: new Text("$buttonName"),

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: buttonColor)
        ),
      ),
    );
  }
}








