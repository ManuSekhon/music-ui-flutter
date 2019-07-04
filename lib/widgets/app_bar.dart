import 'package:flutter/material.dart';

/// App bar for music app
class MusicAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Icon actionIcon;
  final Function action;
  final Color actionBackground;

  MusicAppBar({
    @required this.title,
    @required this.action,
    @required this.actionIcon,
    this.actionBackground = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: AppBar(
        title: Text(
          this.title,
          style: TextStyle(fontSize: 33.0, fontWeight: FontWeight.bold, letterSpacing: 2.0),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton(
            child: this.actionIcon,
            color: this.actionBackground,
            shape: CircleBorder(),
            onPressed: this.action,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
