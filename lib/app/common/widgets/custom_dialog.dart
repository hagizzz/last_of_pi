import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const CustomDialog({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Get.back();
          Future.delayed(const Duration(milliseconds: 100), () {
            Get.back();
          });
        }
      },
      child: SimpleDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Center(child: Text(title)),
        titlePadding: const EdgeInsets.only(top: 20, bottom: 20),
        contentPadding: const EdgeInsets.only(bottom: 30),
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        children: children,
      ),
    );
  }
}
