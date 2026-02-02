import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_khapree/core/common/widgets/app_scaffold.dart';
import 'package:flutter_khapree/features/auth/screens/login_screen.dart';
import 'package:flutx_core/core/theme/gap.dart';
import 'package:get/get.dart';

import '../../../core/common/constants/app_colors.dart';
import '../../../core/common/widgets/button_widgets.dart';
import '../../../core/extensions/input_decoration_extensions.dart';
import '../../../core/util/validators.dart';
import '../widgets/applogo_with_title.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPassTEController = TextEditingController();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _agreeToTerms = ValueNotifier<bool>(false);

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPassFocus = FocusNode();

  @override
  void dispose() {
    _nameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _phoneTEController.dispose();
    _confirmPassTEController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _obscurePassword.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_agreeToTerms.value) {
      Get.snackbar(
        "Terms Required",
        "You must agree to the Terms of Service to sign up.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Pass data to AuthController (you can extend AuthController to handle signup)

    // await _authCtrl.register(_nameController.text.trim(), _emailController.text.trim(), _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Gap(h: 100),
                      ApplogoWithTitle(),

                      const Gap(h: 20),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      /// [Text Field] Email
                      SizedBox(height: 8),

                      TextFormField(
                        controller: _nameTEController,
                        focusNode: _nameFocus,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        decoration: context.primaryInputDecoration().copyWith(
                          hintText: "Enter your Full Name",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          //filled: true,                     // ✅ Make background color visible
                          fillColor: Color(0xFF093672),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ),
                        ),
                        validator: Validators.name,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_nameFocus),
                        autofillHints: const [AutofillHints.name],
                      ),

                      SizedBox(height: 8),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(height: 8,),

                      TextFormField(
                        controller: _emailTEController,
                        focusNode: _emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,

                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        decoration: context.primaryInputDecoration().copyWith(
                          hintText: "Enter your Email",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          //filled: true,                     // ✅ Make background color visible
                          fillColor: Color(0xFF093672),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                        ),
                        validator: Validators.email,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_emailFocus),
                        autofillHints: const [AutofillHints.email],
                      ),

                      SizedBox(height: 8),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Phone Number',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(height: 8,),

                      TextFormField(
                        controller: _phoneTEController,
                        focusNode: _phoneFocus,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,

                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        decoration: context.primaryInputDecoration().copyWith(
                          hintText: "Enter your Phone Number",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          //filled: true,                     // ✅ Make background color visible
                          fillColor: Color(0xFF093672),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                        validator: Validators.phone,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_phoneFocus),
                        autofillHints: const [AutofillHints.telephoneNumber],
                      ),


                      SizedBox(height: 8),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(height: 8),

                      /// [Text field] Password
                      ValueListenableBuilder<bool>(
                        valueListenable: _obscurePassword,
                        builder: (context, obscure, _) {
                          return TextFormField(
                            controller: _passwordTEController,
                            focusNode: _passwordFocus,
                            obscureText: obscure,
                            textInputAction: TextInputAction.done,
                            style: const TextStyle(color: Colors.white),
                            decoration: context.primaryInputDecoration().copyWith(
                              hintText: "Enter your Password",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              //filled: true,                     // ✅ Make background color visible
                              fillColor: Color(0xFF093672),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.grey
                                ),
                                onPressed: () =>
                                    _obscurePassword.value = !obscure,
                              ),
                            ),

                            //validator: Validators.password,
                            autofillHints: const [AutofillHints.password],
                          );
                        },
                      ),

                      SizedBox(height: 8),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(height: 8),

                      ValueListenableBuilder<bool>(
                        valueListenable: _obscurePassword,
                        builder: (context, obscure, _) {
                          return TextFormField(
                            controller: _confirmPassTEController,
                            focusNode: _confirmPassFocus,
                            obscureText: obscure,
                            textInputAction: TextInputAction.done,
                            style: const TextStyle(color: Colors.white),
                            decoration: context.primaryInputDecoration().copyWith(
                              hintText: "Confirm a Password",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              //filled: true,                     // ✅ Make background color visible
                              fillColor: Color(0xFF093672),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                    obscure
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.grey
                                ),
                                onPressed: () =>
                                _obscurePassword.value = !obscure,
                              ),
                            ),

                            // validator: Validators.password,
                            autofillHints: const [AutofillHints.password],
                          );
                        },
                      ),
                      Gap.h12,

                      ValueListenableBuilder<bool>(
                        valueListenable: _agreeToTerms,
                        builder: (context, agreed, _) {
                          return Row(
                            children: [
                              Checkbox(
                                activeColor: Color(0xFF00C16A),
                                checkColor: Colors.black,
                                side: const BorderSide(
                                  color: Color(0xFFFFFFFF),
                                ),
                                value: agreed,
                                onChanged: (value) {
                                  _agreeToTerms.value = value ?? false;
                                },
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'I agree to the Terms and Conditions and Privacy Policy',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: const TextStyle(
                                          color: Color(0xFFF76C5E),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      SizedBox(height: 8,),

                      PrimaryButton(
                        onApiPressed: () => _submit(),
                        text: "Sign up",
                      ),

                      const Gap(h: 24),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign in here',
                                style: const TextStyle(
                                  color: Color(0xFF0055FF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(
                                      () => (const LoginScreen()),
                                      transition: Transition.rightToLeft,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),

                      const Gap(h: 40),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
