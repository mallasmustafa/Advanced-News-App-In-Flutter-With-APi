import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class LoadingContainer extends StatelessWidget {
  final double height;
  final double width;
  const LoadingContainer({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.background,
      highlightColor: Theme.of(context).colorScheme.primaryContainer,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );
  }
}
