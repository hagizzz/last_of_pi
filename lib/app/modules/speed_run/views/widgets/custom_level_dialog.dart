import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLevelDialog extends StatelessWidget {
  CustomLevelDialog({super.key});

  final TextEditingController _controller = TextEditingController();

  void _handleSubmit() {
    final int? value = int.tryParse(_controller.text);
    if (value != null) {
      Get.back(result: value);
    } else {
      Get.snackbar('Error', 'Enter a validate number');
    }
  }

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
        backgroundColor: const Color(0xFF92DAFD),
        title: const Center(child: Text('Enter a number')),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ex 50...',
              ),
              onSubmitted: (_) => _handleSubmit(),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: ElevatedButton(
              onPressed: _handleSubmit,
              child: const Text("OK"),
            ),
          ),
        ],
      ),
    );
  }
}
