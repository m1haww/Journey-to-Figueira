import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_figueira/pages/home_page.dart';
import 'package:journey_to_figueira/pages/settings.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> _tabViews = [
    HomePage(), // Asigură-te că numele claselor sunt corecte.
    HomePage(),
    Settings(),
  ];

  final List<IconData> _tabIcons = [
    CupertinoIcons.time,
    CupertinoIcons.map,
    CupertinoIcons.settings,
  ];

  final List<String> _tabLabels = ["", "", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabViews[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xffa3865d),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: List.generate(
          _tabIcons.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(_tabIcons[index]),
            label: _tabLabels[index],
          ),
        ),
      ),
    );
  }
}
