import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_login/models/music_model/music_model.dart';
import 'package:flutter_login/service_locator.dart';
import 'package:flutter_login/widgets/app_bar.dart';
import 'package:flutter_login/widgets/navigator_bar.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> with TickerProviderStateMixin {
  MusicModel _musicModel = locator<MusicModel>();
  ScrollController _scrollController = ScrollController();

  // navigate to home screen
  void _navigateToHome(details) {
    if (details.velocity.pixelsPerSecond.dx > 0) {
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    Timer(Duration(milliseconds: 100), () => _scrollController.jumpTo(_musicModel.currentSong * 260.0));
    super.initState();
  }

  // scroll to song
  void _scrollList(details) {
    if (details.velocity.pixelsPerSecond.dx > 0) {
      setState(() => _musicModel.previousSong());
    } else {
      setState(() => _musicModel.nextSong());
    }

    setState(() {
      _scrollController.animateTo(
        _musicModel.currentSong * 260.0,
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MusicAppBar(
        title: 'Play',
        actionIcon: Icon(Icons.more_horiz, color: Colors.black, size: 25.0),
        action: () => {},
      ),
      body: ScopedModel<MusicModel>(
        model: this._musicModel,
        child: GestureDetector(
          child: ScopedModelDescendant<MusicModel>(builder: (context, child, model) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // navigator tabs
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: NavigatorBar('music_screen'),
                ),
                // horizontal song list
                !(model.isLoading || model.isError)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 20.0),
                        child: Container(
                          height: 350,
                          child: ListView.builder(
                            controller: this._scrollController,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: model.albums[model.currentAlbum].songs.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: index == model.albums[model.currentAlbum].songs.length - 1 ? 20.0 : 60.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      AnimatedContainer(
                                        width: index == model.currentSong ? 285 : 200,
                                        height: index == model.currentSong ? 285 : 200,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.fastOutSlowIn,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius: BorderRadius.circular(15.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.07),
                                              spreadRadius: -20.0,
                                              blurRadius: 10.0,
                                              offset: Offset(0, 40),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onHorizontalDragEnd: _scrollList,
                              );
                            },
                          ),
                        ),
                      )
                    : Container(height: 0.0, width: 0.0),
                !(model.isLoading || model.isError) ?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // song details
                      Container(
                        width: MediaQuery.of(context).size.width - 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              model.albums[model.currentAlbum].songs[model.currentSong].title.toUpperCase(),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, letterSpacing: 2.5),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                model.albums[model.currentAlbum].name,
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // icon with shadow
                      Icon(Icons.favorite, color: Colors.red, size: 32.0),
                    ],
                  ),
                ) : Container(height: 0.0, width: 0.0),
              ],
            );
          }),
          onHorizontalDragEnd: _navigateToHome,
        ),
      ),
    );
  }
}
