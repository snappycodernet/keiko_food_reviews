import 'package:flutter/material.dart';
import 'package:keiko_food_reviews/helper/constants.dart';
import 'package:keiko_food_reviews/widget/mobile_layout.dart';
import 'package:keiko_food_reviews/widget/responsive_layout_builder.dart';
import 'package:keiko_food_reviews/widget/web_layout.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const String route = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pages = appPages;
  final _destinations = appDestinations;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobile: MobileLayout(_pages, _destinations),
      webDesktopTablet: WebLayout(_pages, _destinations)
    );
  }
}
