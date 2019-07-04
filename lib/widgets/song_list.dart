import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_login/models/music_model/music_model.dart';
import 'package:flutter_login/widgets/song_image.dart';

/// Render vertical song list based on selected album
class SongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MusicModel>(builder: (context, child, model) {
      return model.isLoading
          ? CircularProgressIndicator()
          : model.isError
              ? Padding(child: Text('Failed to fetch data. Try again later.'), padding: EdgeInsets.only(left: 20.0))
              : Expanded(
                  child: ListView.builder(
                  itemCount: model.albums[model.currentAlbum].songs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListTile(
                        title: Text(
                          model.albums[model.currentAlbum].songs[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                        subtitle: Text(model.albums[model.currentAlbum].type),
                        leading: SongImage(),
                        trailing: IconButton(icon: Icon(Icons.more_horiz), onPressed: () => {}),
                        contentPadding: EdgeInsets.only(right: 0.0),
                        onTap: () => model.selectSong(index),
                      ),
                    );
                  },
                ));
    });
  }
}
