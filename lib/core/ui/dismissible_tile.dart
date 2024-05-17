import 'package:flutter/material.dart' hide ConfirmDismissCallback;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mafatih/core/app/app_colors.dart';

class DismissibleTile extends StatelessWidget {
  const DismissibleTile({
    required this.child,
    required this.onDeleteDismissed,
    required this.onDeleteConfirmDismiss,
    this.onCompleteDismissed,
    this.onCompleteConfirmDismiss,
    this.isCompleted = false,
    super.key,
  });

  final Widget child;
  final VoidCallback onDeleteDismissed;
  final ConfirmDismissCallback onDeleteConfirmDismiss;

  final VoidCallback? onCompleteDismissed;
  final ConfirmDismissCallback? onCompleteConfirmDismiss;
  final bool? isCompleted;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.25,
        dismissible: DismissiblePane(
          onDismissed: onDeleteDismissed,
          closeOnCancel: true,
          confirmDismiss: onDeleteConfirmDismiss,
        ),
        children: [
          SlidableAction(
            onPressed: (context) async {
              if (await onDeleteConfirmDismiss.call()) {
                onDeleteDismissed();
              }
            },
            autoClose: true,
            backgroundColor: AppColors.redColor.withOpacity(0.2),
            foregroundColor: AppColors.redColor,
            icon: Icons.delete,
          ),
        ],
      ),
      child: child,
    );
  }
}
