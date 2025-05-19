import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';
import 'package:last_of_pi/app/routes/app_pages.dart';

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
      theme: ThemeData(
        fontFamily: 'Inter',
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.surfacePrimary,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.ADVENTURE);
            },
            child: const Text("Adventure",
                style:
                    TextStyle(color: AppColors.contentPrimary, fontSize: 32)),
          ),
        ),
        const Gap(16),
        Center(
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.STATISTICS);
            },
            child: const Text("Statistics",
                style:
                    TextStyle(color: AppColors.contentPrimary, fontSize: 32)),
          ),
        )
      ]),
    );
  }
}
