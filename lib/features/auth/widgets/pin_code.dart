import 'package:flutter/material.dart';
import 'package:flutter_khapree/core/util/validators.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCode extends StatelessWidget {
  const PinCode({super.key, required this.otpController});
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: otpController,
      appContext: context,
      length: 6,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      autoFocus: false,
      validator: Validators.number,

      obscureText: true,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),

      cursorColor: Colors.black,
      enableActiveFill: true,

      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 56,
        fieldWidth: 50,

        inactiveColor: Colors.transparent,
        activeColor: Colors.transparent,
        selectedColor: Colors.transparent,

        inactiveFillColor: Color(0xFFFCFDFF),
        activeFillColor: Color(0xFFFCFDFF),
        selectedFillColor: Color(0xFFFCFDFF),
      ),
    );
  }
}
