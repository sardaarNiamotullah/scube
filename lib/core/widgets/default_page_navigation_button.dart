import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/widgets/button_primary.dart';
import 'package:scube/features/second_page/presentation/second_page.dart';

class DefaultPageNavigationButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const DefaultPageNavigationButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ButtonPrimary(
      text: '2nd Page Navigate',
      onPressed: () {
        Get.to(() => const SecondPage());
      },
      bgColor: CustomTheme.of(context).cyan,
      borderRadius: 10,
      trailingIcon: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white,
        size: 14,
      ),
    );
  }
}
