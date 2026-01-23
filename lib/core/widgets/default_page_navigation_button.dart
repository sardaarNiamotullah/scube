import 'package:flutter/material.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/widgets/button_primary.dart';

class DefaultPageNavigationButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const DefaultPageNavigationButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonPrimary(
      text: text,
      onPressed: onPressed,
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
