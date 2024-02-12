import 'package:flutter/material.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery App'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
        return ListTile(         
          leading: Image.asset(
              'assets/images/cart1.png',
              width: 50,
              height: 50,
            ),
          title: Text('Item1'),
          subtitle: Text('Number'),
          //trailing: Icon(Icons.ad_units),
            onTap: () {
              
            },
        );
      })
    );
  }
}

Future<void> getColorFromApi() async{
  Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
}