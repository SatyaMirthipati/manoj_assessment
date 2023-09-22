import 'package:flutter/material.dart';
import 'package:manoj_assessment/resources/images.dart';
import 'package:manoj_assessment/ui/screens/auth/widgets/custom_button.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Log in')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Image.asset(Images.welcome, height: 400),
          const SizedBox(height: 40),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  '+91 ',
                  style: textTheme.bodySmall,
                ),
              ),
              hintText: 'Enter your phone number',
            ),
          ),
          const SizedBox(height: 40),
          CustomButton(
            onPressed: () {},
            text: 'Get Otp',
          ),
          SizedBox(height: 20),
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
