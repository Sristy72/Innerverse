import 'package:flutter/material.dart';
import 'package:flutter_khapree/core/common/widgets/app_scaffold.dart';
import 'package:flutter_khapree/features/auth/screens/verify_otp_screen.dart';
import 'package:flutter_khapree/features/auth/widgets/applogo_with_title.dart';
import 'package:get/get.dart';

import '../../../core/common/widgets/button_widgets.dart';
import '../../../core/extensions/input_decoration_extensions.dart';
import '../../../core/util/validators.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailCOntroller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    Get.to(() => VerifyOtpScreen());
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
              //padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // 🔥 IMPORTANT
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ApplogoWithTitle(),

                    const SizedBox(height: 32),

                    const Text(
                      'Reset password',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Enter your email to receive the OTP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 36),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _emailCOntroller,
                      focusNode: _focusNode,
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                      decoration: context.primaryInputDecoration().copyWith(
                        hintText: "Enter your Email",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        fillColor: const Color(0xFF093672),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                      ),
                      validator: Validators.email,
                      autofillHints: const [AutofillHints.email],
                    ),

                    const SizedBox(height: 36),

                    PrimaryButton(onApiPressed: _submit, text: "Send OTP"),
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
