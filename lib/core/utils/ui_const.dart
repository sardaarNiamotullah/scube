import 'package:flutter/material.dart';
import 'package:scube/core/themes/custom_theme.dart';

gapH(double number) => SizedBox(height: number);
gapW(double number) => SizedBox(width: number);

double cardRadius = 10;
double cardPadding = 12;

BorderRadius radiusCommon() => BorderRadius.circular(10);
BorderRadius radius(double radius) => BorderRadius.circular(radius);

EdgeInsets edgeInsetsZero = EdgeInsets.zero;

buttonShadow(BuildContext context) => [
  BoxShadow(
    color: CustomTheme.of(context).primary.withValues(alpha: 0.19),
    blurRadius: 20,
    offset: Offset(0, 12),
  ),
];
