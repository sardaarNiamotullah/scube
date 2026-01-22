import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/widgets/logo_widget.dart';
import 'package:scube/features/auth/presentation/auth_page.dart';
import 'package:scube/features/auth/presentation/widgets/signup_button_sheet_content.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthState();
  }

  Future<void> _checkAuthState() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    Get.offAll(() => AuthPage(bottomSheetContent: SignupButtonSheetContent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.of(context).primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [LogoWidget()],
        ),
      ),
    );
  }
}
