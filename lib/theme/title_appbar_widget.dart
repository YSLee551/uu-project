import 'package:flutter/material.dart';
import 'package:uu_project/theme/colors.dart';

PreferredSizeWidget titleAppBar(String text) {
  return AppBar(
    iconTheme: IconThemeData(color: onSurface),
    elevation: 0,
    backgroundColor: surface,
    centerTitle: true,
    title: Text(
      text,
      style: TextStyle(
        fontSize: 22,
        color: onSurface,
        fontWeight: FontWeight.bold,
        fontFamily: 'Main',
      ),
    ),
  );
}
