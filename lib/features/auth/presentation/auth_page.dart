import 'package:flutter/material.dart';
import 'package:scube/core/helper/common_helper.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/utils/bottom_sheet_utils.dart';
import 'package:scube/core/utils/ui_const.dart';
import 'package:scube/core/widgets/logo_widget.dart';

class AuthPage extends StatefulWidget {
  final Widget bottomSheetContent;
  final Duration bottomSheetDelay;

  const AuthPage({
    super.key,
    required this.bottomSheetContent,
    this.bottomSheetDelay = const Duration(seconds: 0),
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _hasShownBottomSheet = false;

  @override
  void initState() {
    super.initState();
    _setupBottomSheetTimer();
  }

  void _setupBottomSheetTimer() {
    Future.delayed(widget.bottomSheetDelay, () {
      if (mounted && !_hasShownBottomSheet) {
        _showBottomSheet();
      }
    });
  }

  void _showBottomSheet() {
    if (_hasShownBottomSheet) return;
    setState(() => _hasShownBottomSheet = true);

    //==================================================================================
    // Main auth content(Sign up/ Log in) lies in this bottomsheet
    //==================================================================================
    BottomSheetUtils.showAuthBottomSheet(
      context,
      content: widget.bottomSheetContent,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        backgroundColor: theme.primary,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                gapH(80),
                //================================
                // Logo
                //================================
                LogoWidget(),
                gapH(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
