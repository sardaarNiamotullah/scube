import 'package:flutter/material.dart';
import 'package:scube/core/constants/assets_img_const.dart';
import 'package:scube/core/utils/text_utils.dart';
import 'package:scube/core/utils/ui_const.dart';
import 'package:scube/features/second_page/presentation/sections/widgets/data_view_card.dart';
import 'package:scube/features/second_page/presentation/sections/widgets/pie_chart.dart';
import 'package:scube/features/second_page/presentation/sections/widgets/source_load_widget.dart';
import 'package:scube/features/second_page/presentation/sections/widgets/tab_button.dart';

class ElectricityStatSection extends StatelessWidget {
  const ElectricityStatSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: radius(10), color: Colors.white),
      child: Column(
        children: [
          //===================================================================
          // Tabs
          //===================================================================
          _buildTabs(context),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                gapH(10),
                //===================================================================
                // Electricity section heading
                //===================================================================
                Text('Electricity', style: TextUtils.b1Bold(context: context)),
                Divider(color: Colors.black.withAlpha(100), thickness: 1),
                gapH(10),

                //===================================================================
                // Pie chart
                //===================================================================
                PieChart(value: .65, powerText: '5.53 kw'),
                gapH(20),

                //===================================================================
                // Source / Load toggle (UI only)
                //===================================================================
                SizedBox(width: 250, child: SourceLoadWidget()),
                Divider(color: Colors.black.withAlpha(120), thickness: 1.3),

                //===================================================================
                // Data view cards
                //===================================================================
                DataViewCard(iconLocation: AssetsImgConst.solarCell),
                gapH(10),
                DataViewCard(iconLocation: AssetsImgConst.asset),
                gapH(10),
                DataViewCard(iconLocation: AssetsImgConst.powerTower),
                gapH(10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs(BuildContext context) {
    return Row(
      children: [
        TabButton(tabName: 'Summery', isActive: true),
        TabButton(tabName: 'SLD', isActive: false),
        TabButton(tabName: 'Data', isActive: false),
      ],
    );
  }
}
