import 'package:flutter/material.dart';

class NavigatorBar extends StatelessWidget {
  final String _routeName;

  NavigatorBar(this._routeName);

  // container for current route
  Container _buildCurrent() {
    return Container(
      height: 7.0,
      width: 20.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Colors.black),
    );
  }

  // container for other routes
  Container _buildOther() {
    return Container(
      height: 7.0,
      width: 7.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.0), color: Colors.black38),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: _routeName == 'home_screen' ? _buildCurrent() : _buildOther(),
            ),
            _routeName == 'music_screen' ? _buildCurrent() : _buildOther(),
          ],
        ),
      ),
    );
  }
}
