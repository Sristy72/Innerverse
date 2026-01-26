import 'package:flutter_khapree/core/common/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_khapree/features/auth/screens/login_screen.dart';
import 'package:flutx_core/core/theme/gap.dart';
import 'package:get/get.dart';

import '../../../core/common/widgets/button_widgets.dart';
import '../../../core/extensions/input_decoration_extensions.dart';
import '../widgets/applogo_with_title.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPassTEController = TextEditingController();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormState>();

  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPassFocus = FocusNode();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    Get.to(() => LoginScreen());
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

                        const Gap(h: 32),

                        Text(
                          'Reset password',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 12,),

                        Text(
                          'Set New Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 16),

                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Password', style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),),
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


                        SizedBox(height: 8,),

                        PrimaryButton(
                          onApiPressed: () => _submit(),
                          text: "Continue",
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
    );
  }
}
