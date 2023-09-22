import 'package:flutter/material.dart';

class ErrorSnackBar {
  static show(context, error) {
    var textTheme = Theme.of(context).textTheme;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          error,
          style: textTheme.titleSmall?.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      ),
    );
  }
}
