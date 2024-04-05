import 'package:flutter/material.dart';
import 'package:mafatih/core/ui/main_heading.dart';

class AboutProject extends StatelessWidget {
  const AboutProject({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        MainHeading(heading: 'About Project'),

        SizedBox(height: 16),

        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut.',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
