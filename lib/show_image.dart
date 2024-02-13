import 'package:flutter/material.dart';

class ShowSingleImage extends StatelessWidget {
  final id;
  final title;
  final bigImage;
  const ShowSingleImage({this.id, this.title, this.bigImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Details')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: NetworkImage(bigImage ?? '')),
              const SizedBox(
                height: 10,
              ),
              Text(
                title ?? '',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("ID: $id", style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
