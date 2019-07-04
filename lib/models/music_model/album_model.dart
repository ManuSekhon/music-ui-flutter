import 'package:flutter_login/models/music_model/song_model.dart';

/// Model for single album
class AlbumModel {
  String id;
  String name;
  String type;
  List<Song> songs;

  AlbumModel({this.id, this.name, this.type, this.songs});

  factory AlbumModel.fromJson(Map<String, dynamic> album) {
    List<Song> _list = List<Song>();
    for (var song in album['songs']) {
      _list.add(Song.fromJson(song));
    }
    return AlbumModel(
      id: album['id'],
      name: album['name'],
      type: album['terms'],
      songs: _list,
    );
  }
}