import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/utils/text_utils.dart';

appbarCommon(
  BuildContext context, {
  String? title,
  bool hasBackButton = true,
  IconData? backIcon,
  bool centerTitle = true,
  actions,
  VoidCallback? onBackPressed,
  Widget? backButtonWidget,
  Color? bgColor,
  double? leadingWidth,
  bool showShadow = false,
  TextStyle? titleStyle,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),

    child: AppBar(
      scrolledUnderElevation: 0.5,
      surfaceTintColor: Colors.transparent,
      shadowColor: showShadow ? Colors.black54 : Colors.transparent,
      centerTitle: centerTitle ? true : false,
      backgroundColor: bgColor ?? Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        title ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style:
            titleStyle ??
            TextUtils.title3(context: context, color: Colors.black),
      ),
      elevation: .3,
      actions: actions,
      leadingWidth: leadingWidth ?? 55,
      leading: hasBackButton
          ? InkWell(
              onTap:
                  onBackPressed ??
                  () {
                    Get.back();
                  },
              child:
                  backButtonWidget ??
                  Icon(
                    backIcon ?? Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  ),
            )
          : Container(),
    ),
  );
}
