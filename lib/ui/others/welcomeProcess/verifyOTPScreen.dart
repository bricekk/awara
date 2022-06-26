import 'package:awara/ui/homePage/homePage.dart';
import 'package:awara/viewPage.dart';
import 'package:awara/widgets/pswdInputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOTPScreen extends StatefulWidget {

  final String verificationID;

  const VerifyOTPScreen({Key? key, required this.verificationID}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {

  TextEditingController OTPcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Center(
                child: PasswordInputField(
                  fieldName: 'OTP',
                  controller: OTPcontroller,
                ),
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 200,
                  child: MaterialButton(
                    onPressed: verifyOTP,
                    child: Text("Verify"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void verifyOTP() async {
    String otp = OTPcontroller.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationID,
      smsCode: otp,
    );

    try{
      FirebaseAuth.instance.signInWithCredential(credential);
      if(FirebaseAuth.instance != null){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> const ViewPage()));
      }
    } on FirebaseAuthException catch(excpt){
      print(excpt.code.toString());
    }

  }
}
