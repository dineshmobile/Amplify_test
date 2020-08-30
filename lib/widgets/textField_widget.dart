import 'package:flutter/material.dart';
import 'package:flutter_amplify_test/utils/styles.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode, nextFocusNode;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String hint; 
  final bool obscureText;
  final int maxLines;
  final String validator;

  const TextFieldWidget(
      {Key key,
        this.controller,
        this.focusNode,
        this.nextFocusNode,
        this.textCapitalization,
        this.textInputAction,
        this.keyboardType,
        this.hint,
        this.obscureText = false,
        this.maxLines = 1,
        this.validator

      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5),
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            textCapitalization: textCapitalization,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: maxLines,
            onFieldSubmitted: (val) =>
                FocusScope.of(context).requestFocus(nextFocusNode),
            style: Styles.regular(fontSize: 14),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true,
              hintText: '$hint',
              hintStyle: Styles.regular(fontSize: 14, color: Colors.grey),
            ),
            buildCounter: (BuildContext context,
                {int currentLength, int maxLength, bool isFocused}) =>
            null,
          ),
        ],
      ),
    );
  }
}
