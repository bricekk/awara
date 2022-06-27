import 'package:awara/viewPage.dart';
import 'package:awara/widgets/checkBox.dart';
import 'package:awara/widgets/mailFieldInput.dart';
import 'package:awara/widgets/phoneInputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../widgets/pswdInputField.dart';
import 'verifyOTPScreen.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ViewPage();
          } else {
            print("no such user");
            return const LoginPageCustom();
          }
        },
      ),
    );
  }
}

class LoginPageCustom extends StatefulWidget {
  const LoginPageCustom({Key? key}) : super(key: key);

  @override
  State<LoginPageCustom> createState() => _LoginPageCustomState();
}


class _LoginPageCustomState extends State<LoginPageCustom> {

  bool isNumber = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 30, bottom: 30),
                      height: 120,
                      width: 120,
                      child: Image.asset("assets/food.png")),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isNumber = !isNumber;
                              });
                            },
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: isNumber
                                      ? Colors.grey
                                      : Theme.of(context).primaryColor),
                            ),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isNumber = !isNumber;
                              });
                            },
                            child: Text(
                              "Numero",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: !isNumber
                                      ? Colors.grey
                                      : Theme.of(context).primaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            !isNumber ? WithMail() : WithPhoneNumber(),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Mot de passe oublié?",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "-Ou continuez avec-",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: FaIcon(FontAwesomeIcons.twitter,
                              size: 35, color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(width: 50),
                        GestureDetector(
                          onTap: () {},
                          child: FaIcon(
                            FontAwesomeIcons.google,
                            size: 35,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Vous n'avez pas de compte?",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          " Creer un compte",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WithMail extends StatefulWidget {
  const WithMail({Key? key}) : super(key: key);

  @override
  State<WithMail> createState() => _WithMailState();
}

class _WithMailState extends State<WithMail> {

  TextEditingController controller = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    controller.dispose();
    pwdController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          MailFieldInput(
            mailController: controller,
          ),
          PasswordInputField(
            controller: pwdController,
          ),
          Row(
            children: const [
              CustomCheckBoxWidget(),
              Text(
                "Se souvenir de moi",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Center(
            child: GestureDetector(
                onTap: signInWithEmail,
                child: Container(
                    height: 50,
                    width: 350,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor),
                    child: Center(
                      child: Text(
                        "Se connecter",
                        style:
                            GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                      ),
                    ))),
          ),
        ],
      ),
    );
  }

  Future signInWithEmail() async {

    _formKey.currentState?.validate();

    if(controller.text.trim().isNotEmpty && controller.text.trim()!=null
      && pwdController.text.trim().isNotEmpty && pwdController.text.trim()!=null){

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: controller.text.trim(), password: pwdController.text.trim());
      } on FirebaseAuthException catch(e){
        if(e.code.toString()=="invalid-email"){
          Fluttertoast.showToast(
              msg: "Format d'email invalide",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red.shade700,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
        else{
          Fluttertoast.showToast(
              msg: "Identifiants incorrects",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red.shade700,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      }

    }

  }
}

class WithPhoneNumber extends StatefulWidget {
  const WithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<WithPhoneNumber> createState() => _WithPhoneNumberState();
}

class _WithPhoneNumberState extends State<WithPhoneNumber> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          PhoneInputField(
            phoneController: controller,
          ),
          Row(
            children: const [
              CustomCheckBoxWidget(),
              Text(
                "Se souvenir de moi",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Center(
            child: GestureDetector(
                onTap: signInWithOTP,
                child: Container(
                    height: 50,
                    width: 350,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor),
                    child: Center(
                      child: Text(
                        "Se connecter",
                        style:
                            GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                      ),
                    ))),
          ),
        ],
      ),
    );
  }

  Future signInWithOTP() async {
    String phoneNumber = "+237${controller.text.trim()}";


    _formKey.currentState?.validate();

    if(controller.text.trim().isNotEmpty
        && controller.text.trim()!=null
        && isNumeric(controller.text.trim())){
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (credential) {},
          verificationFailed: (excpt) {
            print(excpt.code.toString());
            if(excpt.code.toString()=="invalid-phone-number"){
              Fluttertoast.showToast(
                  msg: "Format de numero invalide",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red.shade700,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          },
          codeSent: (verificationId, resendToken) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VerifyOTPScreen(
                      verificationID: verificationId, phoneNumber: phoneNumber,
                    )));
          },
          codeAutoRetrievalTimeout: (verificationId) {},
        );
    }else{}
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

}
