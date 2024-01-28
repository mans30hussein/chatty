import 'package:flutter/material.dart';

void showSnackBar(BuildContext context , String state) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state))
  );
}
