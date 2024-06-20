import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yohaura/providers/photo_provider.dart';
import 'package:yohaura/widgets/custom_header.dart';
import 'dart:io';

class MemoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomHeader(title: 'Memories'),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 108, 139, 54),
                  Color.fromARGB(255, 0, 0, 0),
                ],
              ),
            ),
            child: Consumer<PhotoProvider>(
              builder: (context, photoProvider, child) {
                return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: photoProvider.photos.length,
                  itemBuilder: (context, index) {
                    final photo = photoProvider.photos[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            File(photo.path),
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        title: Text('Memory ${index + 1}'),
                        subtitle: Text(photo.exifData.entries
                            .map((e) => '${e.key}: ${e.value}')
                            .join('\n')),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
