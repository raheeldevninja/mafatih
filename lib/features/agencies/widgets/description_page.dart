import 'package:flutter/material.dart';
import 'package:mafatih/core/ui/main_heading.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          MainHeading(heading: 'Description'),

          const SizedBox(height: 20),

          Text(
            'We aspire to be a distinguished company at the local level by providing real estate at the best prices '
            'and in multiple places. The Salman Housing Company is characterized by accuracy in work, '
            'speed in achievement, fulfillment and punctuality, working in a team spirit with our '
            'customers to always be at the best of our customers’ expectations.',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),


        ],
      ),
    );
  }
}
