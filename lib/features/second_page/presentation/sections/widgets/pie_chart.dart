import 'package:flutter/material.dart';
import 'package:scube/core/utils/text_utils.dart';
import 'package:scube/core/utils/ui_const.dart';

class PieChart extends StatelessWidget {
  final double value; // 0.0 → 1.0
  final String powerText;
  const PieChart({super.key, required this.value, required this.powerText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 130,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 130,
            width: 130,
            child: CircularProgressIndicator(
              value: value,
              strokeWidth: 20,
              backgroundColor: Colors.blue.shade100,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Total Power', style: TextUtils.caption1(context: context)),
              gapH(4),
              Text(powerText, style: TextUtils.b1Bold(context: context)),
            ],
          ),
        ],
      ),
    );
  }
}
