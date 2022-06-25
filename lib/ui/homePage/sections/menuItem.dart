import 'package:awara/widgets/menuItem.dart';
import 'package:flutter/material.dart';

class MenuItemSection extends StatefulWidget {
  const MenuItemSection({Key? key}) : super(key: key);

  @override
  State<MenuItemSection> createState() => _MenuItemSectionState();
}

class _MenuItemSectionState extends State<MenuItemSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Menu",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,color: Theme.of(context).primaryColor),
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme == ColorScheme.light()
                        ? Colors.black
                        : Colors.white,
                  ))),
                  child: const Text(
                    "see all",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          const MenuItemWidget(
            name: "Wata Fufu & Eru",
            price: 1500,
            restaurant: "Tata Nadege",
            note: 3,
            imageUrl: 'assets/images/eru.png',
          ),
          const MenuItemWidget(
            name: "Pizza aux Olives",
            price: 6500,
            restaurant: "Zingana Hotel",
            note: 4,
            imageUrl: 'assets/images/pizza.png',
          ),
          const MenuItemWidget(
            name: "LaCrepe",
            price: 1500,
            restaurant: "Crepisco",
            imageUrl: 'assets/images/crepes.png',
          ),
        ],
      ),
    );
  }
}
