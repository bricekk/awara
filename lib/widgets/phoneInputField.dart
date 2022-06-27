import 'package:flutter/material.dart';

class PhoneInputField extends StatefulWidget {
  final TextEditingController? phoneController;

  PhoneInputField({Key? key, this.phoneController}) : super(key: key);

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }


  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(width: 1, color: Colors.grey.shade400),
              bottom: BorderSide(width: 1, color: !isError?Colors.grey.shade400:Colors.red))),
      child: TextFormField(
        validator: (value){
          if(value?.trim() == null || (value?.trim())!.isEmpty || !isNumeric(value!)){
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
        controller: widget.phoneController,
        cursorColor: Colors.grey,
        cursorHeight: 20,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.phone,
            color: Colors.grey.shade500,
          ),
          contentPadding: const EdgeInsets.only(bottom: 13),
          labelText: "Numéro de téléphone",
          labelStyle: TextStyle(color: Colors.grey.shade600),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
