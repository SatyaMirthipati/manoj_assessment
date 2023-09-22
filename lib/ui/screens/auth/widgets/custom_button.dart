import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
  }) : super(key: key);

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  bool progress = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.primaryColor.withOpacity(0.3),
              MyColors.primaryColor.withOpacity(0.6),
              MyColors.primaryColor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Container(
          height: 60,
          width: widget.width ?? 80,
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
