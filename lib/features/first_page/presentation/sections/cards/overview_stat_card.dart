import 'package:flutter/material.dart';
import 'package:scube/core/utils/text_utils.dart';
import 'package:scube/core/utils/ui_const.dart';

class OverviewStatCard extends StatelessWidget {
  final String value;
  final String title;
  final String iconAddress;
  const OverviewStatCard({
    super.key,
    required this.value,
    required this.title,
    required this.iconAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: radius(10)),
      child: Row(
        children: [
          Image.asset(iconAddress, height: 28, width: 28, fit: BoxFit.cover),
          gapW(10),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(value, style: TextUtils.b1Bold(context: context)),
              Text(title, style: TextUtils.b1Regular(context: context)),
            ],
          ),
        ],
      ),
    );
  }
}
