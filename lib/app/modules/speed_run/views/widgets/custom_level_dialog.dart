import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/retro_button.dart';
import 'package:last_of_pi/app/common/widgets/custom_dialog.dart';

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
    return CustomDialog(
      title: 'Enter a number',
      children: [
        Center(
          child: SizedBox(
            width: 200,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '50',
              ),
              onSubmitted: (_) => _handleSubmit(),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: RetroButton(
            onPressed: _handleSubmit,
            label: "OK",
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: 200,
          ),
        ),
      ],
    );
  }
}
