import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/utils/ui_const.dart';
import 'package:scube/core/widgets/appbar_common.dart';
import 'package:scube/core/widgets/button_primary.dart';
import 'package:scube/core/widgets/default_margin_widget.dart';
import 'package:scube/features/first_page/presentation/sections/cards/module_temperature_card.dart';
import 'package:scube/features/first_page/presentation/sections/overview_stat_section.dart';
import 'package:scube/features/second_page/presentation/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    return Scaffold(
      backgroundColor: theme.bgPrimary,
      appBar: appbarCommon(
        context,
        title: '1st Page',
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: DefaultMarginWidget(
        child: Column(
          children: [
            gapH(15),
            //===================================================================
            // Navigation button
            //===================================================================
            ButtonPrimary(
              text: '2nd Page Navigate',
              onPressed: () {
                Get.to(() => const SecondPage());
              },
              bgColor: theme.cyan,
              borderRadius: 10,
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 14,
              ),
            ),
            gapH(20),

            //===================================================================
            // Overview stats section
            //===================================================================
            const OverviewStatSection(),
            gapH(20),

            //===================================================================
            // Temp module section
            //===================================================================
            const ModuleTemperatureCard(),
          ],
        ),
      ),
    );
  }
}
