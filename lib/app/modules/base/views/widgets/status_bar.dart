import 'package:flutter/material.dart';

class StatusItem {
  final String label;
  final String value;
  final TextStyle? style;

  StatusItem({
    required this.label,
    required this.value,
    this.style,
  });
}

class StatusBar extends StatelessWidget {
  const StatusBar({
    super.key,
    required this.items,
    this.textStyle,
    this.spacing = 16.0,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
  });

  final List<StatusItem> items;
  final TextStyle? textStyle;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: items.map((item) {
          return RichText(
            text: TextSpan(
              text: "${item.label}: ",
              style:
                  item.style ?? textStyle ?? DefaultTextStyle.of(context).style,
              children: [
                TextSpan(text: item.value),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
