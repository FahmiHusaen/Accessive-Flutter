import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/TextFieldContainer.dart';
import 'package:flutter_appbb/Components/Constants.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        //cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
