import 'package:flutter/material.dart';

class SongImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      width: 51,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 10.0,
            offset: Offset(4, 4),
          )
        ],
      ),
    );
  }
}
