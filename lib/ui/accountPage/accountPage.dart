import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Account"),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                child: const Icon(Icons.settings),
              ),
            ),
          ],
        ),
        body: Container());
  }
}
