import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scube/core/constants/assets_img_const.dart';
import 'package:scube/features/first_page/presentation/sections/cards/overview_stat_card.dart';

class OverviewStatSection extends StatelessWidget {
  const OverviewStatSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> overviewStats = [
      {
        'value': '1000 kW',
        'title': 'Live AC Power',
        'icon': AssetsImgConst.acPower,
      },
      {
        'value': '82.58 %',
        'title': 'Plant Generation',
        'icon': AssetsImgConst.plantGeneration,
      },
      {'value': '85.61 %', 'title': 'Live PR', 'icon': AssetsImgConst.livePr},
      {
        'value': '27.58 %',
        'title': 'Comulative PR',
        'icon': AssetsImgConst.cumulativePr,
      },
      {
        'value': '1000 /-',
        'title': 'Return PV',
        'icon': AssetsImgConst.returnPv,
      },
      {
        'value': '10000 kWh',
        'title': 'Total Energy',
        'icon': AssetsImgConst.totalEnergy,
      },
    ];
    return MasonryGridView.count(
      crossAxisCount: 2,
      itemCount: overviewStats.length,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = overviewStats[index];

        return OverviewStatCard(
          value: item['value']!,
          title: item['title']!,
          iconAddress: item['icon']!,
        );
      },
    );
  }
}
