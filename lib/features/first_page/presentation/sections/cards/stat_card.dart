import 'package:flutter/material.dart';
import 'package:scube/core/utils/text_utils.dart';
import 'package:scube/core/utils/ui_const.dart';

class StatCard extends StatelessWidget {
  final String firstLine;
  final String secondLine;
  final String iconAddress;
  final bool isTotalCard;

  const StatCard({
    super.key,
    required this.firstLine,
    required this.secondLine,
    required this.iconAddress,
    this.isTotalCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: isTotalCard ? 5 : 15,
      ),
      decoration: BoxDecoration(color: Colors.white, borderRadius: radius(10)),
      child: Row(
        children: [
          Image.asset(iconAddress, height: 28, width: 28, fit: BoxFit.cover),
          gapW(10),

          //===================================================================
          // Text section (ellipsis-safe)
          //===================================================================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  firstLine,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: isTotalCard
                      ? TextUtils.b1Regular(context: context)
                      : TextUtils.b1Bold(context: context),
                ),
                Text(
                  secondLine,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: isTotalCard
                      ? TextUtils.b1Bold(context: context)
                      : TextUtils.b1Regular(context: context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
