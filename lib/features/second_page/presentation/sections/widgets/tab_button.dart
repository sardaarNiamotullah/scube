import 'package:flutter/material.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/utils/text_utils.dart';

class TabButton extends StatelessWidget {
  final String tabName;
  final bool isActive;
  const TabButton({super.key, required this.tabName, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: isActive ? theme.primary : Colors.white,
          border: Border(
            bottom: BorderSide(
              color: isActive ? Colors.transparent : theme.black,
              width: .5,
            ),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            tabName,
            style: TextUtils.b1Bold(
              context: context,
              color: isActive ? Colors.white : theme.black,
            ),
          ),
        ),
      ),
    );
  }
}
