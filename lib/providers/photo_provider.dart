import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:exif/exif.dart';
import 'dart:io';
import 'package:yohaura/models/photo.dart';

class PhotoProvider with ChangeNotifier {
  List<Photo> _photos = [];

  List<Photo> get photos => _photos;

  Future<void> addPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final Map<String?, IfdTag>? tags = await readExifFromFile(file);

      if (tags != null) {
        final Map<String, String> exifData =
            tags.map((key, value) => MapEntry(key ?? '', value.toString()));
        //.where((key, value) => key.isNotEmpty);

        final photo = Photo(
          path: pickedFile.path,
          exifData: exifData,
          tags: [],
        );

        _photos.add(photo);
        final box = await Hive.openBox<Photo>('photos');
        box.add(photo);

        notifyListeners();
      }
    }
  }

  Future<void> loadPhotos() async {
    final box = await Hive.openBox<Photo>('photos');
    _photos = box.values.toList().cast<Photo>();
    notifyListeners();
  }

  // Add other methods for editing EXIF info and adding tags
}
