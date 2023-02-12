import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const AdaptiveTextField({
    Key? key,
    this.keyboardType,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? TextField(
            decoration: InputDecoration(
              labelText: label,
            ),
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
          )
        : CupertinoTextField(
            placeholder: label,
            controller: controller,
            padding: const EdgeInsets.all(10),
            keyboardType: keyboardType ?? TextInputType.text,
          );
  }
}
