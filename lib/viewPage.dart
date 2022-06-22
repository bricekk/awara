import 'package:flutter/material.dart';

import 'package:awara/ui/accountPage/accountPage.dart';
import 'package:awara/ui/cartPage/cartPage.dart';
import 'package:awara/ui/discussionPage/discussion.dart';
import 'package:awara/ui/homePage/homePage.dart';
import 'package:get/get.dart';


class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {


  int _currentIndex = 0;

  static const List<Widget> _widgetList = [
    HomePage(),
    CartPage(),
    DiscussionPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetList[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 27
        ),
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Carts',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.sms),
              label: 'Discussion',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts),
              label: 'Account',
          )
        ],
      ),
    );
  }
}