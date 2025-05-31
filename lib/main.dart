import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/retroButton.dart';
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
        scaffoldBackgroundColor: const Color(0xFF92DAFD),
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
                  width: 200,
                  label: 'PLAY',
                  onPressed: () {
                    Get.toNamed(Routes.SELECT_MODE_SINGLE);
                  },
                  
                ),
                const SizedBox(
                  height: 16,
                ),
                RetroButton(
                  width: 200,
                  label: 'DUAL',
                  onPressed: () {
                    Get.toNamed(Routes.SELECT_MODE_DUAL);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                RetroButton(
                  width: 200,
                  label: 'STATISTIC',
                  onPressed: () {
                    Get.toNamed(Routes.STATISTICS);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                RetroButton(
                  width: 200,
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

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
          // color: const Color(0xFFF2C078),
          borderRadius: BorderRadius.circular(100)),
      child: const Center(
        child: Text(
          "π",
          style: TextStyle(fontFamily: "Piedra", fontSize: 100),
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
      child: Container(
        color: Colors.amber,
        height: 60,
        width: MediaQuery.of(context).size.width / 1.5,
        child: const Center(
          child: Text(
            "Last Of Pi",
            style: TextStyle(fontFamily: "LuckiestGuy", fontSize: 30),
          ),
        ),
      ),
    );
  }
}
