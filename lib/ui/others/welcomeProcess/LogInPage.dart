import 'package:awara/main.dart';
import 'package:awara/viewPage.dart';
import 'package:awara/widgets/checkBox.dart';
import 'package:awara/widgets/registrationInputFied.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../widgets/pswdInputField.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);


  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User? >(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){

            return ViewPage();

          }else{

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


  TextEditingController emailController = TextEditingController();

  TextEditingController pwdController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    pwdController.dispose();

    super.dispose();
  }



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
                  Text(
                    "Connexion",
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RegistrationInputField(
              fieldName: "Email",
              type: "email",
              required: true,
              controller: emailController,
            ),
            PasswordInputField(
              fieldName: "Mot de passe",
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
                  onTap: signIn,
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
                          style: GoogleFonts.roboto(
                              color: Colors.white, fontSize: 20),
                        ),
                      ))),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: signIn,
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
                              size: 35,
                              color: Theme.of(context).primaryColor),
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
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Text(
                          " Creer un compte",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600
                          ),
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


  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: pwdController.text.trim()
    );
  }
}

