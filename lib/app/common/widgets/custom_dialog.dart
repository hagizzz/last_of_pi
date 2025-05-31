import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? contentPadding;

  const CustomDialog({
    super.key,
    required this.title,
    required this.children,
    this.titlePadding,
    this.contentPadding,
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
        titlePadding:
            titlePadding ?? const EdgeInsets.only(top: 20, bottom: 20),
        contentPadding: contentPadding ?? const EdgeInsets.only(bottom: 30),
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        children: children,
      ),
    );
  }
}
