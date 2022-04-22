import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskito_mobile/util/colors.dart';
import 'package:taskito_mobile/util/constants.dart';

class AppTextFormField extends StatefulWidget {
  final String hintText;
  final Function(Object?) validator;

  final bool isPasswordField;
  final TextInputType keyboardType;

  const AppTextFormField(
      {Key? key,
      required this.hintText,
      required this.validator,
      this.isPasswordField = false,
      required this.keyboardType})
      : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  final textFieldFocusNode = FocusNode();

  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        widget.validator(value);
      },
      style: const TextStyle(fontSize: 15.0, color: Colors.black),
      obscureText: widget.isPasswordField && _obscured,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(
            fontSize: FontSizes.body, color: AppColors.greyDark),
        filled: true,
        fillColor: AppColors.greyLight,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.purpleLight),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyLight),
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: widget.isPasswordField
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                child: GestureDetector(
                  onTap: _toggleObscured,
                  child: Icon(
                    _obscured
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 24,
                    color: AppColors.greyDark,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
