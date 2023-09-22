import 'dart:async';

import 'package:flutter/material.dart';

import 'error_snackbar.dart';

class ResendOtpButton extends StatefulWidget {
  const ResendOtpButton({Key? key}) : super(key: key);

  @override
  State<ResendOtpButton> createState() => _ResendOtpButtonState();
}

class _ResendOtpButtonState extends State<ResendOtpButton> {
  Timer? timer;
  int seconds = 0;
  int times = 0;

  void createTimer() {
    times++;
    seconds = 30;
    setState(() {});
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds == 0) {
          timer.cancel();
        } else {
          seconds--;
        }
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (times > 2) {
      return const TextButton(
        onPressed: null,
        child: Text('Resend'),
      );
    }
    return TextButton(
      onPressed: seconds != 0
          ? null
          : () async {
              ErrorSnackBar.show(
                context,
                'OTP sent to ${1234567890}',
              );
              createTimer();
            },
      child: Text(
        seconds != 0
            ? 'Resend 00:${seconds.toString().padLeft(2, '0')}'
            : 'Resend',
      ),
    );
  }
}
