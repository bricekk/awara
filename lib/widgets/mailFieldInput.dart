import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class MailFieldInput extends StatefulWidget {
  final TextEditingController? mailController;

  const MailFieldInput({Key? key, this.mailController}) : super(key: key);

  @override
  State<MailFieldInput> createState() => _MailFieldInputState();
}

class _MailFieldInputState extends State<MailFieldInput> {

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
        onEditingComplete: (){
          TextInputAction.next;
        },
        controller: widget.mailController,
        cursorColor: Colors.grey,
        cursorHeight: 20,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.email,
            color: Colors.grey.shade500,
          ),
          contentPadding: const EdgeInsets.only(bottom: 13),
          labelText: "Email",
          labelStyle: TextStyle(color: Colors.grey.shade600),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
