import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Service for music
class MusicService {
  Future<dynamic> getAlbums(int numberOfAlbums) async {
    String url = '';
    if (numberOfAlbums == 0)
      url = 'http://localhost:3001/api/albums';
    else
      url = 'http://localhost:3001/api/albums/$numberOfAlbums';

    try {
    http.Response res = await http.get(url);
    return jsonDecode(res.body);

    } catch (err) {
      throw Exception(err.message);
    }
  }
}
