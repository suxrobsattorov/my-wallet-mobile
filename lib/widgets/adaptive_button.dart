import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final Function() handler;
  final bool? filled;

  const AdaptiveButton({
    Key? key,
    this.filled = false,
    required this.text,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? filled!
            ? ElevatedButton(
                onPressed: handler,
                child: Text(text),
              )
            : TextButton(
                onPressed: handler,
                child: Text(text),
              )
        : filled!
            ? CupertinoButton.filled(
                onPressed: handler,
                child: Text(text),
              )
            : CupertinoButton(
                onPressed: handler,
                child: Text(text),
              );
  }
}
