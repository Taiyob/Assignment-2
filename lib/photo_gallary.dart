import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_app/data.dart';
import 'package:my_app/show_image.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  List<Gallery> photoList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getColorFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Photo Gallery App'),
        ),
        body: ListView.builder(
          itemCount: photoList.length,
          itemBuilder: (context, index) {
            if (photoList.isEmpty) {
              return CircularProgressIndicator();
            } else {
              return ListTile(
                leading: Image.network(
                  photoList[index].image,
                ),
                title: Text(photoList[index].title),
                subtitle: Text('Number'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowSingleImage(
                          title: photoList[index].title,
                          id: photoList[index].id,
                          bigImage: photoList[index].bigImage,
                        ),
                      ));
                },
              );
            }
          },
        ));
  }

  Future<void> getColorFromApi() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    Response response = await get(uri);
    //print(response);
    print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      var decodeResponse = jsonDecode(response.body);
      var data = decodeResponse;
      for (var item in data) {
        Gallery gallery = Gallery(
          id: item['id'],
          title: item['title'],
          image: item['thumbnailUrl'],
          bigImage: item['url'],
        );
        photoList.add(gallery);
        setState(() {});
      }
    }
  }
}
