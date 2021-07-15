import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class CheckboxContainer extends StatefulWidget {
  final ValueChanged<bool?>? changed;

  const CheckboxContainer({
  Key? key,
    this.changed
  }) : super(key: key);

  @override
  State<CheckboxContainer> createState() => CheckboxContainerState();
}

/// This is the private State class that goes with MyStatefulWidget.
class CheckboxContainerState extends State<CheckboxContainer> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: widget.changed,
    );
  }
}