import 'package:flutter/material.dart';
import 'package:sumbertugu/commons/colors.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.hint,
      this.suffixIcon,
      this.onTapSuffixIcon,
      this.obscureText = false,
      this.validator,
      this.onChanged,
      this.onEditingComplete,
      this.controller,
      required this.prefixIcon,
      this.filled = false,
      this.enabled = true,
      this.initialValue});
  String hint;
  IconData prefixIcon;
  IconData? suffixIcon;
  VoidCallback? onTapSuffixIcon;
  bool obscureText;
  bool filled;
  bool enabled;
  String? initialValue;

  TextEditingController? controller;
  Function()? onEditingComplete;

  String? Function(String?)? validator;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        initialValue: initialValue,
        onEditingComplete: onEditingComplete,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0.0,
            ),
          ),
          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(40),
          //   borderSide: const BorderSide(color: Colors.red),
          // ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(40),
          //   borderSide: const BorderSide(color: Colors.red),
          // ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: "Inter",
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: MyColors.primary,
            size: 25,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              suffixIcon,
              color: MyColors.primary,
              size: 25,
            ),
            onPressed: onTapSuffixIcon,
          ),
          filled: filled,
          // enabled: enabled,
        ),
      ),
    );
  }
}
