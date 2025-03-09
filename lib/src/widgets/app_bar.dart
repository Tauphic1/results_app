import 'package:flutter/material.dart';

PreferredSizeWidget appBarWithBg({String? title, List<Widget>? actions}) {
  return AppBar(
    actions: actions,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Center(child: Text(title!, style: TextStyle(color: Colors.white))),
    toolbarHeight: 80,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),
  );
}
