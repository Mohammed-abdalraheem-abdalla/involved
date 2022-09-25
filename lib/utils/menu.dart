import 'package:flutter/material.dart';

class MyMenuItem{
  final String text;
  final IconData icon;

  const MyMenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MyMenuItem> items = [
    itemSettings,
    itemShare,
  ];

  static const itemSettings = MyMenuItem(
    text: 'Settings',
    icon: Icons.settings,
  );
  static const itemShare = MyMenuItem(
    text: 'Share',
    icon: Icons.share,
  );
}