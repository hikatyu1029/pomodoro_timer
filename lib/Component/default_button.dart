import 'package:flutter/material.dart';

class DefaultButton extends ElevatedButton {
  DefaultButton({required VoidCallback? onPressed, required Widget? child})
      : super(onPressed: onPressed, child: child);
  @override
  ButtonStyle? get style => ElevatedButton.styleFrom(
        primary: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      );
}
