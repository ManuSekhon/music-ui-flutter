import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_login/models/music_model/music_model.dart';

/// Render horizontal album list
class AlbumList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MusicModel>(
      builder: (context, child, model) {
        return model.isLoading
            ? CircularProgressIndicator()
            : model.isError
                ? Text('Failed to fetch data. Try again later')
                : Container(
                    height: 170,
                    child: ListView.builder(
                      itemCount: model.albums.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.0, right: index == model.albums.length - 1 ? 0.0 : 28.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 105,
                                    width: 105,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(15.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.1),
                                          blurRadius: 10.0,
                                          offset: Offset(0, 7),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 105,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10.0),
                                          child: Text(
                                            model.albums[index].name,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            model.albums[index].type,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(203, 203, 203, 1.0),
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () => model.selectAlbum(index));
                      },
                    ),
                  );
      },
    );
  }
}
