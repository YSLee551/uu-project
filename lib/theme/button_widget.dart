import 'package:flutter/material.dart';
import 'package:uu_project/theme/colors.dart';

Widget mainButton({
  String buttonText = "",
  double? elevation,
  VoidCallback? onPressed,
}) {
  return SizedBox(
    width: 300,
    height: 50,
    child: FloatingActionButton(
      backgroundColor: primary,
      isExtended: true,
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 19,
          fontFamily: 'Main',
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
      elevation: elevation,
    ),
  );
}
