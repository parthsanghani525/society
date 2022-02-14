import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(IconData icons,String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(
          color: Colors.blue,
          width: 1.5
      ),
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide:  BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    enabledBorder:const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide:  BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
  );
}