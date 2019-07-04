import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_login/models/music_model/music_model.dart';
import 'package:flutter_login/service_locator.dart';
import 'package:flutter_login/widgets/album_list.dart';
import 'package:flutter_login/widgets/app_bar.dart';
import 'package:flutter_login/widgets/column_header.dart';
import 'package:flutter_login/widgets/mini_music_bar.dart';
import 'package:flutter_login/widgets/navigator_bar.dart';
import 'package:flutter_login/widgets/song_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // music model
  final _musicModel = locator<MusicModel>();

  @override
  void initState() {
    _musicModel.getAlbums(10);
    super.initState();
  }

  // navigate to music screen
  void _navigateToMusic(details) {
    if (details.velocity.pixelsPerSecond.dx < 0) {
      Navigator.of(context).pushNamed('/music');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MusicModel>(
      model: this._musicModel,
      child: Scaffold(
        appBar: MusicAppBar(
          title: 'Music',
          actionIcon: Icon(Icons.search, color: Colors.white, size: 25.0),
          actionBackground: Color.fromRGBO(43, 43, 43, 1.0),
          action: () => {},
        ),
        backgroundColor: Colors.white,
        body: GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // navigator tabs
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: NavigatorBar('home_screen'),
              ),

              // main image
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 18.0, right: 18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 145,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2), blurRadius: 20.0, offset: Offset(0, 6))
                    ],
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/flower_image.jpg')),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),

              // column header for albums
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 18.0, right: 5.0),
                child: ColumnHeader(title: 'New Albums', onSeeAll: () => {}),
              ),

              // album list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: AlbumList(),
              ),

              // column header for song list
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 18.0, right: 5.0),
                child: ColumnHeader(title: 'Song List', onSeeAll: () => {}),
              ),

              // song list
              SongList(),

              // music bar
              MiniMusicBar(),
            ],
          ),
          onHorizontalDragEnd: _navigateToMusic,
        ),
      ),
    );
  }
}
