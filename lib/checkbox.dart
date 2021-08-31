import 'package:flutter/material.dart';
import 'styling/colors.dart';

class myCheckbox extends StatefulWidget {
  myCheckbox({Key? key}) : super(key: key);

  @override
  _myCheckboxState createState() => _myCheckboxState();
}

class _myCheckboxState extends State<myCheckbox> {
  static const color = AppColors();
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: color.mainBlue,
        value: rememberMe,
        onChanged: (value) => setState(
              () => rememberMe = value!,
            ));
  }
}
