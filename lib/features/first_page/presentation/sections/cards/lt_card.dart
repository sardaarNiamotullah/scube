import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scube/core/constants/assets_img_const.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/utils/text_utils.dart';
import 'package:scube/core/utils/ui_const.dart';
import 'package:scube/features/first_page/presentation/sections/cards/stat_card.dart';

class LtCard extends StatelessWidget {
  const LtCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    final List<Map<String, String>> totalStats = [
      {
        'title': 'Lifetime',
        'value': '1000 kW',
        'icon': AssetsImgConst.bluePower,
      },
      {
        'title': 'Today Energy',
        'value': '22 Jan 2026',
        'icon': AssetsImgConst.sandClock,
      },
      {
        'title': 'Total DC',
        'value': '1200 kW',
        'icon': AssetsImgConst.dualYellowPower,
      },
      {
        'title': 'Live Power',
        'value': '1000 kW',
        'icon': AssetsImgConst.livePower,
      },
    ];

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.black.withValues(alpha: .25),
        ),
      ),
      child: Column(
        children: [
          //===================================================================
          // Heading
          //===================================================================
          Container(
            padding: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: theme.primary.withAlpha(100),
                  width: .5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('LT_01', style: TextUtils.title3(context: context)),
                Row(
                  children: [
                    Image.asset(
                      AssetsImgConst.yellowPower,
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    gapW(5),
                    Text(
                      '495.5 kWp / 440 kW',
                      style: TextUtils.b1Bold(
                        context: context,
                        color: theme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          gapH(10),
          //===================================================================
          // Stat cards
          //===================================================================
          MasonryGridView.count(
            crossAxisCount: 2,
            itemCount: totalStats.length,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            padding: edgeInsetsZero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = totalStats[index];

              return StatCard(
                firstLine: item['title']!,
                secondLine: item['value']!,
                iconAddress: item['icon']!,
                isTotalCard: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
