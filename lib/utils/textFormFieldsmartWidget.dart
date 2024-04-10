import 'package:flutter/material.dart';

import 'controllers.dart';

TextFormField textFormField(TextEditingController controller, String hint) {
  return TextFormField(
    controller: controller,
    onTapOutside: (event) {
      FocusManager.instance.primaryFocus!.unfocus();
    },
    validator: (value) {
      if (value!.isEmpty) {
        return "Required";
      }
    },
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.amber)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red)),
        hintText: hint),
  );
}
