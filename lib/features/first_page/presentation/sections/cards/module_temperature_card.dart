import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scube/core/constants/assets_img_const.dart';
import 'package:scube/core/constants/assets_svg_const.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/utils/text_utils.dart';
import 'package:scube/core/utils/ui_const.dart';

class ModuleTemperatureCard extends StatelessWidget {
  const ModuleTemperatureCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.deepPurple, Colors.purple],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //===================================================================
          // White overview container (Module temperature)
          //===================================================================
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 10),
            // height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: .center,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '17',
                              style: TextUtils.title1(
                                context: context,
                                color: theme.primary,
                              ),
                            ),
                            TextSpan(
                              text: ' °C',
                              style: TextUtils.title3(
                                context: context,
                                color: theme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      gapH(10),
                      Text(
                        'Module \nTemperature',
                        style: TextUtils.caption1(context: context),
                      ),
                    ],
                  ),
                  gapW(10),
                  Image.asset(AssetsImgConst.thermometer, height: 85),
                ],
              ),
            ),
          ),
          gapW(15),

          //===================================================================
          // Stats column (Wind + Irradiation)
          //===================================================================
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH(8),
              Text(
                '26 MPH / NW',
                style: TextUtils.b1Bold(context: context, color: Colors.white),
              ),
              Text(
                'Wind Speed',
                style: TextUtils.caption1(
                  context: context,
                  color: theme.bgPrimary,
                ),
              ),
              gapH(4),

              const SizedBox(
                width: 40,
                child: Divider(color: Colors.white, thickness: 1),
              ),
              gapH(4),

              Text(
                '15.20 w/m²',
                style: TextUtils.b1Bold(context: context, color: Colors.white),
              ),
              Text(
                'Effective Irradiation',
                style: TextUtils.caption1(
                  context: context,
                  color: theme.bgPrimary,
                ),
              ),
              gapH(8),
            ],
          ),
          gapW(10),

          //===================================================================
          // Weather icon section
          //===================================================================
          SvgPicture.asset(AssetsSvgConst.cloudy, height: 40, width: 40),
        ],
      ),
    );
  }
}
