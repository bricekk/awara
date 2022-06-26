import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationInputField extends StatefulWidget {

  final String fieldName;
  final bool required;
  final String type;
  final TextEditingController? controller;


  const RegistrationInputField({Key? key,
    required this.fieldName,
    required this.required,
    required this.type, this.controller}) : super(key: key);

  @override
  State<RegistrationInputField> createState() => _RegistrationInputFieldState();
}

class _RegistrationInputFieldState extends State<RegistrationInputField> {

  @override
  Widget build(BuildContext context) {

    bool isObscure = false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          padding: const EdgeInsets.only(left: 10),
          decoration:  BoxDecoration(

            border: Border(
              left: BorderSide(width: 1, color: Colors.grey.shade400),
              bottom: BorderSide(width: 1, color: Colors.grey.shade400)
            )
          ),
          child: TextFormField(
            controller: widget.controller,
            cursorColor: Colors.grey,
            cursorHeight: 20,
            obscureText: isObscure,
            keyboardType: widget.type=="number"?TextInputType.number:TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 13),
              labelText: widget.fieldName,
              labelStyle: TextStyle(
                color: Colors.grey.shade600
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

