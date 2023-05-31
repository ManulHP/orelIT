import 'package:flutter/material.dart';
import '../../../util/styles.dart';

class BottomIcons extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Color color;
  const BottomIcons({Key? key, required this.title, this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        Text(title, style: kFont12(context, color: color),)
      ],
    );
  }
}
