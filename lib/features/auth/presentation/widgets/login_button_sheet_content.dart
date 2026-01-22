import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/constants/assets_svg_const.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/utils/bottom_sheet_utils.dart';
import 'package:scube/core/utils/text_utils.dart';
import 'package:scube/core/utils/ui_const.dart';
import 'package:scube/core/widgets/auth_bottom_text.dart';
import 'package:scube/core/widgets/button_primary.dart';
import 'package:scube/core/widgets/custom_input.dart';
import 'package:scube/features/auth/presentation/widgets/signup_button_sheet_content.dart';
import 'package:scube/features/first_page/presentation/first_page.dart';

class LoginButtonSheetContent extends StatelessWidget {
  const LoginButtonSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        gapH(35),
        Text('Log in', style: TextUtils.title1(context: context)),
        gapH(30),

        const CustomInput(hintText: 'Username'),
        gapH(15),

        const CustomInput(
          hintText: 'Password',
          isPasswordField: true,
          suffixIcon: AssetsSvgConst.eye,
        ),
        gapH(25),

        ButtonPrimary(
          text: 'Log in',
          borderRadius: 10,
          onPressed: () {
            Get.to(() => const FirstPage());
          },
        ),
        gapH(5),

        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot passord?',
            style: TextUtils.caption1(context: context).copyWith(
              decoration: TextDecoration.underline,
              decorationColor: CustomTheme.of(context).black,
            ),
          ),
        ),
        gapH(15),

        Align(
          alignment: Alignment.center,
          child: AuthBottomText(
            mainText: 'Don\'t have an account?  ',
            actionText: 'Register Now',
            onTap: () {
              BottomSheetUtils.updateContent(
                context,
                const SignupButtonSheetContent(),
              );
            },
          ),
        ),
      ],
    );
  }
}
