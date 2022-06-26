import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

class SpecialDealWidget extends StatelessWidget {

  final DatabaseReference _specialDealRef = FirebaseDatabase.instance.ref('dealHistory');

  @override
  Widget build(BuildContext context) {

    _specialDealRef.keepSynced(true);

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      height: 100,
      child: StreamBuilder(
          stream: _specialDealRef.limitToLast(1).onValue,
          builder: (context, AsyncSnapshot snap){
            if(snap.hasData && !snap.hasError && snap.data.snapshot.value != null){
              Map data = snap.data.snapshot.value;
              List list = [];
              data.forEach((index, data)=> list.add({"key": index, ...data}));
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index){
                    return Row(
                      children: [
                        ImageBox(
                          imageUrl: list[index]['dealImg'],
                        ),
                        Expanded(
                          child: OfferDescription(
                            title: list[index]['dealHock'],
                            subTitle: list[index]['menuName']!,
                            price: list[index]['dealPrice'],
                          ),
                        )
                      ],
                    );
                  });
            }else{
              return const Center(
                child: Text("no data"),
              );
            }
          })
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
      decoration: const BoxDecoration(
      ),
      child: Image.network(widget.imageUrl),
    );
  }
}

class OfferDescription extends StatefulWidget {
  final String title;
  final String subTitle;
  final int price;

  const OfferDescription(
      {Key? key, required this.title, required this.subTitle, required this.price})
      : super(key: key);

  @override
  State<OfferDescription> createState() => _OfferDescriptionState();
}

class _OfferDescriptionState extends State<OfferDescription> {


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10),
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: GoogleFonts.asul(
                fontSize: 15.5,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
              child: Text(
            widget.subTitle,
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
                          child: GestureDetector(
                            onTap: (){
                              FirebaseAuth.instance.signOut();
                            },
                            child: Text(
                              "Buy Now",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
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
