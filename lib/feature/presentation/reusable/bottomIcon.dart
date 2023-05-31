import 'package:flutter/material.dart';

import '../../../util/styles.dart';

class BottomIcons extends StatelessWidget {
  final IconData? icon;
  final String title;
  const BottomIcons({Key? key, required this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Text(title, style: kPoppinsFont12(context),)
      ],
    );
  }
}
