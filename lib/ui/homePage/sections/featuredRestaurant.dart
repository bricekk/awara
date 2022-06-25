import 'package:flutter/material.dart';
import 'package:awara/widgets/featuredRestaurant.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';

class FeaturedResturantSection extends StatefulWidget {
  const FeaturedResturantSection({Key? key}) : super(key: key);

  @override
  State<FeaturedResturantSection> createState() =>
      _FeaturedResturantSectionState();
}

class _FeaturedResturantSectionState extends State<FeaturedResturantSection> {

  final DatabaseReference _featuredRestaurantRef = FirebaseDatabase.instance.ref('restaurants');

  @override
  Widget build(BuildContext context) {

    _featuredRestaurantRef.keepSynced(true);

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
                child: const Text(
                  "see all",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        StreamBuilder(
            stream: _featuredRestaurantRef.onValue,
            builder: (context, AsyncSnapshot snap) {
              if(snap.hasData && !snap.hasError && snap.data.snapshot.value != null){
                Map data = snap.data.snapshot.value;
                List list = [];
                data.forEach((index, data)=> list.add({"key": index, ...data}));
                return SizedBox(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: (list.length),
                      itemBuilder: (context, index){
                        return FeaturedRestaurantWidget(
                            name: list[index]['restoName'],
                            location: list[index]['restoSis'],
                            note: list[index]['restoNote'],
                            distance: "2km",
                            imageUrl: list[index]['restoImg'],
                        );
                      },
                  ),
                );
              }else{
                return const Center(
                  child: Text("no data"),
                );
              }
            }
        )
      ],
    );
  }
}
