import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskito_mobile/authentication/widgets/app_text_form_field.dart';
import 'package:taskito_mobile/util/colors.dart';
import 'package:taskito_mobile/util/constants.dart';
import 'package:taskito_mobile/util/strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.login,
              style: GoogleFonts.poppins(
                  fontSize: FontSizes.headingLarge,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyDarkDark),
            ),
            const SizedBox(
              height: 64,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(children: [
                  AppTextFormField(
                    hintText: AppStrings.email,
                    validator: (value) {},
                    isPasswordField: false,
                    keyboardType: TextInputType.name,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 32),
                    child: AppTextFormField(
                      hintText: AppStrings.password,
                      validator: (value) {},
                      isPasswordField: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 16),
                            child: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                  fontSize: FontSizes.bodyLarge,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white),
                            ),
                          ),
                          color: AppColors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          elevation: .5,
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
