import 'package:flutter/material.dart';
import 'package:awara/widgets/featuredRestaurant.dart';

class FeaturedResturantSection extends StatefulWidget {
  const FeaturedResturantSection({Key? key}) : super(key: key);

  @override
  State<FeaturedResturantSection> createState() =>
      _FeaturedResturantSectionState();
}

class _FeaturedResturantSectionState extends State<FeaturedResturantSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Featured Restaurants",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 2,
                            color: Theme.of(context).colorScheme ==
                                    ColorScheme.dark()
                                ? Colors.white
                                : Colors.black))),
                child: Text(
                  "see all",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500,color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              FeaturedRestaurantWidget(
                name: "Mc Donaldsss",
                location: "Dla, Bonapriso",
                distance: '2km',
                note: 2,
                imageUrl: 'assets/images/img2.png',
              ),
              FeaturedRestaurantWidget(
                name: "Ritz",
                location: "Dla, Bonamoussadi",
                distance: '3km',
                note: 4,
                imageUrl: 'assets/images/img2.png',
              ),
            ],
          ),
        )
      ],
    );
  }
}
