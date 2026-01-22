import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/utils/ui_const.dart';
import 'package:scube/core/widgets/appbar_common.dart';
import 'package:scube/core/widgets/default_margin_widget.dart';
import 'package:scube/core/widgets/default_page_navigation_button.dart';
import 'package:scube/features/first_page/presentation/first_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    return Scaffold(
      backgroundColor: theme.bgPrimary,
      appBar: appbarCommon(
        context,
        title: '2nd Page',
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
            DefaultPageNavigationButton(
              text: '1st Page Navigate',
              onPressed: () {
                Get.to(() => const FirstPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
