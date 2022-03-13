import 'package:flutter/material.dart';
import 'package:jade/theme.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      type: BottomNavigationBarType.fixed,
      elevation: 5,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.black,
      iconSize: 25,
      selectedItemColor: purpleColor,
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home
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