import 'package:flutter/material.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/utils/text_utils.dart';
import 'package:scube/core/utils/ui_const.dart';

class DataViewCard extends StatelessWidget {
  final String iconLocation;
  const DataViewCard({super.key, required this.iconLocation});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.bgPrimary,
        borderRadius: radius(10),
        border: Border.all(color: Colors.black.withAlpha(100), width: 1),
      ),
      child: ListTile(
        dense: true,
        leading: Image.asset(iconLocation, height: 25, width: 25),

        title: Row(
          children: [
            Icon(Icons.square_rounded, size: 16, color: theme.cyan),
            gapW(5),
            Text('Data View', style: TextUtils.b1Bold(context: context)),
            gapW(15),
            Text(
              '(Active)',
              style: TextUtils.b1SmallBold(
                context: context,
                color: theme.primary,
              ),
            ),
          ],
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Data 1       : ',
                    style: TextUtils.b1Regular(context: context),
                  ),
                  TextSpan(
                    text: '555985',
                    style: TextUtils.b1Bold(context: context),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Data 2      : ',
                    style: TextUtils.b1Regular(context: context),
                  ),
                  TextSpan(
                    text: '555985',
                    style: TextUtils.b1Bold(context: context),
                  ),
                ],
              ),
            ),
          ],
        ),

        trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16),
      ),
    );
  }
}
