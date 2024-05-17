import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/features/my_account/complains/model/complains_response.dart';
import 'package:mafatih/features/my_account/complains/model/complaint.dart';
import 'package:mafatih/features/my_account/complains/view_model/complains_provider.dart';
import 'package:provider/provider.dart';


class ComplainItem extends StatelessWidget {
  const ComplainItem({
    super.key,
    required this.complain,
  });

  final Complaints complain;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;
    final complainsProvider = Provider.of<ComplainsProvider>(context);


    return Dismissible(
      key: Key(complain.id.toString()),
      dismissThresholds: const {
        DismissDirection.endToStart: 0.75,
      },
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: AppColors.redColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Images.deleteIcon, width: 32, height: 32, color: AppColors.redColor),
            const SizedBox(height: 8),
            Text('Delete', style: context.textTheme.bodySmall,),
          ],
        ),
      ),
      onDismissed: (direction) async {

        if(direction == DismissDirection.startToEnd) {
          return;
        }

        await complainsProvider.deleteComplain(context, complain.id!);

        if(!context.mounted) {
          return;
        }

        await complainsProvider.getComplains(context);


      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            //complain no and status row
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    l10n.complainsNoLabel,
                    style: context.textTheme.bodySmall,
                  ),
                  Expanded(
                    child: Text(
                      complain.id.toString() ?? '',
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
                      complain.statusTitle ?? '',
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),


                ],
              ),
            ),

            const SizedBox(height: 16),

            //subject and priority row
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(

                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          l10n.subjectLabel,
                          style: context.textTheme.bodySmall,
                        ),

                        Text(
                          complain.type ?? '',
                          style: context.textTheme.bodyMedium,
                        ),

                      ],
                    ),
                  ),


                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.priorityLabel,
                          style: context.textTheme.bodySmall,
                        ),

                        Text(
                          //complain.priority,
                          '',
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),

            //message
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        l10n.messageLabel,
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Text(
                    complain.comment ?? '',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
