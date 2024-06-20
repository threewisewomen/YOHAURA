import 'package:hive/hive.dart';

part 'photo.g.dart';

@HiveType(typeId: 0)
class Photo {
  @HiveField(0)
  final String path;

  @HiveField(1)
  final Map<String, String> exifData;

  @HiveField(2)
  final List<String> tags;

  Photo({required this.path, required this.exifData, required this.tags});
}
