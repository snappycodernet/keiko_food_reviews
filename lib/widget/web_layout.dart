import 'package:flutter/material.dart';
import 'package:keiko_food_reviews/models/nav_destination.dart';

class WebLayout extends StatefulWidget {
  final List<Widget> _pages;
  final List<NavDestination> _destinations;

  const WebLayout(this._pages, this._destinations, {super.key});

  @override
  State<WebLayout> createState() => _WebLayoutState();
}

class _WebLayoutState extends State<WebLayout> {
  int _currentPageIndex = 0;

  void onPageSelected(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondaryContainer,
                ]
              )
            ),
            child: NavigationRail(
              backgroundColor: Colors.transparent,
              labelType: NavigationRailLabelType.all,
              leading: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Image.asset('assets/images/crown.png',
                  width: 48.0,
                  fit: BoxFit.cover
                ),
              ),
              destinations: widget._destinations.map((e) => e.toWebDestination()).toList(),
              selectedIndex: _currentPageIndex,
              onDestinationSelected: onPageSelected
            ),
          ),
          Expanded(
            child: widget._pages[_currentPageIndex]
          )
        ],
      )
    );
  }
}
