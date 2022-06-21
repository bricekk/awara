import 'package:awara/widgets/rankstars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItemWidget extends StatefulWidget {
  final String name;
  final num price;
  final String restaurant;
  final int? note;
  final String? imageUrl;

  const MenuItemWidget(
      {Key? key,
      required this.name,
      required this.price,
      required this.restaurant,
      this.imageUrl,
      this.note})
      : super(key: key);

  @override
  State<MenuItemWidget> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 120,
      child: Row(
        children: [
          ImageBox(
            imageUrl: widget.imageUrl ?? "",
          ),
          MenuItemDescription(
            name: widget.name,
            restaurant: widget.restaurant,
            price: widget.price,
            note: widget.note,
          )
        ],
      ),
    );
  }
}

class ImageBox extends StatefulWidget {
  final String? imageUrl;

  const ImageBox({Key? key, this.imageUrl}) : super(key: key);

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      height: 100,
      width: 100,
      child: Image.asset(widget.imageUrl!),
    );
  }
}

class MenuItemDescription extends StatefulWidget {
  final String name;
  final num price;
  final String restaurant;
  final int? note;

  const MenuItemDescription(
      {Key? key,
      required this.name,
      required this.price,
      required this.restaurant,
      this.note})
      : super(key: key);

  @override
  State<MenuItemDescription> createState() => _MenuItemDescriptionState();
}

class _MenuItemDescriptionState extends State<MenuItemDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.asul(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "${widget.price}F",
                style: GoogleFonts.roboto(
                    fontSize: 17, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RankStarsWidget(
                    note: widget.note ?? 0,
                    size: 16,
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.restaurant,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 13),
                ),
                GestureDetector(
                  child: Container(
                    width: 90,
                    height: 28,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Get.isDarkMode
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    )),
                    child: Center(
                      child: Text(
                        "Add to cart",
                        style: GoogleFonts.roboto(
                            color: Get.isDarkMode
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
