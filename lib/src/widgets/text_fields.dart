import 'package:flutter/material.dart';

TextField homeScreenInputField({
  String? hintText,
  TextEditingController? controller,
  onSubmit,
}) {
  return TextField(
    keyboardType: TextInputType.numberWithOptions(),
    controller: controller,
    onSubmitted: onSubmit,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 2),
      ),
    ),
  );
}
