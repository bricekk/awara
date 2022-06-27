import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;

  const PasswordInputField({Key? key, this.label, this.controller})
      : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _isObscure = true;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(width: 1, color: Colors.grey.shade400),
                  bottom: BorderSide(width: 1, color: !isError?Colors.grey.shade400:Colors.red))),
          child: TextFormField(
            validator: (value){
              if(value?.trim() == null || (value?.trim())!.isEmpty){
                setState((){
                  isError = true;
                });
              }else{
                setState((){
                  isError = false;
                });
              }
              return null;
            },
            controller: widget.controller,
            cursorColor: Colors.grey,
            cursorHeight: 20,
            obscureText: _isObscure,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 10),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                child: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey.shade500,
                ),
              ),
              labelText: widget.label ?? "Mot de passe",
              labelStyle: TextStyle(
                color: Colors.grey.shade600,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
    ;
  }
}
