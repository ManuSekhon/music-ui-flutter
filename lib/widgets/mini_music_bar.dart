import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_login/models/music_model/music_model.dart';
import 'package:flutter_login/widgets/song_image.dart';

/// Mini music bar on homescreen
class MiniMusicBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MusicModel>(builder: (context, child, model) {
      return !(model.isLoading || model.isError)
          ? Container(
              height: 87,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(43, 43, 43, 1.0),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0), topRight: Radius.circular(45.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        // music icon
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.music_note, color: Color.fromRGBO(255, 0, 85, 1.0)),
                        ),
                        // song image
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: SongImage(),
                        ),

                        // song details
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 280.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                model.albums[model.currentAlbum].songs[model.currentSong].title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Text(
                                model.albums[model.currentAlbum].name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Color.fromRGBO(195, 195, 195, 1.0)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        // previous icon
                        IconButton(
                            icon: Icon(Icons.skip_previous, size: 30.0),
                            color: Colors.white,
                            onPressed: model.previousSong),
                        // play pause button
                        IconButton(
                            icon: Icon(Icons.play_circle_filled, size: 30.0), color: Colors.white, onPressed: () => {}),

                        // next icon
                        IconButton(
                            icon: Icon(Icons.skip_next, size: 30.0), color: Colors.white, onPressed: model.nextSong),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Container(height: 0.0, width: 0.0);
    });
  }
}
