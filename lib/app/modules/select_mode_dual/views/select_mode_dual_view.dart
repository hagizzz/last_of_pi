import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_mode_dual_controller.dart';

class SelectModeDualView extends GetView<SelectModeDualController> {
  const SelectModeDualView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectModeDualView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SelectModeDualView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
