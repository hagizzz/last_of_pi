import 'dart:math';

import 'package:flutter/material.dart';

class ShakeError extends StatefulWidget {
  final Widget child;

  const ShakeError({required Key key, required this.child}) : super(key: key);

  @override
  State<ShakeError> createState() => ShakeErrorState();
}

class ShakeErrorState extends State<ShakeError>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final double offset = sin(_animationController.value * 2 * pi * 4) * 8;

    return Transform.translate(
      offset: Offset(offset, 0),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void shake() {
    _animationController
        .forward(from: 0)
        .then((value) => _animationController.reverse());
  }
}
