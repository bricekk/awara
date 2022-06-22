import 'package:flutter/material.dart';

import 'package:awara/services/themeService.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: const [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text("Awara"),
        ],
      ),
      // actions: [
      //   MaterialButton(
      //     onPressed: () {
      //       ThemeService().switchTheme();
      //     },
      //     child: Icon(
      //       Theme.of(context).colorScheme == const ColorScheme.dark()
      //           ? Icons.sunny
      //           : Icons.dark_mode,
      //       color: Colors.white,
      //     ),
      //   )
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}