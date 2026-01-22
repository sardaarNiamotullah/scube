import 'package:flutter/material.dart';
import 'package:scube/core/constants/assets_img_const.dart';
import 'package:scube/core/utils/text_utils.dart';
import 'package:scube/core/utils/ui_const.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Column(
        children: [
          Image.asset(
            AssetsImgConst.logo,
            width: width ?? 90,
            height: height ?? 90,
          ),
          gapH(20),

          //================================
          // App title and tag line
          //================================
          Text(
            'SCUBE',
            style: TextUtils.title1(context: context, color: Colors.white),
          ),
          Text(
            'Control & Monitoring System',
            style: TextUtils.title1(context: context, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
