import 'package:flutter/material.dart';

Widget textStyleOne({required String title, double? fontSize}) {
  return Text(
    title,
    style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
  );
}
