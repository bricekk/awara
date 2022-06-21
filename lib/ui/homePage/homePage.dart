import 'package:awara/ui/homePage/sections/featuredRestaurant.dart';
import 'package:awara/ui/homePage/sections/homeAppBar.dart';
import 'package:awara/ui/homePage/sections/menuItem.dart';
import 'package:awara/ui/homePage/sections/search.dart';
import 'package:awara/ui/homePage/sections/specialDeal.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: const [
            SpecialDealSection(),
            SearchSection(),
            FeaturedResturantSection(),
            MenuItemSection(),
          ],
        ),
      ),
    );
  }
}



