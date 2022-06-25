import 'package:flutter/material.dart';

class SearchInputWidget extends StatefulWidget {
  const SearchInputWidget({Key? key}) : super(key: key);

  @override
  State<SearchInputWidget> createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {

  final TextEditingController _searchInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        cursorColor: Colors.grey.shade700,
        controller: _searchInputController,
        textInputAction: TextInputAction.search,
        toolbarOptions: const ToolbarOptions(
          copy: true,
          selectAll: true,
          paste: true,
          cut: true,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10,top: 5),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.grey.shade600
          ),
          suffixIcon: Icon(Icons.search,color: Colors.grey.shade600),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
