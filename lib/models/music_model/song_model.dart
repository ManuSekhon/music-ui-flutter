/// Model for single song
class Song {
  String id;
  String title;
  double duration;

  Song({this.id, this.title, this.duration});

  factory Song.fromJson(Map<String, dynamic> song) {
    return Song(id: song['id'], title: song['title'], duration: song['duration']);
  }
}