import 'package:flutter/material.dart';
import 'package:keiko_food_reviews/models/nav_destination.dart';

class MobileLayout extends StatefulWidget {
  final List<Widget> _pages;
  final List<NavDestination> _destinations;

  const MobileLayout(this._pages, this._destinations, {super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int _currentPageIndex = 0;

  void onPageSelected(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget._pages[_currentPageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: widget._destinations.map((e) => e.toMobileDestination()).toList(),
        selectedIndex: _currentPageIndex,
        onDestinationSelected: onPageSelected
      ),
    );
  }
}
