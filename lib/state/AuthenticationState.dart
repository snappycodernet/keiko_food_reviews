import 'package:flutter/material.dart';
import 'package:keiko_food_reviews/models/user_model.dart';

class AuthenticationState extends InheritedWidget {
  const AuthenticationState({super.key, required this.user, required super.child});

  final UserModel user;

  static AuthenticationState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthenticationState>();
  }

  @override
  bool updateShouldNotify(AuthenticationState oldWidget) {
    return user.uid != oldWidget.user.uid;
  }
}