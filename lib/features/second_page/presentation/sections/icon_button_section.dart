import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scube/core/constants/assets_img_const.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/utils/ui_const.dart';
import 'package:scube/core/widgets/button_primary.dart';

class IconButtonSection extends StatelessWidget {
  const IconButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    final List<Map<String, String>> buttons = [
      {'title': 'Analysis Pro', 'icon': AssetsImgConst.chart},
      {'title': 'G. Generator', 'icon': AssetsImgConst.generator},
      {'title': 'Plant Summery', 'icon': AssetsImgConst.charge},
      {'title': 'Natural Gas', 'icon': AssetsImgConst.fire},
      {'title': 'D. Genertor', 'icon': AssetsImgConst.generator},
      {'title': 'Water Process', 'icon': AssetsImgConst.faucet},
    ];
    return MasonryGridView.count(
      crossAxisCount: 2,
      itemCount: buttons.length,
      mainAxisSpacing: 10,
      crossAxisSpacing: 15,
      shrinkWrap: true,
      padding: edgeInsetsZero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = buttons[index];

        return ButtonPrimary(
          text: item['title']!,
          onPressed: () {},
          leadingIcon: Image.asset(
            item['icon']!,
            height: 25,
            width: 25,
            fit: BoxFit.cover,
          ),
          borderRadius: 10,
          bgColor: Colors.white,
          textColor: theme.black,
          isCenter: false,
        );
      },
    );
  }
}
