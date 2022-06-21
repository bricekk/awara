import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialDealWidget extends StatelessWidget {
  const SpecialDealWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      height: 90,
      child: Row(
        children: const [
          ImageBox(
            imageUrl: "assets/images/img1.png",
          ),
          Expanded(
            child: OfferDescription(
              title: "Special Deal For You This Month",
              subTitle: "Burger Juice and Frie",
              price: 1500,
            ),
          )
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
      height: 80,
      width: 90,
      decoration: BoxDecoration(
      ),
      child: Image.asset(widget.imageUrl),
    );
  }
}

class OfferDescription extends StatefulWidget {
  final String title;
  final String? subTitle;
  final int price;

  const OfferDescription(
      {Key? key, required this.title, this.subTitle, required this.price})
      : super(key: key);

  @override
  State<OfferDescription> createState() => _OfferDescriptionState();
}

class _OfferDescriptionState extends State<OfferDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: GoogleFonts.asul(
                fontSize: 17.5,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
              child: Text(
            widget.subTitle!,
            style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
          )),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.price}F",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        color: Theme.of(context).primaryColor,
                        width: 80,
                        height: 35,
                        child: Center(
                          child: Text(
                            "Buy Now",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
