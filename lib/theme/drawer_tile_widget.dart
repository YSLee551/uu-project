import 'package:flutter/material.dart';
import 'package:uu_project/theme/colors.dart';

Widget drawerTile({
  String name = "no name",
  VoidCallback? onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16),
    child: ListTile(
      horizontalTitleGap: 30.0,
      title: Text(
        name,
        style: TextStyle(fontSize: 18, color: onSurface, fontFamily: 'Main'),
      ),
      onTap: onPressed,
    ),
  );
}
