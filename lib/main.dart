import 'package:flutter/material.dart';
import 'package:yohaura/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:yohaura/providers/photo_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('photos');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhotoProvider(),
      child: MaterialApp(
        title: 'YOHAURA',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
