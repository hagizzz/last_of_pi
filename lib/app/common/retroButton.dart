import 'package:flutter/material.dart';

class RetroButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;

  const RetroButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.width,
  });

  @override
  State<RetroButton> createState() => _RetroButtonState();
}

class _RetroButtonState extends State<RetroButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    const Color neonGreen = Color(0xFFDBFF00);

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
          color: neonGreen,
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Center(
          child: Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
