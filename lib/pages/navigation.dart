import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_figueira/pages/home_page.dart';
import 'package:journey_to_figueira/pages/maps_page.dart';
import 'package:journey_to_figueira/pages/settings.dart';
import 'package:journey_to_figueira/utils/base.dart';
import 'package:journey_to_figueira/utils/colors.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> _Views = [
    HomePage(), // Asigură-te că numele claselor sunt corecte.
    MapsPage(),
    Settings(),
  ];

  final List<IconData> _Icons = [
    CupertinoIcons.time,
    CupertinoIcons.map,
    CupertinoIcons.settings,
  ];

  final List<String> _tabLabels = ["", "", ""];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        buildBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _Views[_currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: Container(
              height: height * 0.12,
              child: BottomNavigationBar(
                backgroundColor: Colors.black,

                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                selectedItemColor: kGold,
                unselectedItemColor: kWhite,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: List.generate(
                  _Icons.length,
                  (index) => BottomNavigationBarItem(
                    icon: Icon(_Icons[index]),
                    label: _tabLabels[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
