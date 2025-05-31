import 'package:flutter/material.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';

class RetroButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final EdgeInsets padding;

  const RetroButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 250,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  });

  @override
  State<RetroButton> createState() => _RetroButtonState();
}

class _RetroButtonState extends State<RetroButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        width: widget.width,
        duration: const Duration(milliseconds: 100),
        transform: _isPressed
            ? Matrix4.translationValues(2, 2, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: _isPressed
              ? []
              : [
                  const BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 0,
                  ),
                ],
        ),
        padding: widget.padding,
        child: Center(
          child: Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
