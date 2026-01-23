import 'package:flutter/material.dart';
import 'package:scube/core/utils/text_utils.dart';
import 'package:scube/core/utils/ui_const.dart';

class SourceLoadWidget extends StatelessWidget {
  const SourceLoadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: radius(30),
      ),
      child: Row(
        children: [
          _BottomTab(title: 'Source', isActive: true),
          _BottomTab(title: 'Load'),
        ],
      ),
    );
  }
}

class _BottomTab extends StatelessWidget {
  final String title;
  final bool isActive;

  const _BottomTab({required this.title, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.transparent,
          borderRadius: radius(25),
        ),
        child: Center(
          child: Text(
            title,
            style: TextUtils.b1Regular(
              context: context,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
