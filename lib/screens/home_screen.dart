import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yohaura/providers/photo_provider.dart';
import 'package:yohaura/screens/memories_screen.dart';
import 'package:yohaura/screens/calender_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    MemoriesScreen(),
    CalendarScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<PhotoProvider>(context, listen: false).addPhoto();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.list),
                onPressed: () => _onItemTapped(0),
              ),
              SizedBox(width: 20), // space between buttons and FAB
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => _onItemTapped(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
