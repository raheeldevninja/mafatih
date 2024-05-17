import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShineShimmer extends StatelessWidget {
  const ShineShimmer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.grey[100]!,
          Colors.grey[600]!,
          Colors.grey[300]!,
        ],
        stops: const [0.4, 0.5, 0.6],
      ),
      child: child,
    );
  }
}
