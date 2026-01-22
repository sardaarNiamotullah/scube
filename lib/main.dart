import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/themes/light_theme.dart';
import 'package:scube/features/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      customThemeData: lightTheme,
      child: GetMaterialApp(
        title: 'SCUBE',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          scaffoldBackgroundColor: Color(0xffF7F7F7),
        ),
        home: SplashPage(),
      ),
    );
  }
}
