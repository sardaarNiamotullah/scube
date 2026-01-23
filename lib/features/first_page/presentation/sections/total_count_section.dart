import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scube/core/constants/assets_img_const.dart';
import 'package:scube/core/utils/text_utils.dart';
import 'package:scube/core/utils/ui_const.dart';
import 'package:scube/features/first_page/presentation/sections/cards/stat_card.dart';

class TotalCountSection extends StatelessWidget {
  const TotalCountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> totalStats = [
      {'title': 'Total AC', 'value': '1000 kW', 'icon': AssetsImgConst.totalAc},
      {'title': 'Date', 'value': '22 Jan 2026', 'icon': AssetsImgConst.date},
      {
        'title': 'Inverter No.',
        'value': '12',
        'icon': AssetsImgConst.inverterNumber,
      },
      {'title': 'Total DC', 'value': '1200 kW', 'icon': AssetsImgConst.totalDc},
      {
        'title': 'Total PV',
        'value': '6372 pcs',
        'icon': AssetsImgConst.totalPv,
      },
      {'title': 'Total AC', 'value': '1000 kW', 'icon': AssetsImgConst.totalAc},
    ];

    return Column(
      children: [
        //===================================================================
        // Main total count cards
        //===================================================================
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radius(10),
          ),
          child: Row(
            children: [
              Image.asset(
                AssetsImgConst.totalPv,
                height: 28,
                width: 28,
                fit: BoxFit.cover,
              ),
              gapW(10),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Total Num of PV Module: ',
                        style: TextUtils.b1Regular(context: context),
                      ),
                      TextSpan(
                        text: '6372 pcs. (585 Wp each)',
                        style: TextUtils.b1Bold(context: context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        gapH(10),
        //===================================================================
        // Sub total counts
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
    );
  }
}
