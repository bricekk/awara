import 'package:flutter/material.dart';

class CustomCheckBoxWidget extends StatefulWidget {

  const CustomCheckBoxWidget({Key? key}) : super(key: key);

  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();
}

class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {

  bool isChecked = true;

  @override
  Widget build(BuildContext context) {

    Color getColor(Set<MaterialState> states) {

      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Theme.of(context).primaryColor;
    }

    return Checkbox(
        value: isChecked,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        onChanged: (bool? value){
          setState((){
            isChecked = !isChecked;
          });
        });
  }
}
