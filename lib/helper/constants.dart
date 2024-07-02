import 'package:flutter/material.dart';
import 'package:keiko_food_reviews/models/nav_destination.dart';

import '../pages/review_grid_photos.dart';
import '../pages/review_list/review_list.dart';
import '../pages/review_map_locations/review_map_locations.dart';

enum DatabaseCollections {
  users,
  usersData,
  reviews,
}

enum MenuItems {
  add,
  signout,
}

enum MenuItemsPhoto {
  camera,
  gallery,
}

enum ReviewMode {
  add,
  edit,
  read,
}

enum Affordability {
  $,
  $$,
  $$$,
  $$$$,
}

enum ResponsiveSizes {
  mobile(600.0),
  webDesktopTablet(601.0);

  const ResponsiveSizes(this.value);
  final double value;
}

final appPages = <Widget>[
  const ReviewList(),
  const ReviewGridPhotos(),
  const ReviewMapLocations(),
];

final appDestinations = <NavDestination>[
  NavDestination("Reviews", Icons.reviews),
  NavDestination("Photos", Icons.photo_library),
  NavDestination("Locations", Icons.location_pin)
];