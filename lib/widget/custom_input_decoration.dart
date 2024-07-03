import 'package:flutter/material.dart';

class CustomInputDecoration {
  final String label;
  final IconData icon;

  const CustomInputDecoration(this.label, this.icon);
}

extension CustomInputDecorationExtensions on CustomInputDecoration {
  InputDecoration build() {
    return InputDecoration(
        labelText: label,
        icon: Icon(icon),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48.0),
        )
    );
  }
}
