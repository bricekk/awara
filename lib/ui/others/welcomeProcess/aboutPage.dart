import 'package:awara/ui/others/welcomeProcess/LogInPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/about.png"),
                  fit: BoxFit.contain
              )
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Text("Decouvrez des saveurs et faites vous livrer",
                    style: GoogleFonts.roboto(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                    ),),
                ),
                Center(
                  child: Text("sans avoir à payer de frais.",
                    style: GoogleFonts.roboto(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                    ),),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> const LogInPage()));
                    },
                    child: Container(
                        height: 50,
                        width: 350,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor
                        ),
                      child: Center(
                        child: Text(
                          "Continuer",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ),
                      )
                    )
                )
              ],
            ),
          )
      ),
    );
  }
}
