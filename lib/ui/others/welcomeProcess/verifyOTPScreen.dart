import 'package:awara/ui/homePage/homePage.dart';
import 'package:awara/ui/others/welcomeProcess/aboutPage.dart';
import 'package:awara/viewPage.dart';
import 'package:awara/widgets/pswdInputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyOTPScreen extends StatefulWidget {
  final String verificationID;
  final String phoneNumber;

  const VerifyOTPScreen(
      {Key? key, required this.verificationID, required this.phoneNumber})
      : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {


  TextEditingController OTPcontroller = TextEditingController();
  TextEditingController _digit1 = TextEditingController();
  TextEditingController _digit2 = TextEditingController();
  TextEditingController _digit3 = TextEditingController();
  TextEditingController _digit4 = TextEditingController();
  TextEditingController _digit5 = TextEditingController();
  TextEditingController _digit6 = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    String hideNumber =
        widget.phoneNumber.split("+237")[1].replaceRange(3, 7, "*****");

    return (FirebaseAuth.instance.currentUser == null)
        ? Scaffold(
            backgroundColor: Colors.red.shade900,
            resizeToAvoidBottomInset: true,
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 50, left: 20, right: 20,bottom: 0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Code de verification",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Nous avons envoyé un code au ${hideNumber}",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DigitField(
                            digitController: _digit1,
                          ),
                          DigitField(digitController: _digit2),
                          DigitField(digitController: _digit3),
                          DigitField(digitController: _digit4),
                          DigitField(digitController: _digit5),
                          DigitField(digitController: _digit6),

                        ],
                      ),
                      const SizedBox(height: 50,),
                      Center(
                        child: Text(
                          "Demander un nouveau code dans 1:00",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 170,),
                      SizedBox(
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.white
                                      )
                                    ),
                                    child: const Center(
                                      child:
                                      Text(
                                          "Réenvoyer le code",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),)
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: verifyOTP,
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: Colors.red.shade900
                                        ),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                        child:
                                        Text(
                                          "Confirmer",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.red.shade900,
                                          ),)
                                    ),
                                  ),
                                )

                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : AboutPage();
  }

  void verifyOTP() async {

    String otp = _digit1.text.trim() +
        _digit2.text.trim() +
        _digit3.text.trim() +
        _digit4.text.trim() +
        _digit5.text.trim() +
        _digit6.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationID,
      smsCode: otp,
    );

    _formKey.currentState!.validate();

    if(otp.isNotEmpty && otp.length>5 && _formKey.currentState!.validate()){

      try {
        await FirebaseAuth.instance.signInWithCredential(credential);
        if (FirebaseAuth.instance != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const ViewPage()));
        }
      } on FirebaseAuthException catch (excpt) {
          if(excpt.code.toString()=="invalid-verification-code" && otp.length>5){
            Fluttertoast.showToast(
                msg: "ce code ne correspond pas a celui envoye",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Colors.red.shade900,
                fontSize: 16.0
            );
      }
    }
    }
  }
}

class DigitField extends StatelessWidget {
  final TextEditingController digitController;

  const DigitField({Key? key, required this.digitController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 53,
      child: TextFormField(
        controller: digitController,
        keyboardType: TextInputType.number,
        validator: (value){
          if(value!.isEmpty){
            Fluttertoast.showToast(
                msg: "Code à 6 chiffres",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Colors.red.shade900,
                fontSize: 16.0
            );
          }
          return null;
        },
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2, color: Colors.red)),
            counterText: "",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 2, color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 29, color: Colors.white),
      ),
    );
  }
}
