import 'package:flutter/material.dart';

class RankStarsWidget extends StatefulWidget {
  final double? size;
  final int note;

  const RankStarsWidget({Key? key, this.size, required this.note})
      : super(key: key);

  @override
  State<RankStarsWidget> createState() => _RankStarsWidgetState();
}

class _RankStarsWidgetState extends State<RankStarsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.note > 0
            ? Icon(
                Icons.star_sharp,
                size: widget.size!,
              )
            : Icon(Icons.star_border, size: widget.size!),
        widget.note > 1
            ? Icon(Icons.star_sharp, size: widget.size!)
            : Icon(Icons.star_border, size: widget.size!),
        widget.note > 2
            ? Icon(Icons.star_sharp, size: widget.size!)
            : Icon(Icons.star_border, size: widget.size!),
        widget.note > 3
            ? Icon(Icons.star_sharp, size: widget.size!)
            : Icon(Icons.star_border, size: widget.size!),
        widget.note > 4
            ? Icon(Icons.star_sharp, size: widget.size!)
            : Icon(Icons.star_border, size: widget.size!),
      ],
    );
  }
}
