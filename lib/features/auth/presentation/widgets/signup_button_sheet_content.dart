import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/constants/assets_svg_const.dart';
import 'package:scube/core/utils/bottom_sheet_utils.dart';
import 'package:scube/core/utils/text_utils.dart';
import 'package:scube/core/utils/ui_const.dart';
import 'package:scube/core/widgets/auth_bottom_text.dart';
import 'package:scube/core/widgets/button_primary.dart';
import 'package:scube/core/widgets/custom_input.dart';
import 'package:scube/features/auth/presentation/widgets/login_button_sheet_content.dart';
import 'package:scube/features/first_page/presentation/first_page.dart';

class SignupButtonSheetContent extends StatelessWidget {
  const SignupButtonSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        gapH(35),
        Text('Sign up', style: TextUtils.title1(context: context)),
        gapH(30),

        const CustomInput(hintText: 'Email'),
        gapH(15),

        const CustomInput(
          hintText: 'Password',
          isPasswordField: true,
          suffixIcon: AssetsSvgConst.eye,
        ),
        gapH(25),

        ButtonPrimary(
          text: 'Sign up',
          borderRadius: 10,
          onPressed: () {
            Get.to(() => const FirstPage());
          },
        ),
        gapH(10),

        Align(
          alignment: Alignment.center,
          child: AuthBottomText(
            mainText: 'Already have an account?  ',
            actionText: 'Login',
            onTap: () {
              BottomSheetUtils.updateContent(
                context,
                const LoginButtonSheetContent(),
              );
            },
          ),
        ),
      ],
    );
  }
}
