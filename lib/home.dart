import 'package:feeds_tutorial/people_screen.dart';
import 'package:feeds_tutorial/profile_screen.dart';
import 'package:feeds_tutorial/timeline_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.bike_scooter_rounded),
            SizedBox(width: 16),
            Text('Tweet It!'),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          TimelineScreen(),
          ProfileScreen(),
          PeopleScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        elevation: 16.0,
        type: BottomNavigationBarType.fixed,
        iconSize: 22,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.timeline),
            label: 'Timeline',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.supervised_user_circle_sharp),
            label: 'People',
          ),
        ],
      ),
    );
  }
}
