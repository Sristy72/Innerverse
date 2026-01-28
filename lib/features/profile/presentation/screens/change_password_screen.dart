import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/elevated_button.dart';
import '../../../../core/extensions/input_decoration_extensions.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final FocusNode _newPasswordFocus = FocusNode();
  final FocusNode _confirmNewPasswordFocus = FocusNode();
  final FocusNode _currentPassFocus = FocusNode();

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // final _profileController = Get.find<ProfileController>();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  Future _submit() async {
    if (!_formKey.currentState!.validate()) return;
    // _profileController.changePassword(_currentPasswordController.text, _newPasswordController.text, _confirmNewPasswordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 76),
            SizedBox(
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            ValueListenableBuilder<bool>(
              valueListenable: _obscurePassword,
              builder: (context, obscure, _) {
                return TextFormField(
                  controller: _currentPasswordController,
                  focusNode: _currentPassFocus,
                  obscureText: obscure,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(color: Colors.white),
                  decoration: context.primaryInputDecoration().copyWith(
                    hintText: "Current Password",
                    filled: false,
                  fillColor: Colors.transparent,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                     border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF97BBD3)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF97BBD3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF97BBD3)),
                  ),
                  ),
                  // validator: Validators.password,
                  autofillHints: const [AutofillHints.password],
                );
              },
            ),

            SizedBox(height: 16),
            ValueListenableBuilder<bool>(
              valueListenable: _obscurePassword,
              builder: (context, obscure, _) {
                return TextFormField(
                  controller: _newPasswordController,
                  focusNode: _newPasswordFocus,
                  cursorColor: Colors.white,
                  obscureText: obscure,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(color: Colors.white),
                  decoration: context.primaryInputDecoration().copyWith(
                    hintText: "New Password",
                    filled: false,
                  fillColor: Colors.transparent,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                     border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF97BBD3)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF97BBD3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF97BBD3)),
                  ),
                  ),
                  // validator: Validators.password,
                  autofillHints: const [AutofillHints.password],
                );
              },
            ),

            SizedBox(height: 16),

            ValueListenableBuilder<bool>(
              valueListenable: _obscurePassword,
              builder: (context, obscure, _) {
                return TextFormField(
                  controller: _confirmNewPasswordController,
                  focusNode: _confirmNewPasswordFocus,
                  cursorColor: Colors.white,
                  obscureText: obscure,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(color: Colors.white),
                  decoration: context.primaryInputDecoration().copyWith(
                    hintText: "Confirm New Password",
                    filled: false,
                  fillColor: Colors.transparent,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                     border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF97BBD3)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF97BBD3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF97BBD3)),
                  ),
                  ),
                  
                  // validator: Validators.password,
                  autofillHints: const [AutofillHints.password],
                );
              },
            ),

            SizedBox(height: 16),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2058E6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          
          ],
        ),
      ),
    );
  }
}
