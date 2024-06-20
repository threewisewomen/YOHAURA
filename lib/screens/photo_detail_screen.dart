import 'package:flutter/material.dart';
import 'package:yohaura/models/photo.dart';
import 'dart:io';

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  PhotoDetailScreen({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Details'),
      ),
      body: Column(
        children: [
          Image.file(
            File(photo.path),
            fit: BoxFit.cover,
          ),
          // Add UI for displaying and editing EXIF info and tags
        ],
      ),
    );
  }
}
