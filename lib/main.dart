import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_of_pi/app/common/retro_button.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';
import 'package:last_of_pi/app/logo.dart';
import 'package:last_of_pi/app/routes/app_pages.dart';
import 'package:last_of_pi/app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.surfacePrimary,
      systemNavigationBarColor: AppColors.surfacePrimary));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      title: 'Last of Pi',
      theme: AppTheme.lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                Header(),
                Logo(),
              ],
            ),
            Column(
              children: [
                RetroButton(
                  width: 250,
                  label: 'Play',
                  onPressed: () {
                    Get.toNamed(Routes.SELECT_MODE_SINGLE);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                RetroButton(
                  width: 250,
                  label: 'Dual',
                  onPressed: () {
                    Get.toNamed(Routes.SELECT_MODE_DUAL);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                RetroButton(
                  width: 250,
                  label: 'Statistics',
                  onPressed: () {
                    Get.toNamed(Routes.STATISTICS);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                RetroButton(
                  width: 250,
                  label: 'GIANG TEST',
                  onPressed: () {
                    Get.toNamed(Routes.TEST);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Last Of PI",
        style: GoogleFonts.modak(
          fontSize: 70,
        ),
      ),
    );
  }
}
