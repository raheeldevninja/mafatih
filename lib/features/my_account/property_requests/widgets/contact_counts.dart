import 'package:flutter/material.dart';
import 'package:mafatih/features/my_account/property_requests/model/property_requests_property.dart';
import 'package:mafatih/features/my_account/property_requests/widgets/contact_count.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactCounts extends StatelessWidget {
  const ContactCounts({
    super.key,
    required this.propertyRequest,
  });

  final PropertyRequestsProperties propertyRequest;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        Expanded(
          child: ContactCount(
            value: propertyRequest.statisphonecount.toString(),
            title: l10n.engagedAgentsLabel,
            height: 80,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ContactCount(
            value: propertyRequest.statisviewcount.toString(),
            title: l10n.callsLabel,
            height: 80,
          ),
        ),
        const SizedBox(width: 8),

        Expanded(
          child: ContactCount(
            value: propertyRequest.statisemailcount.toString(),
            title: l10n.emailsLabel,
            height: 80,
          ),
        ),
        const SizedBox(width: 8),

        Expanded(
          child: ContactCount(
            value: propertyRequest.statiswhatsappcount.toString(),
            title: l10n.whatsappLabel,
            height: 80,
          ),
        ),
      ],
    );
  }
}