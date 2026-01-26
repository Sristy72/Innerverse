import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_khapree/core/common/widgets/app_scaffold.dart';
import 'package:flutter_khapree/features/auth/screens/reset_password_screen.dart';
import 'package:flutter_khapree/features/auth/widgets/applogo_with_title.dart';
import 'package:get/get.dart';

import '../../../core/common/widgets/button_widgets.dart';
import '../widgets/pin_code.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpVerify = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    Get.to(() => ResetPasswordScreen());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 0,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                ),

                    ApplogoWithTitle(),

                    const SizedBox(height: 32),

                    const Text(
                      'Enter OTP',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 24),

                    PinCode(otpController: _otpVerify),

                    const SizedBox(height: 32),

                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Didn\'t Receive OTP? ',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'RESEND OTP',
                            style: const TextStyle(
                              color: Color(0xFF0055FF),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // resend logic
                              },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    PrimaryButton(onApiPressed: _submit, text: "Verify Now"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
