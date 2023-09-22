import 'package:flutter/material.dart';
import 'package:manoj_assessment/ui/screens/auth/otp_screen.dart';

import '../../../resources/images.dart';
import 'widgets/custom_button.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Log in')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 40),
          Image.asset(Images.welcome, height: 280),
          const SizedBox(height: 40),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Text('+91 ', style: textTheme.bodySmall),
              ),
              hintText: 'Enter your phone number',
            ),
          ),
          const SizedBox(height: 40),
          CustomButton(
            width: double.maxFinite,
            onPressed: () => OtpScreen.open(context),
            text: 'Get Otp',
          ),
          const SizedBox(height: 20),
          Text(
            'By signing up, you agree with our Terms and Conditions',
            style: textTheme.titleSmall!.copyWith(
              color: Colors.black.withOpacity(0.6),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
