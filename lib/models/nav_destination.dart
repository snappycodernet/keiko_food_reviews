import 'package:flutter/material.dart';

class NavDestination {
  final IconData icon;
  final String labelText;

  NavDestination(this.labelText, [this.icon = Icons.data_object]);
}

extension NavDestinationExtensions on NavDestination {
  NavigationDestination toMobileDestination() {
    return NavigationDestination(icon: Icon(icon), label: labelText);
  }

  NavigationRailDestination toWebDestination() {
    return NavigationRailDestination(icon: Icon(icon), label: Text(labelText));
  }
}