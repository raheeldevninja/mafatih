import 'package:flutter/material.dart';

class MainHeading extends StatelessWidget {
  const MainHeading({
    required this.heading,
    super.key});

  final String heading;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
