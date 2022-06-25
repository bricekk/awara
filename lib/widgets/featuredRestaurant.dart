import 'package:awara/widgets/rankstars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedRestaurantWidget extends StatefulWidget {
  final String name;
  final String location;
  final String? distance;
  final String? imageUrl;
  final int? note;

  const FeaturedRestaurantWidget(
      {Key? key,
      required this.name,
      required this.location,
      this.distance,
      this.note,
      this.imageUrl})
      : super(key: key);

  @override
  State<FeaturedRestaurantWidget> createState() =>
      _FeaturedRestaurantWidgetState();
}

class _FeaturedRestaurantWidgetState extends State<FeaturedRestaurantWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10),
      height: 110,
      width: 260,
      child: Row(
        children: [
          ImageBox(
            imageUrl: widget.imageUrl ?? "",
          ),
          RestaurantDescription(
            name: widget.name,
            location: widget.location,
            distance: widget.distance,
            note: widget.note!,
          ),
        ],
      ),
    );
  }
}

class ImageBox extends StatefulWidget {
  final String imageUrl;

  const ImageBox({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      height: 100,
      width: 100,
      child: Image.network(widget.imageUrl),
    );
  }
}

class RestaurantDescription extends StatefulWidget {
  final String name;
  final String location;
  final String? imageUrl;
  final String? distance;
  final int? note;

  const RestaurantDescription(
      {Key? key,
      required this.name,
      required this.location,
      this.distance,
      this.note,
      this.imageUrl})
      : super(key: key);

  @override
  State<RestaurantDescription> createState() => _RestaurantDescriptionState();
}

class _RestaurantDescriptionState extends State<RestaurantDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: widget.name.length > 12
                      ? 18
                      : widget.name.length > 13
                          ? 17
                          : widget.name.length > 14
                              ? 16
                              : 20,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ]),
          Text(
            widget.location,
          ),
          const SizedBox(height: 5),
          Row(children: [
            const Icon(
              Icons.location_pin,
              size: 15,
            ),
            Text(
              widget.distance!,
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RankStarsWidget(
                note: widget.note!,
                size: 13,
              ),
              const SizedBox(width: 20),
              GestureDetector(
                child: Container(
                  width: 50,
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).colorScheme ==
                                const ColorScheme.dark()
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      )),
                  child: Center(
                    child: Text(
                      "Menu",
                      style: GoogleFonts.roboto(
                          color: Theme.of(context).colorScheme ==
                                  const ColorScheme.dark()
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
