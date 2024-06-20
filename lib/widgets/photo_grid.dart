import 'package:flutter/material.dart';
import 'package:yohaura/models/photo.dart';
import 'package:yohaura/screens/photo_detail_screen.dart';
import 'dart:io';

class PhotoGrid extends StatelessWidget {
  final List<Photo> photos;

  PhotoGrid({required this.photos});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PhotoDetailScreen(photo: photo),
              ),
            );
          },
          child: Image.file(
            File(photo.path),
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
