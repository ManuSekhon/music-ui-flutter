import 'package:flutter/material.dart';

class ColumnHeader extends StatelessWidget {
  final String title;
  final Function onSeeAll;

  ColumnHeader({@required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          this.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, letterSpacing: 1.0),
        ),
        RaisedButton(
          child: Text(
            'See all >',
            style: TextStyle(color: Color.fromRGBO(203, 203, 203, 1.0), fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          onPressed: this.onSeeAll,
          color: Colors.white10,
          elevation: 0.0,
        ),
      ],
    );
  }
}
