import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/features/my_account/complains/model/complain.dart';


class ComplainItem extends StatelessWidget {
  const ComplainItem({
    super.key,
    required this.complain,
  });

  final Complain complain;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                const Text(
                  'Complain No: ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Expanded(
                  child: Text(
                    complain.complainNo,
                    style: const TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),

                const Text(
                  'Status: ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),

                //rounded corner container
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    complain.status,
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

                      const Text(
                        'Subject: ',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        complain.subject,
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),

                    ],
                  ),
                ),


                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Priority: ',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),

                      Text(
                        complain.priority,
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
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
                const Text(
                  'Message: ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  complain.message,
                  style: const TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
