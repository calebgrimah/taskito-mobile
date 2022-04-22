import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskito_mobile/authentication/widgets/app_text_form_field.dart';
import 'package:taskito_mobile/util/colors.dart';
import 'package:taskito_mobile/util/constants.dart';
import 'package:taskito_mobile/util/strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.createAnAccount,
              style: GoogleFonts.poppins(
                  fontSize: FontSizes.headingLarge,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyDarkDark),
            ),
            SizedBox(height: 64,),
            Form(
              child: Padding(
                padding: EdgeInsets.symmetric( horizontal: 16.0),
                child: Column(
                  children: [
                    AppTextFormField(
                      hintText: AppStrings.name,
                      validator: (value) {},
                      isPasswordField: false,
                      keyboardType: TextInputType.name,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: AppTextFormField(
                        hintText: AppStrings.email,
                        validator: (value) {},
                        isPasswordField: false,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    AppTextFormField(
                      hintText: AppStrings.password,
                      validator: (value) {},
                      isPasswordField: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: AppTextFormField(
                        hintText: AppStrings.retypePassword,
                        validator: (value) {},
                        isPasswordField: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
