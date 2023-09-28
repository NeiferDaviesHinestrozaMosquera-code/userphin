import 'package:flutter/material.dart';


Widget iconButtonSocial(IconData? iconData, VoidCallback onPressed, Color color) {
  return IconButton(
    onPressed: onPressed,
    icon: Icon(iconData),
    color: color,
    iconSize: 40,
  );
}
