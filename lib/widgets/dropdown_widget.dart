import 'package:flutter/material.dart';

class DropdownList extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final String value;
  final ValueChanged onChanged;
  final String text, hint;

  DropdownList(
      {@required this.items,
        @required this.value,
        @required this.onChanged,
        this.hint = '',
        @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          textAlign: TextAlign.left,
        ),
        Container(
          height: 40,
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              items: items,
              hint: Text('$hint'),
              onChanged: onChanged,
              value: value,
            ),
          ),
        ),
      ],
    );
  }
}
