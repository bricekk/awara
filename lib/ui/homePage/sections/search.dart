import 'package:flutter/material.dart';
import 'package:awara/widgets/searchInput.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          const Expanded(child: SearchInputWidget()),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 6),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.filter_list,
                color: Colors.red.shade900,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}