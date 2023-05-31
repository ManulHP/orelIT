import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// shimmer loader
Widget shimmerLoader({Widget? child}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade200,
    highlightColor: Colors.grey.shade300,
    child: child ??
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
        ),
  );
}
