import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manoj_assessment/ui/screens/auth/widgets/error_snackbar.dart';
import 'package:manoj_assessment/ui/screens/auth/widgets/resend_otp_button.dart';

import '../../../resources/colors.dart';
import '../../../resources/images.dart';
import 'widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  static Future open(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OtpScreen(),
      ),
    );
  }

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pinController = TextEditingController();
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        _onOtpFieldFocusChanged(i);
      });
    }
  }

  void _onOtpFieldFocusChanged(int index) {
    if (_focusNodes[index].hasFocus) {
      FocusScope.of(context).requestFocus(_focusNodes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: MyColors.border, width: 1),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Otp Verify')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 40),
          Image.asset(Images.welcome, height: 280),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Enter the OTP sent to XXXXXX${7890}',
                  style: textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: '   Edit',
                      style: textTheme.titleLarge!.copyWith(
                          fontSize: 15, color: Colors.black.withOpacity(0.8)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                    )
                  ],
                ),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.edit, size: 20)
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: 50,
                    child: TextFormField(
                      autofocus: index == 0,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(1),
                      ],
                      focusNode: _focusNodes[index],
                      onFieldSubmitted: (_) {
                        if (index < 3) {
                          FocusScope.of(context).requestFocus(
                            _focusNodes[index + 1],
                          );
                        }
                      },
                      textInputAction: index < 3
                          ? TextInputAction.next
                          : TextInputAction.done,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Did not receive OTP ? ',
                style: textTheme.labelSmall!.copyWith(fontSize: 12),
              ),
              const Column(
                children: [
                  SizedBox(height: 2),
                  ResendOtpButton(),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          CustomButton(
            width: double.infinity,
            onPressed: () {
              ErrorSnackBar.show(
                context,
                'Your details has been submitted',
              );
            },
            text: 'Verify Otp',
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
