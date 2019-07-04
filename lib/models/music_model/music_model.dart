import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_login/models/music_model/album_model.dart';
import 'package:flutter_login/services/music_service.dart';
import 'package:flutter_login/service_locator.dart';

/// Model containing album data
class MusicModel extends Model {
  List<AlbumModel> albums;
  MusicService _musicService = locator<MusicService>();
  bool isLoading = false;
  bool isError = false;

  int currentAlbum = 0;
  int currentSong = 0;

  Future<void> getAlbums(int numberOfAlbums) async {
    isLoading = true;
    isError = false;
    notifyListeners();

    var res;
    try {
      res = await _musicService.getAlbums(numberOfAlbums);
      _createAlbums(res);
      isLoading = false;
    } catch (err) {
      isError = true;
      isLoading = false;
    }

    notifyListeners();
  }

  void _createAlbums(List<dynamic> jsonAlbums) {
    this.albums = jsonAlbums.map((album) => AlbumModel.fromJson(album)).toList();
  }

  void nextSong() {
    if (currentSong < this.albums[currentAlbum].songs.length - 1) {
      currentSong++;
      notifyListeners();
    }
  }

  void previousSong() {
    if (currentSong - 1 >= 0) {
      currentSong--;
      notifyListeners();
    }
  }

  selectSong(int index) {
    currentSong = index;
    notifyListeners();
  }

  selectAlbum(int index) {
    currentAlbum = index;
    currentSong = 0;
    notifyListeners();
  }
}
