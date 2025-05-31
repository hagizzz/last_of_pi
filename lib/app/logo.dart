import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_circular_text/circular_text.dart';

class Logo extends StatefulWidget {
  const Logo({
    super.key,
  });

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 200,
      // height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _animationController.value * 2 * pi,
                child: CircularText(
                  children: [
                    TextItem(
                      text: Text(
                        "3.1415926535897932384626",
                        style: GoogleFonts.lexendDeca(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      space: 14,
                      startAngle: 0,
                      startAngleAlignment: StartAngleAlignment.center,
                      direction: CircularTextDirection.clockwise,
                    ),
                  ],
                  radius: 60,
                  position: CircularTextPosition.outside,
                ),
              );
            },
          ),
          Transform.translate(
            offset: const Offset(0, -10),
            child: Text(
              "π",
              style: GoogleFonts.bubblegumSans(
                fontSize: 160,
                shadows: [
                  Shadow(
                    color: Theme.of(context).colorScheme.primary,
                    offset: const Offset(3.0, 3.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
