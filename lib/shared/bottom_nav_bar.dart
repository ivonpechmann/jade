import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.black,
      iconSize: 30,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.explore,
          ),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: ""
        ),
      ],
    );
  }
}