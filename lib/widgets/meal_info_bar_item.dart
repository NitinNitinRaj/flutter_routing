import 'package:flutter/material.dart';

class MealInfoBarItem extends StatelessWidget {
  const MealInfoBarItem({
    super.key,
    required this.info,
    required this.icons,
  });

  final String info;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icons),
        const SizedBox(
          width: 6,
        ),
        Text(info)
      ],
    );
  }
}
