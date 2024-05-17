import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/my_account/property_requests/model/property_requests_property.dart';


class RequestNoStatus extends StatelessWidget {
  const RequestNoStatus({
    super.key,
    required this.propertyRequest,
  });

  final PropertyRequestsProperties propertyRequest;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        Text(
          l10n.requestNumberLabel,
          style: context.textTheme.bodySmall,
        ),
        Expanded(
          child: Text(
            propertyRequest.id.toString(),
            style: context.textTheme.bodyMedium,
          ),
        ),

        Text(
          l10n.statusLabel,
          style: context.textTheme.bodySmall,
        ),

        //rounded corner container
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
              propertyRequest.statustext!,
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              )
          ),
        ),
      ],
    );
  }
}